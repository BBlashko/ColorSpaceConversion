/* Color Space Conversion
 * Authors: Brett Blashko
 *          Brandon Harvey
 * Date Created: July 6, 2017
 * Modified Date: July 6, 2017
 * Purpose: Optimize Color Space conversions
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "image.h"

/* Main Functionality */
// Convert 1 RBG pixel to 1 YCC pixel, storing that YCC pixel in a YCC matrix
YCC** rgb_to_ycc(RGB** rgb_matrix, int width, int height){
    YCC** ycc_matrix = allocate_ycc_matrix(width, height);
    YCC ycc_pixel;
    RGB rgb_pixel;

    int i, j;
    for(i = 0; i < height; i++){
        for(j = 0; j < width; j++){
            // Read in an RGB pixel
            rgb_pixel = rgb_matrix[i][j];

            // Convert that RGB pixel to YCC and write to the YCC matrix
            ycc_pixel.y = 16 + (0.257*rgb_pixel.r) + (0.504*rgb_pixel.g) + (0.098*rgb_pixel.b);
            ycc_pixel.cb = 128 - (0.148*rgb_pixel.r) - (0.291*rgb_pixel.g) + (0.439*rgb_pixel.b);
            ycc_pixel.cr = 128 + (0.439*rgb_pixel.r) - (0.368*rgb_pixel.g) - (0.071*rgb_pixel.b);

            ycc_matrix[i][j] = ycc_pixel;

        }
    }
    return ycc_matrix;
}

int clip(float in){
    if(in > 255) return 255;
    else if(in < 0) return 0;
    else return (uint8_t)in;
}

// Convert 1 YCC pixel to 1 RBG pixel, storing that RBG pixel in a RGB matrix
RGB** ycc_to_rgb(YCC** ycc_matrix, int width, int height){
    RGB** rgb_matrix = allocate_rgb_matrix(width, height);
    YCC ycc_pixel;
    RGB rgb_pixel;

    int i, j;
    for(i = 0; i < height; i++){
        for(j = 0; j < width; j++){
            // Read in a YCC pixel
            ycc_pixel = ycc_matrix[i][j];

            // Convert each YCC pixel to
            // Must perform clipping to ensure saturation
            rgb_pixel.r = clip(1.164*(ycc_pixel.y - 16) + 1.596*(ycc_pixel.cr - 128));
            rgb_pixel.g = clip(1.164*(ycc_pixel.y - 16) - 0.813*(ycc_pixel.cr - 128) - 0.391*(ycc_pixel.cb - 128));
            rgb_pixel.b = clip(1.164*(ycc_pixel.y - 16) + 2.018*(ycc_pixel.cb - 128));

            rgb_matrix[i][j] = rgb_pixel;
        }
    }
    return rgb_matrix;
}

// Downsample 4 ycc pixels into 1 meta ycc pixel
meta_YCC ycc_normal_to_meta(YCC ycc_pixel1, YCC ycc_pixel2, YCC ycc_pixel3, YCC ycc_pixel4){
    meta_YCC meta_ycc;
    float cb_avg = 0, cr_avg = 0;

    meta_ycc.y1 = ycc_pixel1.y;
    cb_avg += ycc_pixel1.cb;
    cr_avg += ycc_pixel1.cr;

    meta_ycc.y2 = ycc_pixel2.y;
    cb_avg += ycc_pixel2.cb;
    cr_avg += ycc_pixel2.cr;

    meta_ycc.y3 = ycc_pixel3.y;
    cb_avg += ycc_pixel3.cb;
    cr_avg += ycc_pixel3.cr;

    meta_ycc.y4 = ycc_pixel4.y;
    cb_avg += ycc_pixel4.cb;
    cr_avg += ycc_pixel4.cr;

    // Average the cb components
    meta_ycc.cb = cb_avg/4;

    // Average the cr components
    meta_ycc.cr = cr_avg/4;

    return meta_ycc;
}

meta_YCC** ycc_downsample(YCC** ycc_matrix, int width, int height){
    meta_YCC** ycc_matrix_downsampled = allocate_meta_ycc_matrix(width/2, height/2);
    YCC ycc_pixel1, ycc_pixel2, ycc_pixel3, ycc_pixel4;
    meta_YCC meta_ycc_pixel;

    int i, j;
    int a = 0, b = 0;
    for(i = 0; i < height/2; i++){
        b = 0;
        for(j = 0; j < width/2; j++){
            ycc_pixel1 = ycc_matrix[a][b];
            ycc_pixel2 = ycc_matrix[a][b+1];
            ycc_pixel3 = ycc_matrix[a+1][b];
            ycc_pixel4 = ycc_matrix[a+1][b+1];

            meta_ycc_pixel = ycc_normal_to_meta(ycc_pixel1, ycc_pixel2, ycc_pixel3, ycc_pixel4);

            ycc_matrix_downsampled[i][j] = meta_ycc_pixel;
            b += 2;
        }
            a += 2;
    }
    return ycc_matrix_downsampled;
}

// Take in a YCC meta pixel and return the 4 YCC pixels
ycc_array* ycc_meta_to_normal(meta_YCC meta_ycc_pixel, ycc_array *ycc_array){
    ycc_array->ycc_pixel1.y = meta_ycc_pixel.y1;
    ycc_array->ycc_pixel2.y = meta_ycc_pixel.y2;
    ycc_array->ycc_pixel3.y = meta_ycc_pixel.y3;
    ycc_array->ycc_pixel4.y = meta_ycc_pixel.y4;

    ycc_array->ycc_pixel1.cb = meta_ycc_pixel.cb;
    ycc_array->ycc_pixel2.cb = meta_ycc_pixel.cb;
    ycc_array->ycc_pixel3.cb = meta_ycc_pixel.cb;
    ycc_array->ycc_pixel4.cb = meta_ycc_pixel.cb;

    ycc_array->ycc_pixel1.cr = meta_ycc_pixel.cr;
    ycc_array->ycc_pixel2.cr = meta_ycc_pixel.cr;
    ycc_array->ycc_pixel3.cr = meta_ycc_pixel.cr;
    ycc_array->ycc_pixel4.cr = meta_ycc_pixel.cr;

    return ycc_array;
}

// Upsample 1 Cr (or Cb) value to get 4 Cr (or Cb) values
YCC** ycc_upsample(meta_YCC** ycc_matrix_downsampled, int width, int height){
    YCC** ycc_matrix_upsampled = allocate_ycc_matrix(width, height);
    ycc_array *ycc_array1 = malloc(sizeof(ycc_array)*4);

    int i, j;
    int a = 0, b = 0;
    for(i = 0; i < height/2; i++){
        b = 0;
        for(j = 0; j < width/2; j++){
            ycc_array *ycc_array2 = malloc(sizeof(ycc_array)*4);
            ycc_array1 = ycc_meta_to_normal(ycc_matrix_downsampled[i][j], ycc_array2);
            free(ycc_array2);

            ycc_matrix_upsampled[a][b] = ycc_array1->ycc_pixel1;
            ycc_matrix_upsampled[a][b+1] = ycc_array1->ycc_pixel2;
            ycc_matrix_upsampled[a+1][b] = ycc_array1->ycc_pixel3;;
            ycc_matrix_upsampled[a+1][b+1] = ycc_array1->ycc_pixel4;

            b += 2;
        }
            a += 2;
    }

    return ycc_matrix_upsampled;
}

int main(int argc, char **argv)
{
    //Load a BMP image
    FILE* file;
    BMP_Header image_info;

    if (argc != 2) {
        printf("Usage: main <image_filename.bmp");
        exit(1);
    }

    file = fopen(argv[1], "r");
    image_info = read_header_info(file);
    RGB** rgb_matrix = load_image(file, image_info.width, image_info.height);
    RGB** rgb_matrix2 = allocate_rgb_matrix(file, image_info.width, image_info.height);
    YCC** ycc_matrix = allocate_ycc_matrix(image_info.width, image_info.height);
    meta_YCC** ycc_matrix_downsampled = allocate_meta_ycc_matrix(image_info.width/2, image_info.height/2);
    YCC** ycc_matrix_upsampled = allocate_ycc_matrix(image_info.width, image_info.height);

    // Convert to YCC
    ycc_matrix = rgb_to_ycc(rgb_matrix, image_info.width, image_info.height);

    // downsample and upsample
    ycc_matrix_downsampled = ycc_downsample(ycc_matrix, image_info.width, image_info.height);
    ycc_matrix_upsampled = ycc_upsample(ycc_matrix_downsampled, image_info.width, image_info.height);

    // Convert back to RGB
    rgb_matrix2 = ycc_to_rgb(ycc_matrix_upsampled, image_info.width, image_info.height);
    
    //save_RGB_image("trainRGB.bmp", image_info, rgb_matrix2);
    fclose(file);

    free(rgb_matrix);
    free(rgb_matrix2);
    free(ycc_matrix);
    return 0;
}

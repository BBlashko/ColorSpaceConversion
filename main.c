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

            // printf("%d %d\n", i, j);
            ycc_matrix[i][j] = ycc_pixel;

        }
    }
    return ycc_matrix;
}

//TODO reformat this!
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

/*// Downsample 4 ycc pixels into 1
YCC** ycc_downsample(YCC** ycc_matrix){
    YCC** ycc_matrix_downsampled = allocate_ycc_matrix(image_info.width/4, image_info.height/4);
    for(int i = 0; i < image_info.width/4; i++){
        for(int j = 0; j < image_info.height/4; j++){
            ycc_matrix_downsampled[i][j]->y = ycc

            ycc_matrix->y1 = ycc_pixel1->y;
            ycc_matrix->y2 = ycc_pixel2->y;
            ycc_matrix->y3 = ycc_pixel3->y;
            ycc_matrix->y4 = ycc_pixel4->y;

            // Average the cb components
            ycc_matrix->cb = (ycc_pixel1->cb + ... + ycc_pixel4->cb)/4

            // Average the cr components
            ycc_matrix->cr = (ycc_matrix->cr1 + ... + ycc_matrix->cb4)/4

    return downsampled_ycc_matrix
}

// Upsample 1 Cr (or Cb) value to get 4 Cr (or Cb) values
ycc_matrix ycc_upsample(ycc_matrix){
    for(rows in image)
        for(columns in image)
            //split out each y1, y2, y3, y4 component into their respective pixels
            //set each pixels cb and cr values equal to the average cb and cr values
            // in the downsampled ycc pixel

    return upsampled_ycc_matrix
}*/

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

    //test pixel
    //printf("%d %d %d\n", pixel_matrix[0][0].r, pixel_matrix[0][0].g, pixel_matrix[0][0].b);

    printf("Converting RGB matrix to YCC matrix\n");
    ycc_matrix = rgb_to_ycc(rgb_matrix, image_info.width, image_info.height);
    printf("Converting YCC matrix to RGB matrix\n");
    rgb_matrix2 = ycc_to_rgb(ycc_matrix, image_info.width, image_info.height);

    save_YCC_image("trainYCC.bmp", image_info, ycc_matrix, 1);
    save_RGB_image("trainRGB.bmp", image_info, rgb_matrix2);
    fclose(file);

    free(rgb_matrix);
    free(rgb_matrix2);
    free(ycc_matrix);
    return 0;
}

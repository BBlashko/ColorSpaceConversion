/* Color Space Conversion
 * Authors: Brett Blashko
 *          Brandon Harvey
 * Date Created: July 6, 2017
 * Modified Date: August 3, 2017
 * Purpose: Optimize Color Space conversions
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "image.h"

//Factor value (2^16)
#define R_Y_FACTOR 16843
#define G_Y_FACTOR 33030
#define B_Y_FACTOR 6423

#define R_CB_FACTOR -9699
#define G_CB_FACTOR -19071
#define B_CB_FACTOR 28770

#define R_CR_FACTOR 28770
#define G_CR_FACTOR -24117
#define B_CR_FACTOR -4653

//Division shift FP factor RGB -> YCC
#define YCC_RGB_BITSHIFT 16

//YCC to RGB factors (2^16)
#define Y_R_FACTOR 76284
#define CR_R_FACTOR 104595
#define CR_G_FACTOR 53281
#define CB_G_FACTOR 25625
#define CB_B_FACTOR 132252

/* Main Functionality */
// Convert 1 RBG pixel to 1 YCC pixel, storing that YCC pixel in a YCC matrix
meta_YCC** rgb_to_ycc(RGB** rgb_matrix, YCC_Data ycc_data){
    int width = ycc_data.width >> 1;
    int height = ycc_data.height >> 1;

    //downsampled meta data to be transmitted.
    meta_YCC** ycc_matrix_downsampled = allocate_meta_ycc_matrix(width, height);

    register uint8_t r, g, b;
    int cb, cr = 0;

    unsigned int row, next_row, col, next_col = 0;
    unsigned int i, j;
    for(i = 0; i < height; i++){
        row = i << 1;
        next_row = (i << 1) + 1;
        for(j = 0; j < width; j++){
            col = j << 1;
            next_col = (j << 1) + 1;
            cb = cr = 0;

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[row][col].r;
            g = rgb_matrix[row][col].g;
            b = rgb_matrix[row][col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y1 = 16 +  (((R_Y_FACTOR * r) + (G_Y_FACTOR * g) + (B_Y_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cb += (((R_CB_FACTOR * r) + (G_CB_FACTOR * g) + (B_CB_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cr += (((R_CR_FACTOR * r) + (G_CR_FACTOR * g) + (B_CR_FACTOR * b)) >> YCC_RGB_BITSHIFT);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[row][next_col].r;
            g = rgb_matrix[row][next_col].g;
            b = rgb_matrix[row][next_col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y2 = 16 + (((R_Y_FACTOR * r) + (G_Y_FACTOR * g) + (B_Y_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cb += (((R_CB_FACTOR * r) + (G_CB_FACTOR * g) + (B_CB_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cr += (((R_CR_FACTOR * r) + (G_CR_FACTOR * g) + (B_CR_FACTOR * b)) >> YCC_RGB_BITSHIFT);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[next_row][col].r;
            g = rgb_matrix[next_row][col].g;
            b = rgb_matrix[next_row][col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y3 = 16 + (((R_Y_FACTOR * r) + (G_Y_FACTOR * g) + (B_Y_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cb += (((R_CB_FACTOR * r) + (G_CB_FACTOR * g) + (B_CB_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cr += (((R_CR_FACTOR * r) + (G_CR_FACTOR * g) + (B_CR_FACTOR * b)) >> YCC_RGB_BITSHIFT);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[next_row][next_col].r;
            g = rgb_matrix[next_row][next_col].g;
            b = rgb_matrix[next_row][next_col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y4 = 16 + (((R_Y_FACTOR * r) + (G_Y_FACTOR * g) + (B_Y_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cb += (((R_CB_FACTOR * r) + (G_CB_FACTOR * g) + (B_CB_FACTOR * b)) >> YCC_RGB_BITSHIFT);
            cr += (((R_CR_FACTOR * r) + (G_CR_FACTOR * g) + (B_CR_FACTOR * b)) >> YCC_RGB_BITSHIFT);

            //Downsample (average the YCC values of a 2x2 pixel matrix to a single pixel)
      			cb = cb >> 2;
      			cr = cr >> 2;

            ycc_matrix_downsampled[i][j].cb = cb + 128;
            ycc_matrix_downsampled[i][j].cr = cr + 128;
        }
    }
    return ycc_matrix_downsampled;
}

inline uint8_t clip(int in){
    return (uint8_t) (in > 255 ? 255 : (in < 0 ? 0 : in));
}

// Convert 1 YCC pixel to 1 RBG pixel, storing that RBG pixel in a RGB matrix
void ycc_to_rgb(meta_YCC** meta_ycc_pixel, RGB_Data rgb_data){
    RGB** rgb_matrix = rgb_data.rgb_matrix;
    int width = rgb_data.width >> 1;
    int height = rgb_data.height >> 1;

    YCC ycc_pixel1;
    YCC ycc_pixel2;
    YCC ycc_pixel3;
    YCC ycc_pixel4;
    unsigned int row, next_row, col, next_col = 0;
    int i, j;
    for(i = 0; i < height; i++){
        row = i << 1;
        next_row = (i << 1) + 1;
        for(j = 0; j < width; j++){
            col = j << 1;
            next_col = (j << 1) + 1;
            //convert meta data into 4 pixels.
            ycc_pixel1.y = meta_ycc_pixel[i][j].y1;
            ycc_pixel1.cb = meta_ycc_pixel[i][j].cb;
            ycc_pixel1.cr = meta_ycc_pixel[i][j].cr;

            ycc_pixel2.y = meta_ycc_pixel[i][j].y2;
            ycc_pixel2.cb = meta_ycc_pixel[i][j].cb;
            ycc_pixel2.cr = meta_ycc_pixel[i][j].cr;

            ycc_pixel3.y = meta_ycc_pixel[i][j].y3;
            ycc_pixel3.cb = meta_ycc_pixel[i][j].cb;
            ycc_pixel3.cr = meta_ycc_pixel[i][j].cr;

            ycc_pixel4.y = meta_ycc_pixel[i][j].y4;
            ycc_pixel4.cb = meta_ycc_pixel[i][j].cb;
            ycc_pixel4.cr = meta_ycc_pixel[i][j].cr;

            int y1 = Y_R_FACTOR * (ycc_pixel1.y - 16);
            int y2 = Y_R_FACTOR * (ycc_pixel2.y - 16);
            int y3 = Y_R_FACTOR * (ycc_pixel3.y - 16);
            int y4 = Y_R_FACTOR * (ycc_pixel4.y - 16);

            // Convert each YCC pixel to RGB
            // Must perform clipping to ensure saturation
            rgb_matrix[row][col].r = clip((y1 + CR_R_FACTOR * (ycc_pixel1.cr - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[row][col].g = clip((y1 - CR_G_FACTOR * (ycc_pixel1.cr - 128) - CB_G_FACTOR * (ycc_pixel1.cb - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[row][col].b = clip((y1 + CB_B_FACTOR * (ycc_pixel1.cb - 128)) >>  YCC_RGB_BITSHIFT);

            rgb_matrix[row][next_col].r = clip((y2 + CR_R_FACTOR * (ycc_pixel2.cr - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[row][next_col].g = clip((y2 - CR_G_FACTOR * (ycc_pixel2.cr - 128) - CB_G_FACTOR * (ycc_pixel2.cb - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[row][next_col].b = clip((y2 + CB_B_FACTOR * (ycc_pixel2.cb - 128)) >>  YCC_RGB_BITSHIFT);

            rgb_matrix[next_row][col].r = clip((y3 + CR_R_FACTOR * (ycc_pixel3.cr - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[next_row][col].g = clip((y3 - CR_G_FACTOR * (ycc_pixel3.cr - 128) - CB_G_FACTOR * (ycc_pixel3.cb - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[next_row][col].b = clip((y3 + CB_B_FACTOR * (ycc_pixel3.cb - 128)) >>  YCC_RGB_BITSHIFT);

            rgb_matrix[next_row][next_col].r = clip((y4 + CR_R_FACTOR * (ycc_pixel4.cr - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[next_row][next_col].g = clip((y4 - CR_G_FACTOR * (ycc_pixel4.cr - 128) - CB_G_FACTOR * (ycc_pixel4.cb - 128)) >>  YCC_RGB_BITSHIFT);
            rgb_matrix[next_row][next_col].b = clip((y4 + CB_B_FACTOR * (ycc_pixel4.cb - 128)) >>  YCC_RGB_BITSHIFT);
        }
    }
    rgb_data.rgb_matrix = rgb_matrix;
}

int main(int argc, char **argv)
{
    //Load a BMP image
    FILE* file;
    BMP_Header image_info;

    if (argc != 2) {
        printf("Usage: main <image_filename.bmp>");
        exit(1);
    }

    file = fopen(argv[1], "r");
    image_info = read_header_info(file);
    RGB_Data image_rgb_data = load_image(file, image_info.width, image_info.height);

    //Convert RGB -> YCC meta data
    //printf("Converting RGB matrix to YCC matrix, and performing a downsampling\n");
    YCC_Data ycc_data = allocate_ycc_data(image_info.width, image_info.height);
    meta_YCC** ycc_matrix_downsampled = rgb_to_ycc(image_rgb_data.rgb_matrix, ycc_data);

    ////////////////////////////////////////////////////////////////////////////
    //Comment if YCC downsampled images are not needed
    ////////////////////////////??//////////////////////////////////////////////
    /*int height = image_info.height >> 1;
    int width = image_info.width >> 1;
    int i, j;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            ycc_data.ycc_matrix[i][j].y = ycc_matrix_downsampled[i][j].y1;
            ycc_data.ycc_matrix[i][j].cb = ycc_matrix_downsampled[i][j].cb;
            ycc_data.ycc_matrix[i][j].cr = ycc_matrix_downsampled[i][j].cr;
        }
    }*/
    //save_YCC_image("trainYCC.bmp", image_info, ycc_data, 1);
    ////////////////////////////////////////////////////////////////////////////

    //Convert YCC meta data -> RGB pixel matrix
    //printf("Converting YCC downsampled meta data matrix to RGB pixel matrix\n");
    RGB_Data rgb_data = allocate_rgb_data(image_info.width, image_info.height);
    ycc_to_rgb(ycc_matrix_downsampled, rgb_data);

    //output RGB matrix to a file.
    //save_RGB_image("trainRGB.bmp", image_info, rgb_data.rgb_matrix);
    fclose(file);

    free(image_rgb_data.rgb_matrix);
    free(rgb_data.rgb_matrix);
    free(ycc_data.ycc_matrix);
    free(ycc_matrix_downsampled);
    return 0;
}

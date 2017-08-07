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

/* Main Functionality */
// Convert 1 RBG pixel to 1 YCC pixel, storing that YCC pixel in a YCC matrix
meta_YCC** rgb_to_ycc(RGB** rgb_matrix, YCC_Data ycc_data){
    int width = ycc_data.width >> 1;
    int height = ycc_data.height >> 1;

    //downsampled meta data to be transmitted.
    meta_YCC** ycc_matrix_downsampled = allocate_meta_ycc_matrix(width, height);

    register uint8_t r, g, b;
    int cb, cr = 0;

    //Division shift FP factor RGB -> YCC
    const uint8_t ycc_rgb_bitshift = 16;

    //Factor value (2^16)
    const int32_t r_y_factor = 16843;
    const int32_t g_y_factor = 33030;
    const int32_t b_y_factor = 6423;

    const int32_t r_cb_factor = -9699;
    const int32_t g_cb_factor = -19071;
    const int32_t b_cb_factor = 28770;

    const int32_t r_cr_factor = 28770;
    const int32_t g_cr_factor = -24117;
    const int32_t b_cr_factor = -4653;

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
            ycc_matrix_downsampled[i][j].y1 = 16 +  (((r_y_factor * r) + (g_y_factor * g) + (b_y_factor * b)) >> ycc_rgb_bitshift);
            cb += (((r_cb_factor * r) + (g_cb_factor * g) + (b_cb_factor * b)) >> ycc_rgb_bitshift);
            cr += (((r_cr_factor * r) + (g_cr_factor * g) + (b_cr_factor * b)) >> ycc_rgb_bitshift);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[row][next_col].r;
            g = rgb_matrix[row][next_col].g;
            b = rgb_matrix[row][next_col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y2 = 16 + (((r_y_factor * r) + (g_y_factor * g) + (b_y_factor * b)) >> ycc_rgb_bitshift);
            cb += (((r_cb_factor * r) + (g_cb_factor * g) + (b_cb_factor * b)) >> ycc_rgb_bitshift);
            cr += (((r_cr_factor * r) + (g_cr_factor * g) + (b_cr_factor * b)) >> ycc_rgb_bitshift);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[next_row][col].r;
            g = rgb_matrix[next_row][col].g;
            b = rgb_matrix[next_row][col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y3 = 16 + (((r_y_factor * r) + (g_y_factor * g) + (b_y_factor * b)) >> ycc_rgb_bitshift);
            cb += (((r_cb_factor * r) + (g_cb_factor * g) + (b_cb_factor * b)) >> ycc_rgb_bitshift);
            cr += (((r_cr_factor * r) + (g_cr_factor * g) + (b_cr_factor * b)) >> ycc_rgb_bitshift);

            // Convert that RGB pixel to YCC and write to the YCC matrix
            r = rgb_matrix[next_row][next_col].r;
            g = rgb_matrix[next_row][next_col].g;
            b = rgb_matrix[next_row][next_col].b;

            //convert to YCC and add for downsampling
            ycc_matrix_downsampled[i][j].y4 = 16 + (((r_y_factor * r) + (g_y_factor * g) + (b_y_factor * b)) >> ycc_rgb_bitshift);
            cb += (((r_cb_factor * r) + (g_cb_factor * g) + (b_cb_factor * b)) >> ycc_rgb_bitshift);
            cr += (((r_cr_factor * r) + (g_cr_factor * g) + (b_cr_factor * b)) >> ycc_rgb_bitshift);

            //Downsample (average the YCC values of a 2x2 pixel matrix to a single pixel)
      			cb = cb >> 2;
      			cr = cr >> 2;

            ycc_matrix_downsampled[i][j].cb = cb + 128;
            ycc_matrix_downsampled[i][j].cr = cr + 128;
        }
    }
    return ycc_matrix_downsampled;
}

static inline uint8_t clip(int in){
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

    //Division shift FP factor RGB -> YCC
    const uint8_t ycc_rgb_bitshift = 16;

    //YCC to RGB factors (2^16)
    const int32_t r_r_factor = 76284;
    const int32_t cr_r_factor = 104595;
    const int32_t cr_g_factor = 53281;
    const int32_t cb_g_factor = 25625;
    const int32_t cb_b_factor = 132252;

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

            int y1 = r_r_factor * (ycc_pixel1.y - 16);
            int y2 = r_r_factor * (ycc_pixel2.y - 16);
            int y3 = r_r_factor * (ycc_pixel3.y - 16);
            int y4 = r_r_factor * (ycc_pixel4.y - 16);

            // Convert each YCC pixel to RGB
            // Must perform clipping to ensure saturation
            rgb_matrix[row][col].r = clip((y1 + cr_r_factor * (ycc_pixel1.cr - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[row][col].g = clip((y1 - cr_g_factor * (ycc_pixel1.cr - 128) - cb_g_factor * (ycc_pixel1.cb - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[row][col].b = clip((y1 + cb_b_factor * (ycc_pixel1.cb - 128)) >>  ycc_rgb_bitshift);

            rgb_matrix[row][next_col].r = clip((y2 + cr_r_factor * (ycc_pixel2.cr - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[row][next_col].g = clip((y2 - cr_g_factor * (ycc_pixel2.cr - 128) - cb_g_factor * (ycc_pixel2.cb - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[row][next_col].b = clip((y2 + cb_b_factor * (ycc_pixel2.cb - 128)) >>  ycc_rgb_bitshift);

            rgb_matrix[next_row][col].r = clip((y3 + cr_r_factor * (ycc_pixel3.cr - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[next_row][col].g = clip((y3 - cr_g_factor * (ycc_pixel3.cr - 128) - cb_g_factor * (ycc_pixel3.cb - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[next_row][col].b = clip((y3 + cb_b_factor * (ycc_pixel3.cb - 128)) >>  ycc_rgb_bitshift);

            rgb_matrix[next_row][next_col].r = clip((y4 + cr_r_factor * (ycc_pixel4.cr - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[next_row][next_col].g = clip((y4 - cr_g_factor * (ycc_pixel4.cr - 128) - cb_g_factor * (ycc_pixel4.cb - 128)) >>  ycc_rgb_bitshift);
            rgb_matrix[next_row][next_col].b = clip((y4 + cb_b_factor * (ycc_pixel4.cb - 128)) >>  ycc_rgb_bitshift);
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
    RGB_Data rgb_data = allocate_rgb_data(image_info.width, image_info.height);
    ycc_to_rgb(ycc_matrix_downsampled, rgb_data);

    //output RGB matrix to a file.
    save_RGB_image("trainRGB.bmp", image_info, rgb_data.rgb_matrix);
    fclose(file);

    free(image_rgb_data.rgb_matrix);
    free(rgb_data.rgb_matrix);
    free(ycc_data.ycc_matrix);
    free(ycc_matrix_downsampled);
    return 0;
}

/* Color Space Conversion
 * Authors: Brett Blashko
 *          Brandon Harvey
 * Date Created: July 6, 2017
 * Modified Date: July 6, 2017
 * Purpose: Optimize Color Space conversions
 */

/* TODO
 * - Read in BMP file and throw data into data structure we can work with
 * - Convert RGB pixel to YCC pixel
 *  - From here we can apply downsampling to convert 4 Cr (or Cb) pixels
	  into a single Cr (or Cb) pixel
 * - Upsample the single Cr (or Cb) pixel to obtain the original 4 Cr (or Cb) pixels
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "image.h"

// Convert 1 RBG pixel to 1 YCC pixel
ycc_matric rgb_to_ycc(rgb_matrix){
    for(rows in image)
        for(columns in image)
            read r, g, b values
            y = 16 + (0.257*r) + (0.504*g) + (0.098*b);
            cb = 128 - (0.148*r) - (0.291*g) + (0.439*b);
            cr = 128 + (0.439*r) - (0.368*g) - (0.071*b);

    return ycc_matrix
}

//TODO reformat this!
int clip(float in){
    if(in > 255) return 255;
    else if(in < 0) return 0;
    else return (uint8_t)in;
}

// Convert 1 YCC pixel to 1 RBG pixel
rbg_matrix ycc_to_rgb(ycc_matrix){
    for(rows in image)
        for(columns in image)
            read y, cr, cb
            // Must perform clipping to ensure saturation
            r = 1.164*(y - 16) + 1.596*(cr - 128);
            g = 1.164*(y - 16) - 0.813*(cr - 128) - 0.391*(cb - 128);
            b = 1.164*(y - 16) + 2.018*(cb - 128);

    return rgb_matrix
}

// Downsample 4 ycc pixels into 1
ycc_matrix ycc_downsample(ycc_matrix){
    for(rows in image)
        for(columns in image)
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
    RGB** pixel_matrix = load_image(file, image_info.width, image_info.height);

    //test pixel
    printf("%d %d %d\n", pixel_matrix[0][0].r, pixel_matrix[0][0].g, pixel_matrix[0][0].b);

    free(pixel_matrix);
    return 0;
}

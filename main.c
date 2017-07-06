/* Color Space Conversion
 * Authors: Brett Blashko
 *          Brandon Harvey
 * Date Created: July 6, 2017
 * Modified Date: July6, 2017
 * Purpose: Optimize Color Space conversions
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.h"

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

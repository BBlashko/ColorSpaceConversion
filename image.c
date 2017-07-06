#include "image.h"

//Allocates the memory for the image RGB pixel matrix
RGB** allocate_rgb_matrix(int width, int height)
{
    RGB** matrix;
    int i;
    matrix = (RGB **) malloc (sizeof (RGB*) * height);
    if (matrix == NULL){
        perror("[ERROR] No memory available for allocation of RGB matrix!");
        exit(0);
    }
    for (i=0;i<height;i++){
        matrix[i] = (RGB *) malloc (sizeof(RGB) * width);
        if (matrix[i] == NULL){
        perror("[Error] No more memory available for each RGB row allocation!");
            exit(0);
        }
    }
    return matrix;
}

BMP_Header read_header_info(FILE* file)
{
    BMP_Header info;
    char type[3];
    fseek(file,0,0);
    fread(type,1,2,file);
    type[2] = '\0';

    if (strcmp(type, "BM") == 1) {
      printf("\nThe file is not in BMP format.\n");
    }

    fseek(file, 18, 0);

    // Image Width and height
    fseek(file, 18, 0);
    fread(&info.width, 1, 4, file);
    fseek(file, 22, 0);
    fread(&info.height, 1, 4, file);

    //BPP (bits per pixel)
    fseek(file, 28, 0);
    fread(&info.bpp, 1, 2, file);

    if (info.bpp != 24)
    {
        printf("\nThe file does not have 24 bits per pixel.\n");
        exit(0);
    }

    // Compression type
    // 0 = Normmally
    // 1 = 8 bits per pixel
    // 2 = 4 bits per pixel
    fseek(file, 30, 0);
    fread(&info.compression, 1, 4, file);

    // Image size in bytes
    fseek(file, 34, 0);
    fread(&info.imagesize, 1, 4, file);

    // Number of color used (NCL)
    // value = 0 for full color set
    fseek(file, 46, 0);
    fread(&info.colours, 1, 4, file);

    // Number of important color (NIC)
    // value = 0 means all collors important
    fseek(file, 50, 0);
    fread(&info.impcolours, 1, 4, file);

    return info;
}

RGB** load_image(FILE* file, int width, int height)
{
    RGB** matrix = allocate_rgb_matrix(width, height);

    int i,j;
    RGB tmp;
    long pos = 51;

    fseek(file, 0, 0);
    for (i = 0; i < height; i++){
        for (j = 0; j < width; j++){
            pos += 3;
            fseek(file, pos, 0);
            fread(&tmp.b, (sizeof(uint8_t)), 1, file);
            fread(&tmp.g, (sizeof(uint8_t)), 1, file);
            fread(&tmp.r, (sizeof(uint8_t)), 1, file);
            matrix[i][j] = tmp;
        }
    }
    return matrix;
}

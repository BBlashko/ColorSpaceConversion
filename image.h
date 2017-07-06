#ifndef IMAGE_H
#define IMAGE_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct RGB
{
    uint8_t r;
    uint8_t g;
    uint8_t b;
} RGB;

typedef struct
{
    unsigned int size;
    int width;
    int height;
    unsigned short int planes;
    unsigned short int bpp;
    unsigned int compression;
    unsigned int imagesize;
    int xresolution;
    int yresolution;
    unsigned int colours;
    unsigned int impcolours;
} BMP_Header;

RGB** allocate_rbg_matrix(int width, int height);
BMP_Header read_header_info(FILE* file);
RGB** load_image(FILE* file, int width, int height);

#endif

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

typedef struct YCC
{
    float y;
    float cb;
    float cr;
} YCC;

typedef struct meta_YCC
{
    float y1;
    float y2;
    float y3;
    float y4;
    float cb;
    float cr;
} meta_YCC;

typedef struct
{
    unsigned int filesize;
    int width;
    int height;
    unsigned short int bpp;
    unsigned int compression;
    unsigned int imagesize;
    unsigned int colours;
    unsigned int impcolours;
} BMP_Header;

RGB** allocate_rbg_matrix(int width, int height);
YCC** allocate_ycc_matrix(int width, int height);
meta_YCC** allocate_meta_ycc_matrix(int width, int height);
BMP_Header read_header_info(FILE* file);
RGB** load_image(FILE* file, int width, int height);
void save_image_header(FILE* file, BMP_Header header);
void save_RGB_image(char * filename, BMP_Header header, RGB** rgb_matrix);
void save_YCC_image(char * filename, BMP_Header header, YCC** rgb_matrix, int save_into_components);

#endif

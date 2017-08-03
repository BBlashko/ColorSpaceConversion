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

typedef struct RGB_Data
{
    RGB** rgb_matrix;
    int width;
    int height;
} RGB_Data;

typedef struct YCC
{
    uint8_t y;
    uint8_t cb;
    uint8_t cr;
} YCC;

typedef struct YCC_Data
{
    YCC** ycc_matrix;
    int width;
    int height;
} YCC_Data;

typedef struct meta_YCC
{
    uint8_t y1;
    uint8_t y2;
    uint8_t y3;
    uint8_t y4;
    uint8_t cb;
    uint8_t cr;
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

RGB_Data allocate_rgb_data(int width, int height);
YCC_Data allocate_ycc_data(int width, int height);
meta_YCC** allocate_meta_ycc_matrix(int width, int height);
BMP_Header read_header_info(FILE* file);
RGB_Data load_image(FILE* file, int width, int height);
void save_image_header(FILE* file, BMP_Header header);
void save_RGB_image(char * filename, BMP_Header header, RGB** rgb_matrix);
void save_YCC_image(char * filename, BMP_Header header, YCC_Data ycc_data, int save_into_components);

#endif

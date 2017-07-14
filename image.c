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

    fseek(file, 2, 0);
    fread(&info.filesize, 1, 4, file);

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

void save_image(char* filename, BMP_Header header, RGB** rgb_matrix) {
    char *result = malloc(strlen("saved_images/")+strlen(filename)+1);//+1 for the zero-terminator
    //in real code you would check for errors in malloc here
    strcpy(result, "saved_images/");
    strcat(result, filename);

    FILE* file = fopen(result, "wb");;

    //write file header
    unsigned char bmpfileheader[14] = {'B', 'M', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0 ,0};
    bmpfileheader[2] = (unsigned char) (header.filesize);
    bmpfileheader[3] = (unsigned char) (header.filesize >> 8);
    bmpfileheader[4] = (unsigned char) (header.filesize >> 16);
    bmpfileheader[5] = (unsigned char) (header.filesize >> 24);

    fwrite (bmpfileheader, 1, 14, file);

    //write info header
    unsigned char bmpinfoheader[40] = {40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0};
    bmpinfoheader[4] = (unsigned char) (header.width);
    bmpinfoheader[5] = (unsigned char) (header.width >> 8);
    bmpinfoheader[6] = (unsigned char) (header.width >> 16);
    bmpinfoheader[7] = (unsigned char) (header.width >> 24);

    bmpinfoheader[8] = (unsigned char) (header.height);
    bmpinfoheader[9] = (unsigned char) (header.height >> 8);
    bmpinfoheader[10] = (unsigned char) (header.height >> 16);
    bmpinfoheader[11] = (unsigned char) (header.height >> 24);

    bmpinfoheader[14] = (unsigned char) (header.bpp);
    bmpinfoheader[15] = (unsigned char) (header.bpp >> 8);

    bmpinfoheader[16] = (unsigned char) (header.compression);
    bmpinfoheader[17] = (unsigned char) (header.compression >> 8);
    bmpinfoheader[18] = (unsigned char) (header.compression >> 16);
    bmpinfoheader[19] = (unsigned char) (header.compression >> 24);

    bmpinfoheader[20] = (unsigned char) (header.imagesize);
    bmpinfoheader[21] = (unsigned char) (header.imagesize >> 8);
    bmpinfoheader[22] = (unsigned char) (header.imagesize >> 16);
    bmpinfoheader[23] = (unsigned char) (header.imagesize >> 24);

    bmpinfoheader[32] = (unsigned char) (header.colours);
    bmpinfoheader[33] = (unsigned char) (header.colours >> 8);
    bmpinfoheader[34] = (unsigned char) (header.colours >> 16);
    bmpinfoheader[35] = (unsigned char) (header.colours >> 24);

    bmpinfoheader[36] = (unsigned char) (header.impcolours);
    bmpinfoheader[37] = (unsigned char) (header.impcolours >> 8);
    bmpinfoheader[38] = (unsigned char) (header.impcolours >> 16);
    bmpinfoheader[39] = (unsigned char) (header.impcolours >> 24);

    fwrite (bmpinfoheader, 1, 40, file);

    //pixel information
    int i,j;
    for (i = 0; i < header.height; i++){
        for (j = 0; j < header.width; j++){
            RGB rgb = rgb_matrix[i][j];
            unsigned char color[3] = { (unsigned char) rgb.b, (unsigned char) rgb.g, (unsigned char) rgb.r };
            fwrite(color, 1, 3, file);
        }
    }

    fclose(file);
}

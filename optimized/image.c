#include "image.h"

//Allocates the memory for the image RGB pixel matrix
RGB_Data allocate_rgb_data(int width, int height)
{
    RGB_Data rgb_data;
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
        perror("[ERROR] No more memory available for each RGB row allocation!");
            exit(0);
        }
    }
    rgb_data.rgb_matrix = matrix;
    rgb_data.width = width;
    rgb_data.height = height;
    return rgb_data;
}

//Allocates the memory for the image YCC pixel matrix
YCC_Data allocate_ycc_data(int width, int height)
{
    YCC_Data ycc_data;
    YCC** matrix;
    int i;
    matrix = (YCC **) malloc (sizeof (YCC*) * height);
    if (matrix == NULL){
        perror("[ERROR] No memory available for allocation of RGB matrix!");
        exit(0);
    }
    for (i=0;i<height;i++){
        matrix[i] = (YCC *) malloc (sizeof(YCC) * width);
        if (matrix[i] == NULL){
        perror("[ERROR] No more memory available for each RGB row allocation!");
            exit(0);
        }
    }

    ycc_data.ycc_matrix = matrix;
    ycc_data.width = width;
    ycc_data.height = height;

    return ycc_data;
}

//Allocates the memory for the image YCC meta pixel matrix
meta_YCC** allocate_meta_ycc_matrix(int width, int height)
{
    meta_YCC** matrix;
    int i;
    matrix = (meta_YCC **) malloc (sizeof (meta_YCC*) * height);
    if (matrix == NULL){
        perror("[ERROR] No memory available for allocation of RGB matrix!");
        exit(0);
    }
    for (i=0;i<height;i++){
        matrix[i] = (meta_YCC *) malloc (sizeof(meta_YCC) * width);
        if (matrix[i] == NULL){
        perror("[ERROR] No more memory available for each RGB row allocation!");
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

RGB_Data load_image(FILE* file, int width, int height)
{
    RGB_Data rgb_data = allocate_rgb_data(width, height);

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
            rgb_data.rgb_matrix[i][j] = tmp;
        }
    }
    return rgb_data;
}

void save_image_header(FILE* file, BMP_Header header) {
    //write file header
    unsigned char bmpfileheader[14] = {'B', 'M', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0 ,0};
    bmpfileheader[2] = (unsigned char) (header.filesize);
    bmpfileheader[3] = (unsigned char) (header.filesize >> 8);
    bmpfileheader[4] = (unsigned char) (header.filesize >> 16);
    bmpfileheader[5] = (unsigned char) (header.filesize >> 24);

    fwrite (bmpfileheader, sizeof(unsigned char), sizeof(bmpfileheader), file);

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
}

void save_RGB_image(char* filename, BMP_Header header, RGB** rgb_matrix) {
    char *result = malloc(strlen("saved_images/")+strlen(filename)+1);
    strcpy(result, "saved_images/");
    strcat(result, filename);

    FILE* file = fopen(result, "wb");;
    save_image_header(file, header);

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

void save_YCC_image(char* filename, BMP_Header header, YCC_Data ycc_data, int save_into_components) {
    char *result = malloc(strlen("saved_images/")+strlen(filename)+1);
    strcpy(result, "saved_images/");
    strcat(result, filename);

    YCC** ycc_matrix = ycc_data.ycc_matrix;

    FILE* file;
    FILE* fileY;
    FILE* fileCb;
    FILE* fileCr;

    file = fopen(result, "wb");;
    save_image_header(file, header);

    if (save_into_components) {
        char *resultY = malloc(strlen(result)+strlen("Y")+1);
        strcpy(resultY, result);
        strcat(resultY, "Y");

        char *resultCb = malloc(strlen(result)+strlen("Cb")+1);
        strcpy(resultCb, result);
        strcat(resultCb, "Cb");

        char *resultCr = malloc(strlen(result)+strlen("Cr")+1);
        strcpy(resultCr, result);
        strcat(resultCr, "Cr");

        fileY = fopen(resultY, "wb");;
        save_image_header(fileY, header);

        fileCb = fopen(resultCb, "wb");;
        save_image_header(fileCb, header);

        fileCr = fopen(resultCr, "wb");;
        save_image_header(fileCr, header);
    }

    //pixel information
    int width = header.width;
    int height = header.height;
    int i,j;
    for (i = 0; i < height; i++){
        for (j = 0; j < width; j++){
            YCC ycc = ycc_matrix[i][j];
            unsigned char color[3] = { (unsigned char) ycc.cr, (unsigned char) ycc.cb, (unsigned char) ycc.y };
            fwrite(color, 1, 3, file);

            if (save_into_components) {
                color[0] = (unsigned char) ycc.y;
                color[1] = (unsigned char) ycc.y;
                color[2] = (unsigned char) ycc.y;
                fwrite(color, 1, 3, fileY);

                color[0] = (unsigned char) ycc.cb;
                color[1] = (unsigned char) ycc.y;
                color[2] = (unsigned char) ycc.y;
                fwrite(color, 1, 3, fileCb);

                color[0] = (unsigned char) ycc.y;
                color[1] = (unsigned char) ycc.cr;
                color[2] = (unsigned char) ycc.y;
                fwrite(color, 1, 3, fileCr);
            }
        }
    }

    fclose(file);
    if (save_into_components) {
        fclose(fileY);
        fclose(fileCb);
        fclose(fileCr);
    }
}

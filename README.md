# ColorSpaceConversion

### About:

Converts an image from image from the RGB Color Space to the YCC Colour Space. While converting the application downsamples the image. Then the program upsamples and converts the image back to RGB colour space. Finally it outputs to a an the RGBtrain.bmp image located in the saved images directory.


There exists the optimized and the unoptimized versions of the color space conversion. Each have their own Makefile and seperate saved_images directory.

### Usage:

To run change directory into optimized or unoptimized and run 
```make```

To run the program run:


```./main <filepath to image>```

### Example Usage:

```./main ../images/train.bmp```

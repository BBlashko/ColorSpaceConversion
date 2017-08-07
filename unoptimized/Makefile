CC = gcc
SRCS = image.c
CFLAGS  = -g -pg -O3
TARGET = main

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) $(TARGET).c $(SRCS) -o $(TARGET)

clean:
	-rm -f $(TARGET)
	-rm -f $(TARGET).o

# File: Makefile
# A simple Makefile used to build an executable supporting Cross-compiling.
# Use `make` or `make all` to build natively
# Use `make CROSS_COMPILE=<cross-platform-binary>-gcc to cross-compile for different platforms.

ifeq ($(CC),)
	CC = $(CROSS_COMPILE)gcc
endif
ifeq ($(CFLAGS),)
	CFLAGS = -g -Wall -Werror
endif
ifeq ($(LDFLAGS),)
	LDFLAGS = -pthread -lrt
endif

INCLUDES = -I/
TARGET = hello-world

SRC := hello-world.c
OBJS := $(SRC:.c=.o)

all: $(TARGET)

hello-world: hello-world.c
	$(CC) $(CFLAGS) $(INCLUDES) $^ -o $@ $(LDFLAGS)

clean:
	-rm -f *.o $(TARGET) *.elf *.map *.o

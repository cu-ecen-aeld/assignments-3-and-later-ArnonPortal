TARGET = writer
SRCS = writer.c
OBJS = $(SRCS:.c=.o)
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Werror -std=gnu11

.PHONY: all clean

# Default target
all: $(TARGET)

# Link
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Compile
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean target
clean:
	rm -f $(TARGET) *.o

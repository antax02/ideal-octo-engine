# Define the compiler
CC = clang

# Define the directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include  # Include folder is a sibling to the src folder

# Define the source and target files
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
TARGET = $(BUILD_DIR)/main

# Define the compiler flags
CFLAGS = -Wall -Wextra -I$(INCLUDE_DIR) -I/mingw64/include/ncurses

# Define the libraries to link against
LIBS = -L/mingw64/lib -lncursesw

# Default target to build the program
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(LIBS)

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to run the built program
run: $(TARGET)
	./$(TARGET)

# Rule to clean the build directory
clean:
	rm -rf $(BUILD_DIR)/*

# Make sure the build directory exists
$(shell mkdir -p $(BUILD_DIR))

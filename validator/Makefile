# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17

# Paths
INCLUDE_DIR = /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemonlib/include
LIB_DIR = /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemonlib/lib

# Target
TARGET = main
SRC = main.cpp

# Build rules
all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -L$(LIB_DIR) -o $@ $^

clean:
	rm -f $(TARGET)

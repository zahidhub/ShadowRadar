# Simple Makefile to run AUnit tests on host system

CXX = g++
CXXFLAGS = -Wall -Wextra -std=gnu++17 -I../external/AUniter/src
LDFLAGS =

SRC = host_test.cpp
TARGET = host_test

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)

run: all
	./$(TARGET)

clean:
	rm -f $(TARGET)

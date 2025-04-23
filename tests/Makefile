CXX = g++
CXXFLAGS = -Wall -Wextra -std=gnu++17 -I../external/AUniter/src
LDFLAGS =

# Automatically find all .cpp test files in this directory
SRC := $(wildcard *.cpp)
TARGETS := $(SRC:.cpp=)

all: $(TARGETS)

# Compile each test file into its own executable
%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

# Run all test executables
run: all
	@for target in $(TARGETS); do \
		echo "Running $$target..."; \
		./$$target; \
	done

clean:
	rm -f $(TARGETS)

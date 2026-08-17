.PHONY: all test clean

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: $(BIN_DIR)/main$(BIN_DIR)/tests

$(BIN_DIR)/main: main.adb surf.ads surf.adb
	mkdir -p $(OBJ_DIR) $(BIN_DIR)$(GNAT) -P surf.gpr

$(BIN_DIR)/tests: tests.adb surf.ads surf.adb
	mkdir -p $(OBJ_DIR) $(BIN_DIR)$(GNAT) -P surf.gpr

test: $(BIN_DIR)/tests
	@echo "Running tests..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)$(BIN_DIR)

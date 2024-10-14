SOURCE_DIR := src
TESTS_DIR := tests

SIM_DIR := sim

IVERILOG := iverilog

# testsディレクトリにある *.test.v をコンパイル対象とする
OUT_FILES := $(patsubst $(TESTS_DIR)/%.test.v, $(TESTS_DIR)/%.out, $(wildcard $(TESTS_DIR)/*.test.v))
all: $(OUT_FILES)

%.out: %.test.v
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -I $(SOURCE_DIR) -o $(SIM_DIR)/$(notdir $@) $<

clean:
	${RM} $(OUT_FILES)

.PHONY: clean all

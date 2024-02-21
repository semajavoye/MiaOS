ASM=nasm
SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/boot_floppy.img: $(BUILD_DIR)/boot.bin
	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot_floppy.img
	truncate -s 1440k $(BUILD_DIR)/boot_floppy.img
    
$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.asm | $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/boot.asm -f bin -o $(BUILD_DIR)/boot.bin

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: clean

clean:
	rm -rf $(BUILD_DIR)
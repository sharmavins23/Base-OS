# !!! Change this to your specific Raspberry Pi version
RPI_VERSION ?= 4

# Set the CPU architecture based on the Raspberry Pi version
ifeq ($(RPI_VERSION), 4)
CPU_VER ?= cortex-a72
else
CPU_VER ?= cortex-a53
endif

BOOTMNT ?= boot

ARMGNU ?= aarch64-none-elf

COPS = -DRPI_VERSION=$(RPI_VERSION) -Wall -nostdlib -nostartfiles -ffreestanding \
	   -Iinclude -mgeneral-regs-only -mcpu=$(CPU_VER)

BUILD_DIR = build
SRC_DIR = src

all : kernel8.img

clean : 
	del $(BUILD_DIR)\*.img
	del $(BOOTMNT)\kernel8.img
	del $(BOOTMNT)\kernel8-rpi4.img

$(BUILD_DIR)/%_c.o: $(SRC_DIR)/%.c
	$(ARMGNU)-gcc $(COPS) -MMD -c $< -o $@

$(BUILD_DIR)/%_s.o: $(SRC_DIR)/%.s
	$(ARMGNU)-gcc $(COPS) -MMD -c $< -o $@

C_FILES = $(wildcard $(SRC_DIR)/*.c)
ASM_FILES = $(wildcard $(SRC_DIR)/*.s)
OBJ_FILES = $(C_FILES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%_c.o)
OBJ_FILES = $(ASM_FILES:$(SRC_DIR)/%.s=$(BUILD_DIR)/%_s.o)

DEP_FILES = $(OBJ_FILES:%.o=%.d)
-include $(DEP_FILES)

kernel8.img: $(SRC_DIR)/linker.ld $(OBJ_FILES)
	@echo "Building for RPI $(value RPI_VERSION)"
	@echo "Deploying to $(value BUILD_DIR)"
	@echo ""
	$(ARMGNU)-ld -T $(SRC_DIR)/linker.ld -o $(BUILD_DIR)/kernel8.elf $(OBJ_FILES)
	$(ARMGNU)-objcopy $(BUILD_DIR)/kernel8.elf -O binary $(BUILD_DIR)/kernel8.img
ifeq ($(RPI_VERSION), 4)
	$(ARMGNU)-objcopy $(BUILD_DIR)/kernel8.elf -O binary $(BOOTMNT)/kernel8-rpi4.img
else
	$(ARMGNU)-objcopy $(BUILD_DIR)/kernel8.elf -O binary $(BOOTMNT)/kernel8.img
endif
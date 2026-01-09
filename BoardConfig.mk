#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
DEVICE_PATH := device/Allwinner/READBOY

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture（核心修改：适配 arm32 架构，兼容 Allwinner 芯片）
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9  # 适配 Allwinner 常见 32 位 CPU 核心
TARGET_CPU_VARIANT_RUNTIME := cortex-a9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := recovery_new
TARGET_NO_BOOTLOADER := true

# Display（保留原配置，与 800×1280 分辨率适配）
TARGET_SCREEN_DENSITY := 480
TW_THEME := portrait_hdpi  # 已匹配屏幕尺寸，无需修改

# Kernel（关键修改：关闭预编译内核，避免架构不匹配，从源码编译 32 位内核）
BOARD_BOOTIMG_HEADER_VERSION := 0
BOARD_KERNEL_BASE := 0x41078000  # 保留原地址（硬件固定）
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x00f88000
BOARD_KERNEL_TAGS_OFFSET := 0xfff88100
BOARD_KERNEL_IMAGE_NAME := zImage  # 32 位内核默认镜像名（替换 64 位的 Image）
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# 注释预编译内核配置，避免 64 位内核冲突
# TARGET_FORCE_PREBUILT_KERNEL := true
# ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
# TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
# TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
# endif

# Partitions（保留原配置，硬件固定参数）
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform（保留原配置，适配硬件平台）
TARGET_BOARD_PLATFORM := tulip

# Recovery（保留原功能配置，32 位架构完全兼容）
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# Hack: prevent anti rollback（保留防回滚配置）
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0  # 与 TWRP 5.1 兼容，无需修改

#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from READBOY device
$(call inherit-product, device/Allwinner/READBOY/device.mk)

PRODUCT_DEVICE := READBOY
PRODUCT_NAME := omni_READBOY
PRODUCT_BRAND := Allwinner
PRODUCT_MODEL := Readboy_G60
PRODUCT_MANUFACTURER := Allwinner

PRODUCT_GMS_CLIENTID_BASE := android-generic

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="READBOY"

BUILD_FINGERPRINT := READBOY


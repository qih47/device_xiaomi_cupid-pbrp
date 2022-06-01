#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from cupid device
$(call inherit-product, device/xiaomi/cupid/device.mk)

# Inherit some common Pitchblack stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := cupid

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := omni_cupid
PRODUCT_DEVICE := cupid
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2201123C
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cupid_id/cupid:12/SKQ1.211006.001/V13.0.2.0.SLCIDXM:user/release-keys
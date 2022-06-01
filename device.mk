#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# define hardware platform
PRODUCT_PLATFORM := $(PRODUCT_PLATFORM)

# A/B support
AB_OTA_UPDATER := true

LOCAL_PATH := device/xiaomi/cupid

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
	vendor_dlkm

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    checkpoint_gc \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor

# fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock \
	fastbootd 

# Recovery Modules
PRODUCT_HOST_PACKAGES += \
    libandroidicu

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhwbinder.vendor

# Encryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

# Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    ro.hardware.keystore=sdm660 \
    ro.hardware.gatekeeper=sdm660 \
    sys.usb.controller=a800000.dwc3 

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=1 \
    ro.allow.mock.location=1 \
    ro.hardware.keystore=sdm660

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so



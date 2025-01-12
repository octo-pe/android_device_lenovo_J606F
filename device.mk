#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/J606F

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc

# AAPT Characteristics
PRODUCT_CHARACTERISTICS := tablet

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
PRODUCT_PACKAGES += \
    audio_amplifier.j606f

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths_bengal_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_bengal_idp.xml

PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinypcminfo

# Board
TARGET_BOARD_PLATFORM := bengal

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti:64 \
    android.hardware.boot@1.1-impl-qti.recovery:64 \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl:64 \
    android.hardware.camera.provider@2.4-service_64 \
    vendor.qti.hardware.camera.postproc@1.0.vendor:64

# Config Store
PRODUCT_PACKAGES += \
    disable_configstore

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Disabled telephony packages
PRODUCT_PACKAGES += \
    telephony_packages.xml

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti

# DLKM
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := $(OUT_DIR)/target/product/$(AOSPA_BUILD)/$(KERNEL_MODULES_INSTALL)/lib/modules

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Features
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/features/disabled_features.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/disabled_features.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# First api level
PRODUCT_SHIPPING_API_LEVEL := 29
BOARD_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor:64

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti:64 \
    android.hardware.health@2.1-impl-qti.recovery:64 \
    android.hardware.health@2.1-service

# Init
PRODUCT_PACKAGES += \
    charger_fstab.qti \
    fstab.qcom \
    init.qti.dcvs.sh \
    init.qti.early_init.sh \
    init.j606f.camera.rc \
    init.j606f.rc \
    init.target.rc \
    ueventd.j606f.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Input device configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/Vendor_04f3_Product_3164.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_04f3_Product_3164.idc \
    $(DEVICE_PATH)/configs/idc/Vendor_beef_Product_dead.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_beef_Product_dead.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/Vendor_17ef_Product_6103.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_17ef_Product_6103.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor:64

# Media
PRODUCT_COPY_FILES += \
    device/qcom/common/vendor/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor:64

# Overlay
PRODUCT_PACKAGES += \
    AOSPAJ606FFrameworks \
    J606FFrameworks \
    J606FLauncher \
    J606FWifi

# PD
PRODUCT_PACKAGES += \
    libjson

# Perf
PRODUCT_PACKAGES += \
    libdrm.vendor

# Public Libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/linker/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Properties
$(call inherit-product, $(DEVICE_PATH)/properties.mk)

# QTI components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    overlay \
    perf \
    usb \
    vibrator \
    wlan

# RS
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge:64

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

$(call inherit-product-if-exists, vendor/lenovo/J606F/J606F-vendor.mk)

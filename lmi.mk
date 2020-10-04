# Copyright (C) 2020 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/lmi/lmi-vendor.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_PACKAGES += \
    otapreopt_script

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

#PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    antradio_app \
    libantradio

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.1-impl

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/product_privapp-permissions-qti.xml

# QTI common
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    perf \
    telephony \
    wfd

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# RIL
PRODUCT_PACKAGES += \
    libjson \
    libril \
    librilutils \

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/lmi

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor properties
-include $(LOCAL_PATH)/device_props.mk

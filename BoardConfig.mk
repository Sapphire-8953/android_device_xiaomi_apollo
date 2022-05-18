# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/xiaomi/apollo

-include device/xiaomi/sm8250-common/BoardConfigCommon.mk

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_SSR := false

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_USES_VULKAN := true

# Gestures
TARGET_TAP_TO_WAKE_NODE := "/sys/touchpanel/double_tap"

# Hacks
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# HIDL
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/vintf/xiaomi_manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_apollo

# Kernel
KERNEL_DEFCONFIG := apollo_defconfig

# Platform
BOARD_VENDOR := xiaomi

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true

# Rootdir
SOONG_CONFIG_NAMESPACES += XIAOMI_KONA_ROOTDIR
SOONG_CONFIG_XIAOMI_KONA_ROOTDIR := PARTITION_SCHEME
SOONG_CONFIG_XIAOMI_KONA_ROOTDIR_PARTITION_SCHEME := a

# Sepolicy
SELINUX_IGNORE_NEVERALLOWS := true
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
include vendor/xiaomi/apollo/BoardConfigVendor.mk

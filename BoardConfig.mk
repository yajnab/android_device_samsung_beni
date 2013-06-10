# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#
# Target
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM := msm7x27
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27

# Graphics
USE_OPENGL_RENDERER := true
TARGET_NO_HW_OVERLAY := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/qcom/msm7x27/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
TARGET_DISABLE_TRIPLE_BUFFERING := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_QCOM
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_GLOBAL_CPPFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os


## Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm7x27-common/include

## Webkit
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true

## Device specific libs
TARGET_PROVIDES_LIBAUDIO := true
TARGET_PROVIDES_LIBLIGHT := true

## Audio: combo device supported
BOARD_COMBO_DEVICE_SUPPORTED := true

# Javascript, Browser and Webkit
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

## Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Camera
USE_CAMERA_STUB := false
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_DISABLE_ARM_PIE := true

## GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27
BOARD_USES_QCOM_LIBRPC := true

## FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAVE_FM_RADIO := true
COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO -DQCOM_FM_ENABLED
BOARD_FM_DEVICE := bcm2049

## RIL
TARGET_PROVIDES_LIBRIL := true
BOARD_USES_LEGACY_RIL := true
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/beni/ril/

## Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH_BLUEZ := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
ifneq (true,$(BOARD_HAVE_BLUETOOTH_BLUEZ))
BOARD_HAVE_BLUETOOTH := true
endif
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/beni/bluetooth
## Kernel, bootloader
TARGET_BOOTLOADER_BOARD_NAME := beni
TARGET_KERNEL_CONFIG := cyanogenmod_beni_defconfig
TARGET_OTA_ASSERT_DEVICE := beni,GT-S5670
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27
TARGET_PROVIDES_INIT_TARGET_RC := true


## Recovery
BOARD_LDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/beni/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/beni/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/samsung/beni/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/samsung/beni/recovery/recovery.fstab
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 219938816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 190054400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL_CMDLINE :=
BOARD_BML_BOOT := "/dev/block/bml8"
BOARD_BML_RECOVERY := "/dev/block/bml9"
BOARD_RECOVERY_HANDLES_MOUNT := true







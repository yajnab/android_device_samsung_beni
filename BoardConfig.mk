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


include vendor/samsung/msm7x27-common/BoardConfigVendor.mk

## Kernel
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27
TARGET_PROVIDES_INIT_TARGET_RC := true

## Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_SPECIFIC_HEADER_PATH := device/samsung/beni/include

## Webkit
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true
TARGET_FORCE_CPU_UPLOAD := true

## V8
JS_ENGINE := v8
HTTP := chrome

## JIT
WITH_JIT := true
ENABLE_JSC_JIT := true

## Camera
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE -DSAMSUNG_CAMERA_QCOM -DBOARD_USES_LEGACY_CAMERA
BOARD_USES_LEGACY_CAMERA := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_USES_LEGACY_CAMERA := true

## Qualcomm, display
BOARD_USES_QCOM_HARDWARE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/beni/prebuilt/lib/egl/egl.cfg
BOARD_USES_QCOM_LIBS := true
TARGET_NO_HW_VSYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX -DQCOM_ICS_DECODERS
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD -DQCOM_ICS_COMPAT
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

## GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
BOARD_USES_QCOM_LIBRPC := true

## Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

## FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO -DQCOM_FM_ENABLED
BOARD_FM_DEVICE := brcm2049

## Wi-Fi
BOARD_WLAN_NO_FWRELOAD := true
COMMON_GLOBAL_CFLAGS += -DWIFI_AP_HAS_OWN_DRIVER
WIFI_AP_FIRMWARE_LOADER := ""
WPA_SUPPLICANT_VERSION := VER_0_8_X

ifeq ($(BOARD_WLAN_DEVICE),ath6kl_compat)
	# This is unnecessary, and breaks WIFI_EXT_MODULE_*
	BOARD_HAVE_SAMSUNG_WIFI := false

	# ATH6KL uses NL80211 driver
	BOARD_WPA_SUPPLICANT_DRIVER := NL80211
	BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl_compat

	# ATH6KL uses hostapd built from source
	BOARD_HOSTAPD_DRIVER := NL80211
	BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl_compat

	# Common module dependency
	WIFI_EXT_MODULE_NAME := cfg80211
	WIFI_EXT_MODULE_PATH := /system/lib/modules/cfg80211.ko

	# AP mode
	WIFI_AP_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1 samsung_firmware=0"
	WIFI_AP_DRIVER_MODULE_NAME := ath6kl
	WIFI_AP_DRIVER_MODULE_PATH := /system/lib/modules/ath6kl.ko

	# Station/client mode
	WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1 samsung_firmware=1"
	WIFI_DRIVER_MODULE_NAME := ath6kl
	WIFI_DRIVER_MODULE_PATH := /system/lib/modules/ath6kl.ko

	# Build the ath6kl-compat modules
KERNEL_EXTERNAL_MODULES:
	# wipe & prepare ath6kl-compat working directory
	rm -rf $(OUT)/ath6kl-compat
	cp -a hardware/atheros/ath6kl-compat $(OUT)/
	# run build
	$(MAKE) -C $(OUT)/ath6kl-compat KERNEL_DIR=$(KERNEL_OUT) KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE)
	# copy & strip modules (to economize space)
	$(TARGET_OBJCOPY) --strip-unneeded $(OUT)/ath6kl-compat/compat/compat.ko $(KERNEL_MODULES_OUT)/compat.ko
	$(TARGET_OBJCOPY) --strip-unneeded $(OUT)/ath6kl-compat/drivers/net/wireless/ath/ath6kl/ath6kl.ko $(KERNEL_MODULES_OUT)/ath6kl.ko
	$(TARGET_OBJCOPY) --strip-unneeded $(OUT)/ath6kl-compat/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)/cfg80211.ko
TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES
else
	# Enhance Samsung AR6000 compatibility
	BOARD_HAVE_SAMSUNG_WIFI := true

	# AR6000 SDK 3.x uses WEXT driver
	BOARD_WLAN_DEVICE := ath6kl
	BOARD_WPA_SUPPLICANT_DRIVER := WEXT
	BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

	# AP mode
	WIFI_AP_DRIVER_MODULE_ARG := "ifname=athap0 fwmode=2"
	WIFI_AP_DRIVER_MODULE_PATH := /system/wifi/ar6000.ko
	WIFI_AP_DRIVER_MODULE_NAME := ar6000

	# Station/client mode
	WIFI_DRIVER_MODULE_ARG := "ifname=wlan0 fwmode=1"
	WIFI_DRIVER_MODULE_PATH := /system/wifi/ar6000.ko
	WIFI_DRIVER_MODULE_NAME := ar6000
endif

## RIL
TARGET_PROVIDES_LIBRIL := true
BOARD_USES_LEGACY_RIL := true
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

## Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

## Device specific libs
TARGET_PROVIDES_LIBAUDIO := true
TARGET_PROVIDES_LIBLIGHTS := true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Fix libcamera crash
TARGET_DISABLE_ARM_PIE := true

## Fix colors in panorama mode
BOARD_CPU_COLOR_CONVERT := true

## Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 249938816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 190054400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL_CMDLINE := 
BOARD_BML_BOOT := "/dev/block/bml8"
BOARD_BML_RECOVERY := "/dev/block/bml9"
BOARD_RECOVERY_HANDLES_MOUNT := true

## Kernel, bootloader
TARGET_BOOTLOADER_BOARD_NAME := beni
TARGET_KERNEL_CONFIG := cyanogenmod_beni_defconfig

## Assert
TARGET_OTA_ASSERT_DEVICE := beni,GT-S5670

## Recovery
BOARD_LDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/beni/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/beni/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/samsung/beni/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/samsung/beni/recovery/recovery.fstab

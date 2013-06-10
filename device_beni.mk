# Copyright (C) 2009 The Android Open Source Project
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


# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    gralloc.msm7x27 \
    copybit.msm7x27
    
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

## Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \
    libcamera
    
## GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc


## Other
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    power.msm7x27 \
    make_ext4fs \
    brcm_patchram_plus \
    setup_fs
    
# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

## Wifi
PRODUCT_PACKAGES += \
    abtfilt \
    wlan_tool \
    wmiconfig

PRODUCT_PACKAGES += \
    Torch
# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.opengles.surface.rgb565=true \
    com.qc.hardware=true \
    debug.enabletr=false \
    debug.hwui.render_dirty_regions=false \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=false

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# Camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1
    
# FM Radio
PRODUCT_PACKAGES += \
    Effem \
    libfmradio.bcm2049

# BlueZ: binaries
PRODUCT_PACKAGES += \
    bluetoothd \
    libbluetoothd \
    hcitool \
    hciconfig \
    hciattach \
    brcm_patchram_plus    
    

## LDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

## Inherit overlays  (Most specific last)
DEVICE_PACKAGE_OVERLAYS += device/samsung/beni/overlay


SAMSUNG_BOOTLOADER := $(shell echo $(PRODUCT_VERSION_DEVICE_SPECIFIC)board | tr '[A-Z]' '[a-z]' | cut -c 2-)
PRODUCT_COPY_FILES += \
    device/samsung/beni/ramdisk/BENI.rle:root/BENI.rle
    device/samsung/beni/ramdisk/init.msm7x27.rc:root/init.$(SAMSUNG_BOOTLOADER).rc \
    device/samsung/beni/ramdisk/init.msm7x27.bluez.rc:root/init.$(SAMSUNG_BOOTLOADER).bluez.rc \
    device/samsung/beni/ramdisk/init.msm7x27.parts.rc:root/init.$(SAMSUNG_BOOTLOADER).parts.rc \
    device/samsung/beni/ramdisk/init.msm7x27.usb.rc:root/init.$(SAMSUNG_BOOTLOADER).usb.rc \
    device/samsung/beni/ramdisk/ueventd.msm7x27.rc:root/ueventd.$(SAMSUNG_BOOTLOADER).rc

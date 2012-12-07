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

## Inherit vendor proprietary files
$(call inherit-product, vendor/samsung/beni/vendor_blobs.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

## Media
PRODUCT_PACKAGES += \
    libOmxCore \
    libmm-omxcore \
    libstagefrighthw 

## Display
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    libgenlock \
    liboverlay \
    libtilerenderer 

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils

## Camera
PRODUCT_PACKAGES += \
    camera.gio \
    LegacyCamera 

## GPS
PRODUCT_PACKAGES += \
    librpc 
  
## Other
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    bdaddr_read \
    setup_fs \
    FileManager  

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/beni/ramdisk/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/beni/ramdisk/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/beni/ramdisk/lib/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/beni/ramdisk/lib/modules/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/beni/ramdisk/lib/modules/rfs_glue.ko:root/lib/modules/rfs_glue.ko

## Prebuilt init.d scripts
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.local.rc:root/init.local.rc \
    device/samsung/beni/prebuilt/etc/init.d/01bt:system/etc/init.d/01bt \
    device/samsung/beni/prebuilt/etc/init.d/02compcache:system/etc/init.d/02compcache 
    

## Wi-Fi & networking
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/beni/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/beni/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Media
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/beni/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/beni/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/beni/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/beni/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

## Keymap
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/beni/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/beni/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/beni/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/beni/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl 

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/usr/keylayout/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/beni/prebuilt/usr/keylayout/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/beni/prebuilt/usr/keylayout/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/beni/prebuilt/usr/keylayout/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## ICS GPS blob
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/lib/hw/gps.msm7x27.so:system/lib/hw/gps.msm7x27.so

## Other
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := ldpi mdpi normal

## Device specific overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/beni/overlay

## Camera
PRODUCT_PACKAGES += \
    camera.beni

## Lights
PRODUCT_PACKAGES += \
   lights.beni

## Audio
PRODUCT_PACKAGES += \
   audio_policy.beni \
   audio.primary.beni

## Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/beni/ramdisk/init.gt-s5670board.rc:root/init.gt-s5670board.rc \
    device/samsung/beni/ramdisk/init.gt-s5670board.usb.rc:root/init.gt-s5670board.usb.rc \
    device/samsung/beni/ramdisk/ueventd.gt-s5670board.rc:root/ueventd.gt-s5670board.rc \
    device/samsung/beni/ramdisk/BENI.rle:root/BENI.rle

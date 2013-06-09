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

SAMSUNG_BOOTLOADER := $(shell echo $(PRODUCT_VERSION_DEVICE_SPECIFIC)board | tr '[A-Z]' '[a-z]' | cut -c 2-)
PRODUCT_COPY_FILES += \
    device/samsung/beni/ramdisk/BENI.rle:root/BENI.rle
    device/samsung/beni/ramdisk/init.msm7x27.rc:root/init.$(SAMSUNG_BOOTLOADER).rc \
    device/samsung/beni/ramdisk/init.msm7x27.bluez.rc:root/init.$(SAMSUNG_BOOTLOADER).bluez.rc \
    device/samsung/beni/ramdisk/init.msm7x27.parts.rc:root/init.$(SAMSUNG_BOOTLOADER).parts.rc \
    device/samsung/beni/ramdisk/init.msm7x27.usb.rc:root/init.$(SAMSUNG_BOOTLOADER).usb.rc \
    device/samsung/beni/ramdisk/ueventd.msm7x27.rc:root/ueventd.$(SAMSUNG_BOOTLOADER).rc

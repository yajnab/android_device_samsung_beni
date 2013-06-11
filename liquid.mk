# Inherit device configuration
$(call inherit-product, device/samsung/beni/full_beni.mk)

# gsm
$(call inherit-product, vendor/liquid/config/common_gsm.mk)

# phone
$(call inherit-product, vendor/liquid/config/common_phone.mk)


# Overrides
PRODUCT_NAME := cm_beni
PRODUCT_DEVICE := beni
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-S5670
PRODUCT_MANUFACTURER := Samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_RELEASE_NAME := GalaxyBeni
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-S5670


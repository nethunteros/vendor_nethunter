# Inherit common CM stuff
$(call inherit-product, vendor/nethunter/config/common_full.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/nethunter/overlay/dictionaries

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/nethunter/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/nethunter/config/telephony.mk)

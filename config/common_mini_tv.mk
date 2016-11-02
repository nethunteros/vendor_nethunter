# Inherit common CM stuff
$(call inherit-product, vendor/nethunter/config/common_mini.mk)

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/nethunter/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif
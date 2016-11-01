# External Wireless Firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wlanfirmware/ar9170-1.fw:system/etc/firmware/ar9170-1.fw \
	$(LOCAL_PATH)/wlanfirmware/ar9170-2.fw:system/etc/firmware/ar9170-2.fw \
	$(LOCAL_PATH)/wlanfirmware/carl9170-1.fw:system/etc/firmware/carl9170-1.fw \
	$(LOCAL_PATH)/wlanfirmware/htc_7010.fw:system/etc/firmware/htc_7010.fw \
	$(LOCAL_PATH)/wlanfirmware/htc_9271.fw:system/etc/firmware/htc_9271.fw \
	$(LOCAL_PATH)/wlanfirmware/rt2561.bin:system/etc/firmware/rt2561.bin \
	$(LOCAL_PATH)/wlanfirmware/rt2860.bin:system/etc/firmware/rt2860.bin \
	$(LOCAL_PATH)/wlanfirmware/rt2870.bin:system/etc/firmware/rt2870.bin \
	$(LOCAL_PATH)/wlanfirmware/rt3070.bin:system/etc/firmware/rt3070.bin \
	$(LOCAL_PATH)/wlanfirmware/rt73.bin:system/etc/firmware/rt73.bin \
	$(LOCAL_PATH)/wlanfirmware/rtlwifi/rtl8188efw.bin:system/etc/firmware/rtlwifi/rtl8188efw.bin \
	$(LOCAL_PATH)/wlanfirmware/rtlwifi/rtl8192cufw.bin:system/etc/firmware/rtlwifi/rtl8192cufw.bin \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211_ub:system/etc/firmware/zd1211/zd1211_ub \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211_uph:system/etc/firmware/zd1211/zd1211_uph \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211_uphm:system/etc/firmware/zd1211/zd1211_uphm \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211_uphr:system/etc/firmware/zd1211/zd1211_uphr \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211_ur:system/etc/firmware/zd1211/zd1211_ur \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211b_ub:system/etc/firmware/zd1211/zd1211b_ub \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211b_uph:system/etc/firmware/zd1211/zd1211b_uph \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211b_uphm:system/etc/firmware/zd1211/zd1211b_uphm \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211b_uphr:system/etc/firmware/zd1211/zd1211b_uphr \
	$(LOCAL_PATH)/wlanfirmware/zd1211/zd1211b_ur:system/etc/firmware/zd1211/zd1211b_ur

# Busybox
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/busybox_nh:system/xbin/busybox_nh

# HID Keyboard
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/hid-keyboard:system/xbin/hid-keyboard

# Bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/bootanimation.zip:system/media/bootanimation.zip

# Init Nethunter
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.nethunter.rc:root/init.nethunter.rc

# Nethunter Apps
PRODUCT_PACKAGES += \
	Nethunter \
	Terminal \
 	androidVNC \
	F-Droid

# fix usb debugging auth on user builds
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1
endif
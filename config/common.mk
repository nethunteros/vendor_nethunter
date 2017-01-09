PRODUCT_BRAND ?= nethunter

PRODUCT_BOOTANIMATION := vendor/nethunter/prebuilt/common/bootanimation/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=nethunter

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/nethunter/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/nethunter/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/nethunter/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Copy prebuilt binaries
PRODUCT_COPY_FILES += \
	vendor/nethunter/prebuilt/common/xbin/busybox_nh:system/xbin/busybox_nh \
	vendor/nethunter/prebuilt/common/xbin/hid-keyboard:system/xbin/hid-keyboard

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/nethunter/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Copy wireless firmware files
PRODUCT_COPY_FILES += \
	vendor/nethunter/prebuilt/common/etc/firmware/ar9170-1.fw:system/etc/firmware/ar9170-1.fw \
	vendor/nethunter/prebuilt/common/etc/firmware/ar9170-2.fw:system/etc/firmware/ar9170-2.fw \
	vendor/nethunter/prebuilt/common/etc/firmware/carl9170-1.fw:system/etc/firmware/carl9170-1.fw \
	vendor/nethunter/prebuilt/common/etc/firmware/htc_7010.fw:system/etc/firmware/htc_7010.fw \
	vendor/nethunter/prebuilt/common/etc/firmware/htc_9271.fw:system/etc/firmware/htc_9271.fw \
	vendor/nethunter/prebuilt/common/etc/firmware/rt2561.bin:system/etc/firmware/rt2561.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rt2860.bin:system/etc/firmware/rt2860.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rt2870.bin:system/etc/firmware/rt2870.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rt3070.bin:system/etc/firmware/rt3070.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rt73.bin:system/etc/firmware/rt73.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rtlwifi/rtl8188efw.bin:system/etc/firmware/rtlwifi/rtl8188efw.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/rtlwifi/rtl8192cufw.bin:system/etc/firmware/rtlwifi/rtl8192cufw.bin \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211_ub:system/etc/firmware/zd1211/zd1211_ub \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211_uph:system/etc/firmware/zd1211/zd1211_uph \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211_uphm:system/etc/firmware/zd1211/zd1211_uphm \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211_uphr:system/etc/firmware/zd1211/zd1211_uphr \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211_ur:system/etc/firmware/zd1211/zd1211_ur \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211b_ub:system/etc/firmware/zd1211/zd1211b_ub \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211b_uph:system/etc/firmware/zd1211/zd1211b_uph \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211b_uphm:system/etc/firmware/zd1211/zd1211b_uphm \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211b_uphr:system/etc/firmware/zd1211/zd1211b_uphr \
	vendor/nethunter/prebuilt/common/etc/firmware/zd1211/zd1211b_ur:system/etc/firmware/zd1211/zd1211b_ur

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/nethunter/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/nethunter/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/nethunter/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/nethunter/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Include CM audio files
include vendor/nethunter/config/cm_audio.mk

# Theme engine
include vendor/nethunter/config/themes_common.mk

ifneq ($(TARGET_DISABLE_CMSDK), true)
# CMSDK
include vendor/nethunter/config/cmsdk_common.mk
endif

# Required CM packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CMAudioService \
    CMParts \
    Development \
    Profiles \
    WeatherManagerService

# Optional CM packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable

# Nethunter packages
PRODUCT_PACKAGES += \
	Nethunter \
	Terminal \
 	androidVNC \
	F-Droid \
	Drivedroid

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom CM packages
PRODUCT_PACKAGES += \
    AudioFX \
    CMFileManager \
    CMSettingsProvider \
    CMWallpapers \
    Eleven \
    ExactCalculator \
    LiveLockScreenService \
    LockClock \
    Screencast \
    SoundRecorder \
    Trebuchet \
    WallpaperPicker \
    WeatherProvider

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in CM
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3

DEVICE_PACKAGE_OVERLAYS += vendor/nethunter/overlay/common

PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE := 0

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

NETHUNTER_BUILD_DATE := $(shell LC_ALL=C date +%Y-%m-%d_%H%M)
NETHUNTER_BRANCH=nougat

ifneq ($(NETHUNTER_BUILD),)
    # NETHUNTER_BUILD=<goo version int>/<build string>
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=nethunteros \
        ro.goo.rom=nethunter \
        ro.goo.version=$(shell echo $(NETHUNTER_BUILD) | cut -d/ -f1)

    NETHUNTER_VERSION=$(TARGET_PRODUCT)_$(NETHUNTER_BRANCH)_$(shell echo $(NETHUNTER_BUILD) | cut -d/ -f2)
else
    ifeq ($(NETHUNTER_BUILDTYPE),)
        # NETHUNTER_BUILDTYPE not defined
	NETHUNTER_BUILDTYPE := unofficial
    endif

    NETHUNTER_VERSION=$(TARGET_PRODUCT)_$(NETHUNTER_BRANCH)_$(NETHUNTER_BUILDTYPE)_$(NETHUNTER_BUILD_DATE)
endif

NETHUNTER_DISPLAY_VERSION := $(NETHUNTER_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.nethunter.version=$(NETHUNTER_VERSION) \
    ro.nethunter.branch=$(NETHUNTER_BRANCH) \
    ro.nethunter.device=$(NETHUNTER_DEVICE) \
    ro.nethunter.releasetype=$(NETHUNTER_BUILDTYPE) \
    ro.modversion=$(NETHUNTER_VERSION) \
    ro.nethunter.display.version=$(NETHUNTER_DISPLAY_VERSION) \
    ro.cmlegal.url=https://cyngn.com/legal/privacy-policy

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/nethunter/config/partner_gms.mk
-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)

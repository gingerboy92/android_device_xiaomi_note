$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/note/note-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/note/overlay

LOCAL_PATH := device/xiaomi/note
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# recovery
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/recovery/factory_init.project.rc:recovery/root/factory_init.project.rc \
$(LOCAL_PATH)/recovery/factory_init.rc:recovery/root/factory_init.rc \
$(LOCAL_PATH)/recovery/fstab:recovery/root/fstab \
$(LOCAL_PATH)/recovery/meta_init.modem.rc:recovery/root/meta_init.modem.rc \
$(LOCAL_PATH)/recovery/meta_init.project.rc:recovery/root/meta_init.project.rc \
$(LOCAL_PATH)/recovery/meta_init.rc:recovery/root/meta_init.rc \
$(LOCAL_PATH)/recovery/ueventd.rc:recovery/root/ueventd.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_note
PRODUCT_DEVICE := note

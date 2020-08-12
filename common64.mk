$(call inherit-product, device/oneplus/oneplus7/base.mk)

# For PRODUCT_COPY_FILES, the first instance takes precedence.
# Since we want use QC specific files, we should inherit
# device-vendor.mk first to make sure QC specific files gets installed.
$(call inherit-product-if-exists, $(QCPATH)/common/config/device-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus

# whitelisted app
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus7/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

PRODUCT_COPY_FILES += \
    device/oneplus/oneplus7/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# Ipsec_tunnels feature
ifneq ($(TARGET_KERNEL_VERSION), 3.18)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml
endif

# Permission for Wi-Fi passpoint support
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

PRODUCT_PRIVATE_KEY := device/oneplus/oneplus7/qcom.key
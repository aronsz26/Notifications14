# Notifications14: iOS 14's notification design on iOS 15 (test, iPhone 7).
TARGET := iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Notifications14
Notifications14_FILES = Tweak.m
Notifications14_CFLAGS = -fobjc-arc
Notifications14_FRAMEWORKS = Foundation
Notifications14_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

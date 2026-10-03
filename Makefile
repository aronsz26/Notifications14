# Notifications14: iOS 14's notifications on iOS 15.
# Rootless (Dopamine, palera1n rootless): make package FINALPACKAGE=1
# Rootful (palera1n rootful, checkra1n, ...): make package FINALPACKAGE=1 ROOTFUL=1
TARGET := iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
ifneq ($(ROOTFUL),1)
THEOS_PACKAGE_SCHEME = rootless
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Notifications14
Notifications14_FILES = Tweak.m
Notifications14_CFLAGS = -fobjc-arc
Notifications14_FRAMEWORKS = Foundation
Notifications14_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

TARGET := iphone:clang:16.5:15.0
ARCHS = arm64 arm64e
ifneq ($(ROOTFUL),1)
THEOS_PACKAGE_SCHEME = rootless
endif

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Notifications14Prefs

Notifications14Prefs_FILES = N14RootListController.m
Notifications14Prefs_FRAMEWORKS = UIKit
Notifications14Prefs_PRIVATE_FRAMEWORKS = Preferences FrontBoardServices SpringBoardServices
Notifications14Prefs_INSTALL_PATH = /Library/PreferenceBundles
Notifications14Prefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Notifications14Prefs.plist$(ECHO_END)

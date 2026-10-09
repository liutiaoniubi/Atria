# AtriaPrefs — 设置面板 bundle

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AtriaPrefs

AtriaPrefs_FILES = $(wildcard src/*.m)
AtriaPrefs_INSTALL_PATH = /Library/PreferenceBundles
AtriaPrefs_FRAMEWORKS = UIKit CoreText
AtriaPrefs_PRIVATE_FRAMEWORKS = Preferences
AtriaPrefs_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
AtriaPrefs_CODESIGN_FLAGS = -S../../Assets/../layout/DEBIAN/control

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp layout/Library/PreferenceLoader/Preferences/AtriaPrefs.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/$(ECHO_END)

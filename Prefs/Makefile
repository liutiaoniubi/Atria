# AtriaPrefs — 设置面板 bundle

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

GO_EASY_ON_ME = 1

BUNDLE_NAME = AtriaPrefs

AtriaPrefs_FILES = $(wildcard src/*.m)
AtriaPrefs_INSTALL_PATH = /Library/PreferenceBundles
AtriaPrefs_FRAMEWORKS = UIKit
# 注意：不要写 PRIVATE_FRAMEWORKS = Preferences
# theos 的 SDK 不带 Preferences.framework 二进制，写了会导致
#   ld: framework 'Preferences' not found
# 头文件由 theos 自带(vendor/include)，能正常编译；
# 类符号在运行时由 PreferenceLoader 注入的设置 App 提供，用 dynamic_lookup 延迟解析。
AtriaPrefs_LDFLAGS = -undefined dynamic_lookup
AtriaPrefs_CFLAGS = -fobjc-arc -I ../../src/UI/Splash -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/bundle.mk

# internal-stage 必须放在 include bundle.mk 之后
internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp layout/Library/PreferenceLoader/Preferences/AtriaPrefs.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/$(ECHO_END)

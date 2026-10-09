# Atria — theos 构建文件
# 原仓库未提交 Makefile，此文件按项目结构补写

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Atria

Atria_FILES = $(wildcard src/Hooks/*.xm) $(wildcard src/Manager/*.m) $(wildcard src/Options/*.m) $(wildcard src/UI/*.m) $(wildcard src/UI/*/*.m) $(wildcard src/Editor/*.m)
Atria_FRAMEWORKS = UIKit CoreText
Atria_PRIVATE_FRAMEWORKS = Preferences
Atria_CFLAGS = -fobjc-arc -I src/Hooks -I src/Manager -I src/Options -I src/UI -Wno-deprecated-declarations
Atria_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += Prefs
include $(THEOS_MAKE_PATH)/aggregate.mk

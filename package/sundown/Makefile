#
# Copyright (C) 2013 HackLab de Barracas
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sundown
PKG_VERSION:=2013-04-06
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/vmg/sundown.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=37728fb2d7137ff7c37d0a474cb827a8d6d846d8
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/sundown
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Markdown parser
  MAINTAINER:=Nicolás Reynolds <fauno@endefensadelsl.org>
  PKGARCH:=all
endef

define Package/opentracker/description
Sundown is a Markdown parser based on the original code of the Upskirt library
by Natacha Porté.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
endef

define Package/sundown/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sundown $(1)/usr/bin/sundown
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smartypants $(1)/usr/bin/smartypants
endef

$(eval $(call BuildPackage,sundown))


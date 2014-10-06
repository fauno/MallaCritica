#
# Copyright (C) 2013 HackLab de Barracas
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hoedown
PKG_VERSION:=2014-10-06
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/hoedown/hoedown.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=4e1b16cfab1f99191f5dd9b9498df4162fd44ff9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/hoedown
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Markdown parser
  MAINTAINER:=Nicolás Reynolds <fauno@endefensadelsl.org>
  PKGARCH:=all
endef

define Package/hoedown/description
Standards compliant, fast, secure markdown processing library in C
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
endef

define Package/hoedown/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hoedown $(1)/usr/bin/hoedown
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smartypants $(1)/usr/bin/smartypants
endef

$(eval $(call BuildPackage,hoedown))


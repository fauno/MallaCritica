#
# Copyright (C) 2010-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=generate-ipv6-address
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.pps.univ-paris-diderot.fr/~jch/software/files/
PKG_MD5SUM:=3bd763b6ef1c651e80f353e3e37bc494

include $(INCLUDE_DIR)/package.mk

define Package/generate-ipv6-address
  SECTION:=ipv6
  CATEGORY:=IPv6
  DEPENDS:=
  TITLE:=IPv6 random address generator
  MAINTAINER:=Nicolás Reynolds <fauno@endefensadelsl.org>
  PKGARCH:=all
endef

define Package/generate-ipv6-address/description
Generates random IPv6 addresses according to RFC4193
endef

define Package/generate-ipv6-address/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/generate-ipv6-address $(1)/usr/bin/generate-ipv6-address
endef

$(eval $(call BuildPackage,generate-ipv6-address))

#
# Copyright (C) 2013 HackLab de Barracas
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=opentracker
PKG_VERSION:=20130312
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://repo.parabolagnulinux.org/other/
PKG_MD5SUM:=64956fd9bc7b453b4862b8ba15a27511
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/opentracker
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libowfat +zlib +kmod-ipv6
  TITLE:=An open and free bittorrent tracker with ipv6 support
  MAINTAINER:=Nicolás Reynolds <fauno@endefensadelsl.org>
  PKGARCH:=all
endef

define Package/opentracker/description
An open and free bittorrent tracker
endef

define Package/opentracker/conffiles
/etc/opentracker/config
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS) \
          PREFIX=$(STAGING_DIR) \
          LIBOWFAT_HEADERS=$(STAGING_DIR)/usr/include/libowfat \
          LIBOWFAT_LIBRARY=$(STAGING_DIR)/usr/lib \
          FEATURES="-DWANT_V6"
endef

define Package/opentracker/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/opentracker
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/opentracker $(1)/usr/bin/opentracker
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/opentracker.conf.sample $(1)/etc/opentracker/config
	$(INSTALL_BIN) ./files/opentracker.init $(1)/etc/init.d/opentracker
endef

$(eval $(call BuildPackage,opentracker))

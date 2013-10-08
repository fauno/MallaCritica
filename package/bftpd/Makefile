#
# Copyright (C) 2013 HackLab de Barracas
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bftpd
PKG_VERSION:=4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/sourceforge/bftpd/
PKG_MD5SUM:=34bac87bb196ae823fa2b4731dfa9383
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/bftpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Small, flexible FTP server
  MAINTAINER:=Nicolás Reynolds <fauno@endefensadelsl.org>
  PKGARCH:=all
endef

define Package/bftpd/description
Small, flexible FTP server
endef

define Package/bftpd/conffiles
/etc/bftpd.conf
endef

define Package/bftpd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bftpd $(1)/usr/sbin/bftpd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bftpd.conf $(1)/etc/bftpd.conf
endef

$(eval $(call BuildPackage,bftpd))


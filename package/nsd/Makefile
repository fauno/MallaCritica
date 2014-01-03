
include $(TOPDIR)/rules.mk

PKG_NAME:=nsd
PKG_VERSION:=3.2.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nlnetlabs.nl/downloads/$(PKG_NAME)
PKG_MD5SUM:=b5fdbf78bd3f4133d1295af21a61f7c8

include $(INCLUDE_DIR)/package.mk

define Package/nsd
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libevent
  TITLE:=Authoritative only, high performance and simple DNS server
  URL:=http://www.nlnetlabs.nl/nsd/
  SUBMENU:=IP Addresses and Names
endef

CONFIGURE_ARGS += \
  --with-pidfile=/tmp/nsd.pid \
  --enable-ratelimit

CONFIGURE_VARS += \
  ac_cv_c_va_list_def=no

define Package/nsd/conffiles
/etc/nsd/nsd.conf
endef

define Package/nsd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-checkconf $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-notify $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-patch $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-xfer $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsdc.sh $(1)/usr/sbin/nsdc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/zonec $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,nsd))

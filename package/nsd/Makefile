
include $(TOPDIR)/rules.mk

PKG_NAME:=nsd
PKG_VERSION:=4.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.nlnetlabs.nl/downloads/$(PKG_NAME)
PKG_MD5SUM:=87556b1f8deb3434fd9805d459a96328

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
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-control $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nsd-control-setup.sh $(1)/usr/sbin/nsd-control-setup
endef

$(eval $(call BuildPackage,nsd))

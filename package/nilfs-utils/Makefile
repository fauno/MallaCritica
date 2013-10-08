
include $(TOPDIR)/rules.mk

PKG_NAME:=nilfs-utils
PKG_VERSION:=2.1.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.nilfs.org/download
PKG_MD5SUM:=f072cc53c288492061b3199d63e32177

include $(INCLUDE_DIR)/package.mk

define Package/nilfs-utils
  SECTION:=utils
  CATEGORY:=Utilities
	SUBMENU:=Filesystem
	DEPENDS:=+librt +libuuid +libblkid +libmount +libpthread +kmod-fs-nilfs2
  TITLE:=Log-structured file system supporting continuous snapshotting
  URL:=http://www.nilfs.org/
endef

CONFIGURE_ARGS += --enable-libmount

# Install everything and remove manuals and headers
define Package/nilfs-utils/install
	make -C $(PKG_BUILD_DIR) DESTDIR=$(1) install
	rm -r $(1)/usr/{man,include}
endef

$(eval $(call BuildPackage,nilfs-utils))

#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=paws
PKG_VERSION:=0.1
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk

define Package/paws
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Public Access Wifi Service
	URL:=http://publicaccesswifi.org/
endef

define Package/paws/description
	OpenWRT package for Project PAWS.
endef


define Build/Prepare
# getting the PAWS files from github
	mkdir -p $(PKG_BUILD_DIR)/paws
	git clone https://github.com/pawsnet/paws-firmware.git $(PKG_BUILD_DIR)/paws/paws-firmware
	$(CP) ~/OpenWRT-SDK/authorized_keys $(PKG_BUILD_DIR)/paws
endef

define Build/Compile
endef

# The $(1) variable represents the root directory on the router running
# OpenWrt. 

define Package/paws/install
# moving PAWS files into correct location
	$(INSTALL_DIR) $(1)/etc $(1)/etc/dropbear $(1)/usr $(1)/www
	$(CP) -p $(PKG_BUILD_DIR)/paws/paws-firmware/etc/*  $(1)/etc/
	$(CP) -p $(PKG_BUILD_DIR)/paws/paws-firmware/usr/*  $(1)/usr/
	$(CP) -p $(PKG_BUILD_DIR)/paws/paws-firmware/www/*  $(1)/www/
	$(CP) -p $(PKG_BUILD_DIR)/paws/authorized_keys $(1)/etc/dropbear/
#we need to however ensure we also dont overwrite bismark's files for e.g.
#we need to ensure etc/dropbear doesnt have authorized keys for bismark server
#also etc/crontab/root - we need to check          
endef

define Package/paws/preinst
endef

define Package/paws/prerm
endef

define Package/paws/postinst
#!/bin/sh
# PAWS management post-install script
	if [ -z "$${IPKG_INSTROOT}" ]; then
    		$${IPKG_INSTROOT}/usr/bin/paws-bootstrap
	fi
endef

$(eval $(call BuildPackage,paws))

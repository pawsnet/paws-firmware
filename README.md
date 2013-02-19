paws-firmware
=============

Firmware addition to BISmark for use in PAWS deployment

[/www](https://github.com/pawsnet/paws-firmware/tree/master/www) - this re-implements the /www directory in the BISmark firmware. This provides a webUI at http://192.168.142.1/ which is specific to PAWS project, replacing the previous webUI on the router which was specific to BISmark. Until a better method is avalaible to add use the PAWS webUI, replace the /www directory in BISmark firmware with this /www directory and reboot the router 

PAWS Hardware
=============

The routers that we are using for this project are Netgear N600. The firmware for the PAWS routers is build on top of OpenWRT Backfire.

Building PAWS Firmware
======================

# By building into the BISmarks Firmware Build Process

The plan for building the PAWS firmware (on Ubuntu) into an image that can flashed onto the Netgeat N600 is as follows

!! THIS PROCESS HAS BEEN TESTED AND FAILED !!
we are unable to build BISmarks firmware, BISmark have been contacted about the issue

1) Get the required packages

	$ sudo apt-get update && sudo apt-get upgrade
	$ sudo apt-get install subversion build-essential  


2) Get the BISmark overlay for OpenWRT

	$ git clone https://github.com/projectbismark/bismark-openwrt-overlay.git quirm-rc3

3) Get the PAWS overlay for BISmark and add the files to correct locations in quirm-rc3

	$ git clone https://github.com/pawsnet/paws-firmware.git
	$ cp -r paws-firmware/* quirm-rc3/files
	# for each file copy it across to the same location in quirm-rc3/files
	
4.a) Get the keys from router and add into quirm-rc3/files/etc/dropbear/authorized_keys

4) Build the BISmark & PAWS overlays

	$ cd quirm-rc3 
	$ ./build-bismark.sh

5) Get PAWS firmware and flash it to netgeat N600 router

	# copy firmware from /data/users/bismark/builds/$RELEASE_NAME/ar71xx to router

6) Generate and place keys some more keys ??


# Building PAWS as an OpenWRT Package

We are going to try and follow the instructions here http://wiki.openwrt.org/doc/devel/packages and create a make files like https://github.com/projectbismark/bismark-packages/blob/master/utils/bismark-mgmt/Makefile
=======
see wiki

Accessing WebUI
===============

The WebUI the netgear N600 router is avalaible at http://192.168.142.1/, this is useful from the pospective of PAWS users as it will still be able of the network connect is unavalible. It will include infomation on how to get help, how to set up the VPN, the terms of use etc... The html files for these pages are location in /www/bismark-chrome

There is also the luci router configuration avaliable at http://192.168.142.1/cgi-bin/luci, this will be useful is there are issues with the router and we need to get non-techincal people to bug fix. Every router needs to have a unique password. The interface is provided by OpenWRT's luci and the paws logo is added from /www/luci-static/resources/custom_logo_only.png

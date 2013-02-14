paws-firmware
=============

Firmware addition to BISmark for use in PAWS deployment

/www - this re-implements the /www directory in the BISmark firmware. This provides a webUI at http://192.168.142.1/ which is specific to PAWS project, replacing the previous webUI on the router which was specific to BISmark. Until a better method is avalaible to add use the PAWS webUI, replace the /www directory in BISmark firmware with this /www directory and reboot the router 

Building PAWS Firmware
======================

The plan for building the PAWS firmware (on Ubuntu) into an image that can flashed onto the Netgeat N600 is as follows

THIS PROCESS HAS NOT YET BEEN TESTED !!

1) Get the required packages
	$ sudo apt-get update && sudo apt-get upgrade
	$ sudo apt-get install subversion build-essential

2) Get the BISmark overlay for OpenWRT
	$ git clone https://github.com/projectbismark/bismark-openwrt-overlay.git quirm-rc3

3) Get the PAWS overlay for BISmark and add the files to correct locations in quirm-rc3
	$ git clone https://github.com/pawsnet/paws-firmware.git
	$ cd paws-firmware
	# for each file copy it across to the same location in quirm-rc3

4) Build the BISmark & PAWS overlays
	$ cd quirm-rc3 
	$ ./build-bismark.sh

5) Get PAWS firmware and flash it to netgeat N600 router
	# copy firmware from /data/users/bismark/builds/$RELEASE_NAME/ar71xx to router

6) Generate and place keys

Accessing WebUI
===============

The WebUI the netgear N600 router is avalaible at http://192.168.142.1/, this is useful from the pospective of PAWS users as it will still be able of the network connect is unavalible. It will include infomation on how to get help, how to set up the VPN, the terms of use etc... The html files for these pages are location in /www/bismark-chrome

There is also the luci router configuration avaliable at http://192.168.142.1/cgi-bin/luci, this will be useful is there are issues with the router and we need to get non-techincal people to bug fix. Every router needs to have a unique password. The interface is provided by OpenWRT's luci and the paws logo is added from /www/luci-static/resources/custom_logo_only.png

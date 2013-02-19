paws-firmware
=============

Firmware addition to BISmark for use in PAWS deployment

[/www](https://github.com/pawsnet/paws-firmware/tree/master/www) - this re-implements the /www directory in the BISmark firmware. This provides a webUI at http://192.168.142.1/ which is specific to PAWS project, replacing the previous webUI on the router which was specific to BISmark. Until a better method is avalaible to add use the PAWS webUI, replace the /www directory in BISmark firmware with this /www directory and reboot the router 

PAWS Hardware
=============

The routers that we are using for this project are Netgear N600. The firmware for the PAWS routers is build on top of OpenWRT Backfire.

Building PAWS Firmware
======================



# Building PAWS as an OpenWRT Package
see wiki

Accessing WebUI
===============

The WebUI the netgear N600 router is avalaible at http://192.168.142.1/, this is useful from the pospective of PAWS users as it will still be able of the network connect is unavalible. It will include infomation on how to get help, how to set up the VPN, the terms of use etc... The html files for these pages are location in /www/bismark-chrome

There is also the luci router configuration avaliable at http://192.168.142.1/cgi-bin/luci, this will be useful is there are issues with the router and we need to get non-techincal people to bug fix. Every router needs to have a unique password. The interface is provided by OpenWRT's luci and the paws logo is added from /www/luci-static/resources/custom_logo_only.png

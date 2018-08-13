#!/bin/bash

# This script should be customized!

# Create configuration for device
cat > /etc/sysconfig/ifconfig.wlan0 << EOS
ONBOOT=yes
IFACE=wlan0
SERVICE=ipv4-static
IP=192.168.0.129
GATEWAY=192.168.0.1
PREFIX=24
BROADCAST=192.168.0.255
EOS

# add DNS resolution conf
cat > /etc/resolv.conf <<EOS               
nameserver 192.168.0.1
nameserver 8.8.8.8
nameserver 2001:730:3ed2:1000::53
search home
EOS

# hostname
echo dnsglk > /etc/hostname

# Add /etc/hosts
cat > /etc/hosts << EOS
127.0.0.1 localhost
127.0.1.1 dnsglk
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOS

#!/bin/bash

yum -y update

wget -O /etc/yum.repos.d/openvz.repo http://download.openvz.org/openvz.repo
rpm --import http://download.openvz.org/RPM-GPG-Key-OpenVZ

yum -y install vzkernel vzctl vzquota ploop

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.proxy_arp = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "kernel.sysrq = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.forwarding=1" >> /etc/sysctl.conf

shutdown -r now

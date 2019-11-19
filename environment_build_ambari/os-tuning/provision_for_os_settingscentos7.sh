#!/bin/bash
sudo yum -y install ntp

systemctl is-enabled ntpd

systemctl enable ntpd

systemctl start ntpd

echo 'NETWORKING=yes' >> /etc/sysconfig/network

echo 'HOSTNAME='$HOSTNAME >> /etc/sysconfig/network

systemctl disable firewalld

service firewalld stop


setenforce 0

sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config


#sudo sh -c 'echo "* soft nofile 10000" >> /etc/security/limits.conf'
#sudo sh -c 'echo "* hard nofile 10000" >> /etc/security/limits.conf'

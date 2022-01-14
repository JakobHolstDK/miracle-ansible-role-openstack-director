#!/usr/bin/env bash

POOLID=`subscription-manager list --available --all --matches="Red Hat OpenStack"| grep "Pool ID:" |awk '{ print $3 }'`
subscription-manager attach --pool=$POOLID
subscription-manager repos --disable=*
subscription-manager repos \
--enable=rhel-8-for-x86_64-baseos-eus-rpms \
--enable=rhel-8-for-x86_64-appstream-eus-rpms \
--enable=rhel-8-for-x86_64-highavailability-eus-rpms \
--enable=ansible-2.9-for-rhel-8-x86_64-rpms \
--enable=openstack-16.2-for-rhel-8-x86_64-rpms \
--enable=fast-datapath-for-rhel-8-x86_64-rpms

dnf module disable -y container-tools:rhel8
dnf module enable -y container-tools:3.0

dnf update -y
reboot 






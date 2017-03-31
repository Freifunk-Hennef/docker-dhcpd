#!/bin/bash
set -e

# TODO: Make this configurable
/usr/local/sbin/batctl it 5000
/usr/local/sbin/batctl gw server 200mbit/200mbit

# Only run if template exists
if [ -f "/etc/dhcp/dhcpd.conf.in" ]
then
	envsubst < /etc/dhcp/dhcpd.conf.in > /etc/dhcp/dhcpd.conf
fi

exec /usr/sbin/dhcpd $@
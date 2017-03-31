FROM ffhef/debian-batman:8.3-2017.0

MAINTAINER Nico - Freifunk Hennef <nico@freifunk-hennef.de>

ENV PACKAGES="isc-dhcp-server"
# DHCPD
ENV DHCPD_DEFAULT_LEASE_TIME=600
ENV DHCPD_MAX_LEASE_TIME=7200
ENV DHCPD_SUBNET_ADDRESS=""
ENV DHCPD_SUBNET_NETMASK=""
ENV DHCPD_SUBNET_RANGE_START=""
ENV DHCPD_SUBNET_RANGE_END=""
ENV DHCPD_SUBNET_ROUTERS=""
ENV DHCPD_SUBNET_DOMAIN_NAME_SERVERS=8.8.8.8

RUN apt-get update && apt-get install -y $INSTALL && \
    apt-get clean && rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

ADD dhcpd.conf.in /etc/dhcp/dhcpd.conf.in
ADD entrypoint.sh /

EXPOSE 67/udp

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "-f", "-cf", "/etc/dhcp/dhcpd.conf", "--no-pid" ]
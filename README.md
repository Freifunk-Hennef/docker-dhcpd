# dhcpd

Docker Image für einen Freifunk dhcp Server.

## Funktionen

* Startet einen ISC dhcpd

Muss (aktuell) im `privileged`-Mode und im Host-Netzwerk ausgeführt werden.

## Variablen

| Variable                         | Beschreibung                                                      | Format           | Standardwert | Benötigt           |
| -------------------------------- | ----------------------------------------------------------------- | ---------------- | ------------ | ------------------ |
| DHCPD_SUBNET_ADDRESS             | Adresse des Subnets, für den der DHCP-Server Requests beantwortet | IPv4-Netzadresse | -            | :white_check_mark: |
| DHCPD_SUBNET_NETMASK             | Netzmaske des Subnets                                             | IPv4-Netzmaske   | -            | :white_check_mark: |
| DHCPD_SUBNET_RANGE_START         | Erste Adresse des DHCP Pools                                      | IPv4-Adresse     | -            | :white_check_mark: |
| DHCPD_SUBNET_RANGE_END           | Letzte Adresse des DHCP Pools                                     | IPv4-Adresse     | -            | :white_check_mark: |
| DHCPD_SUBNET_ROUTERS             | Router (default Gateway), der den Clients mitgeteilt wird         | IPv4-Adresse     | -            | :white_check_mark: |
| DHCPD_SUBNET_DOMAIN_NAME_SERVERS | DNS-Server, der den Clients mitgeteilt wird                       | IPv4-Adresse     | `8.8.8.8`    | :x:                |
| DHCPD_DEFAULT_LEASE_TIME         | Standard-Laufzeit eines DHCP-Leases                               | Sekunden         | `600`        | :x:                |
| DHCPD_MAX_LEASE_TIME             | Maximale Laufzeit eines DHCP-Leases                               | Sekunden         | `7200`       | :x:                |

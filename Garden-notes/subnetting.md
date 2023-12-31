
### 
### IPV4 vs IPV6
IPv4 - 32 bit
IPv6 - 128 bit

### Ip CIDR Range

ex. 10.0.0.0/16 = 16 bits reserved (10.0.-.- it will never change)

### RFC1918 STANDARDS
10.0.0.0 - 10.255.255.255 (10/8 prefix)
172.16.0.0 - 172.31.255.255 (172.16/12 prefix)
192.168.0.0 - 192.168.255.255 (192.168/16 prefix) 

### SUBNET TABLE
Subnet def (?)       |   RESERVED OCTETS ( 1 = RESERVED / 0 = FREE)                             |   /RESERVED     |   RANGE
                     |                                                                          |                 |   
255.255.255.255      |   8 bit . 8 bit . 8 bit . 8 bit = 11111111.11111111.11111111.11111111    |   /32 (all)     |   10.0.0.1  
255.255.255.0        |   8 bit . 8 bit . 8 bit . 0 bit = 11111111.11111111.11111111.00000000    |   /24           |   10.0.0.1 - 10.0.0.254
255.255.0.0          |   8 bit . 8 bit . 0 bit . 0 bit = 11111111.11111111.00000000.00000000    |   /16           |   10.0.0.1 - 10.0.255.254
255.0.0.0            |   8 bit . 0 bit . 0 bit . 0 bit = 11111111.00000000.00000000.00000000    |   /8            |   10.0.0.1 - 10.255.255.254

Ex.IP                |  BINARY
192.168.100.201      |  1100000.10101000.01100100.11001001
## Reserved ips

- .0 (network)
- .255 (broadcast / not usable in VPC AWS)

### AWS RESERVATIONS

[AWS Reserved ips](aws_terraform.md)


### Public Route Table

SOURCE          |   DESTINATION
                |          
10.0.20.0/16     >     LOCAL
0.0.0.0/0       >     INTERNET GATEWAY

### Private Route Table

SOURCE          |   DESTINATION
                |          
10.0.3.0/16     >     LOCAL

(can add NAT Gateway to inbound/outbound internet in private network)




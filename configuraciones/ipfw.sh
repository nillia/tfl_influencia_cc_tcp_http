#!/bin/sh

ipfw -f flush
ipfw -f pipe flush
ipfw -f nat flush
ks="keep-state"
lan1="10.0.1.0/24"
lan2="10.0.2.0/24"

ipfw add check-state
ipfw add allow ip from any to any via lo0

# NatIP="10.10.10.103"
# ipfw nat 1 config ip ${NatIP} log \
# redirect_port tcp 192.168.2.10:22 10022
# ipfw add nat 1 ip from 192.168.2.0/24 to any
# ipfw add nat 1 ip from 192.168.3.0/24 to any
# ipfw add nat 1 ip from any to ${NatIP}

####### This host firewall #############

# only secured incomming connections
ipfw add allow ip from any to me established
# allow ssh to me
ipfw add allow tcp from any to me 2244 $ks
# allow icmp
ipfw add allow icmp from any to me
# allow udp dns
ipfw add allow udp from any 53 to me
################END ATM##############

############# PIPES #################
# From LAN1 - > OUT
ipfw pipe 1 config bw 2Mbit/s
ipfw pipe 2 config bw 2Mbit/s

# Internal unlimited pipe
# Download Cliente
ipfw pipe 3 config bw 1Mbit/s
# Upload Cliente
ipfw pipe 4 config bw 512Kbit/s
# Download Servidor
ipfw pipe 5 config bw 100Mbit/s
# Upload Servidor
ipfw pipe 6 config bw 100Mbit/s

# From LAN2 - > OUT
ipfw pipe 7 config bw 1Mbit/s
ipfw pipe 8 config bw 1Mbit/s
########### END PIPES ##############

####### INTERNAL SPEED ##########
# Si se quiere ser más específico se puede definir la subida
# y descarga del servidor y del cliente.
ipfw add pipe 3 all from ${lan1} to ${lan2} out
ipfw add pipe 4 all from ${lan2} to ${lan1} in
ipfw add pipe 5 all from ${lan2} to ${lan1} out
ipfw add pipe 6 all from ${lan1} to ${lan2} in
#################################

######### LAN1 Firewall #############
ipfw add pipe 1 all from ${lan1} to any out
ipfw add pipe 2 all from any to ${lan1} in

ipfw add allow tcp from ${lan1} to ${lan2} out
ipfw add allow tcp from ${lan2} to ${lan1} in
ipfw add allow ip from any to ${lan1} established
ipfw add allow icmp from any to ${lan1}
ipfw add allow udp from any 53 to ${lan1}


######## END LAN1 ################

####### LAN2 Firewall ##############
# speed-cut to 1 mbit
ipfw add pipe 7 all from any to ${lan2} in
ipfw add pipe 8 all from ${lan2} to any out

ipfw add allow tcp from ${lan2} to ${lan1} out
ipfw add allow tcp from ${lan1} to ${lan2} in
ipfw add allow ip from any to ${lan2} establised
ipfw add allow icmp from any to ${lan2}
ipfw add allow udp from any 53 to ${lan2}

####### END LAN2 ##################

########## Denies ##############
# Bloqueo la salida a internet del cliente y servidor
ipfw add deny all from ${lan1} to any
ipfw add deny all from ${lan2} to any

# Bloqueo que se pueda acceder al cliente y servidor
# desde cualquier lado que no sea el router
ipfw add deny all from any to ${lan1}
ipfw add deny all from any to ${lan2}
ipfw add deny all from any to me

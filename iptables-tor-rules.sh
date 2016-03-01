#!/bin/bash

if [ `id -u` != "0" ]; then
        echo "Error: you must be root to run this script!"
        exit 1
fi
if [ $OSTYPE != "linux-gnu" ]; then
        echo "Error: this script is only for Linux!"
        exit 1
fi

# Rules in this file is a complement to 'iptables-general-rules.sh'
# Rules to use Tor DNS resolver
iptables -t nat -A OUTPUT -p TCP --dport 53 -j DNAT --to-destination 127.0.0.1:9053 
iptables -t nat -A OUTPUT -p UDP --dport 53 -j DNAT --to-destination 127.0.0.1:9053 

# Disable non-Tor traffic
#
# To-do
#
#iptables -P OUTPUT DROP 
#iptables -A OUTPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT 
#iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT 
#iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT 


echo "Done!"

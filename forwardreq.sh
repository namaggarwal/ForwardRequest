#!/bin/bash

TOSERVERIP="10.10.0.288"
TPSERVERPORT="8080"

#Set IPForward to true
sudo sysctl net.ipv4.ip_forward=1

#Forward to destination
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $(TOSERVERIP):$(TOSERVERPORT)

#Set masquerade for reply
#Replace the source ip by its own ip
sudo iptables -t nat -A POSTROUTING -j MASQUERADE

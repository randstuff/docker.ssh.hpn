#!/bin/sh 


echo "UsePAM yes" >> /etc/ssh/sshd_config 
echo "Compression yes" >> /etc/ssh/sshd_config
echo "UseDNS no " >> /etc/ssh/sshd_config 



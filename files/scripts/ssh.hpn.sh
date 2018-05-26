#!/bin/sh 



#apt-get update; apt-get upgrade -y 
#apt-get -y install build-essential checkinstall
apt-get update 
apt-get install -y -qq aptitude build-essential checkinstall cmake make patch aptitude vim gcc-4.7 makepatch libssl-dev # -1.0.0
apt-get install -y -qq libpam-ssh libpam-sshauth libpam0g-dev libpam0g libpam-modules
apt-get install -y -qq zlib1g-dev libghc-zlib-dev libssh-dev

aptitude build -dd openssh-serveur openssh-client 
apt-get install -y -qq wget 

#wget https://ftp.osuosl.org/pub/blfs/conglomeration/openssh/openssh-5.3p1.tar.gz
#wget https://iweb.dl.sourceforge.net/project/hpnssh/HPN-SSH%2013v7%205.3p1/openssh-5.3p1-hpn13v7.diff.gz

wget https://netix.dl.sourceforge.net/project/hpnssh/HPN-SSH%2014v13%207.5p1/openssh-7_5_P1-hpn-14.13.diff
wget https://ftp.osuosl.org/pub/blfs/conglomeration/openssh/openssh-7.5p1.tar.gz


mkdir -p /etc/ssh/

echo "HPNDisabled no" >> /etc/ssh/sshd_config
echo "TcpRcvBufPoll yes" >> /etc/ssh/sshd_config
echo "HPNBufferSize 8192" >> /etc/ssh/sshd_config 
echo "NoneEnabled yes" >> /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config

#mkdir -p /var/run/sshd
chmod 0755 /var/run/sshd 

groupadd -g 133 sshd
useradd -u 133 -g 133 -c sshd -d / sshd
make install 



#tar xvfz openssh-5.3p1.tar.gz 
tar xvfz openssh-7.5p1.tar.gz
#gunzip openssh-5.3p1-hpn13v7.diff.gz 
#cd openssh-5.3p1

#cd openssh-7.5p1
#patch < ../openssh-5.3p1-hpn13v7.diff
#patch < ../openssh-7_5_P1-hpn-14.13.diff


cd openssh-7.5p1 ; patch -p1 < ../openssh-7_5_P1-hpn-14.13.diff ; ./configure --prefix=/usr/local/hpn-ssh/7.5p1-hpn14v13 --with-pam && echo $PWD && pwd && make  && make install
#cd openssh-7.5p1 ; patch -p1 ../openssh-7_5_P1-hpn-14.13.diff ; ./configure --prefix=/usr/local/hpn-ssh/7.5p1-hpn14v13 --with-pam ; make -j 8  ; make install



#./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pan   ; make ; make install 

#   --with-pam

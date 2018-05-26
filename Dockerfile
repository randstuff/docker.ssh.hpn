FROM ubuntu:16.04 

ENV DEBIAN_FRONTEND=noninteractive


# basics

RUN echo "nameserver 1.1.1.1 > /etc/resolv.conf " 

RUN apt-get clean ; apt-get update --fix-missing ; apt-get upgrade -y
RUN apt-get install -y -q software-properties-common apt-utils openssh-server apt-transport-https ca-certificates curl 

## to remove 
RUN apt-get install -y -q vim less  

#ADD ./files/scripts/sshd.update.sh  /root/files/scripts/sshd.update.sh
#ADD ./files/scripts/user.create.sh  /root/files/scripts/user.create.sh
#ADD ./files/scripts/ssh.keygen.sh   /root/files/scripts/ssh.keygen.sh
#ADD ./files/scripts/sshd.start.sh   /root/files/scripts/sshd.start.sh
ADD ./files/scripts/ssh.hpn.sh   /root/files/scripts/ssh.hpn.sh


#RUN /root/files/scripts/sshd.update.sh
#RUN /root/files/scripts/user.create.sh

RUN echo "start hpn install " 
RUN /root/files/scripts/ssh.hpn.sh 

#RUN /root/files/scripts/ssh.keygen.sh
#RUN /root/files/scripts/sshd.start.sh

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd 

EXPOSE 22 
ENTRYPOINT ["/usr/local/hpn-ssh/7.5p1-hpn14v13/sbin/sshd", "-D"]

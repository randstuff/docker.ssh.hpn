


#DPASS=$(pwgen -s 12 1)

DUSER=$(echo -n "test")  
DPASS=$(echo -n "test")  

adduser --disabled-password --gecos "" $DUSER 

echo "=> Setting a password for user chrometest "
echo "$DUSER:$DPASS" | chpasswd

mkdir /home/$DUSER/.ssh 



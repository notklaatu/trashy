#!/bin/sh
# install the humble but useful trash command

cp ./trash /usr/local/bin/trash
cp ./empty /usr/local/bin/empty
chmod +x /usr/local/bin/trash /usr/local/bin/empty

PROCHK=$(cat /etc/profile | sed -n '/alias rm="trash"/p' )
if [ "X$PROCHK" == "X" ]
	then 
	echo 'alias rm="trash"' >> /etc/profile
	source /etc/profile
fi
CHECK=$(ls /usr/local/bin | grep trash)
if [ "X$CHECK" == "X" ]
	then echo "Install encountered some errors.  You might try copying the apps to your home directory (into ~/bin for instance) and use them locally."
	else echo "Installation script complete."
fi

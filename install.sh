#!/bin/sh
# install the humble but useful trash command

OS=$(uname)
if [ "X$OS" == "XDarwin" ] 
	then INSTDIR=/usr/bin
	else INSTDIR=/usr/local/bin
fi

cp -f ./trash $INSTDIR/trash
cp -f ./empty $INSTDIR/empty
chmod +x $INSTDIR/trash $INSTDIR/empty

PROCHK=$(cat /etc/profile | sed -n '/alias rm="trash"/p' )
if [ "X$PROCHK" == "X" ]
	then 
	echo 'alias rm="trash"' >> /etc/profile
	source /etc/profile
fi
CHECK=$(ls $INSTDIR | grep trash)
if [ "X$CHECK" == "X" ]
	then echo "Install encountered some errors.  You might try copying the apps to your home directory (into ~/bin for instance) and use them locally."
	else echo "Installation script complete."
fi

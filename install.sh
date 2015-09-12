#!/bin/sh
# install the humble but useful trash command

OS=$(uname)
if [ "X${OS}" = "XDarwin" ]; then
    INSTDIR=/usr/bin
    exit
else 
    INSTDIR=/usr/local/bin
fi

cp -fv ./trashy $INSTDIR
chmod +x $INSTDIR/trashy || exit 1
if [ -L $INSTDIR/trash ]
    then true
else
    ln -s $INSTDIR/trashy $INSTDIR/trash
fi

########################################
### uncomment the block below if you ###
### want to alias 'rm' to 'trash'    ###
########################################

#PROCHK=$(cat /etc/profile | sed -n '/alias rm="trash"/p' )
#if [ "X$PROCHK" == "X" ]
#	then 
#	echo 'alias rm="trash"' >> /etc/profile
#	source /etc/profile
#fi

find -L ${INSTDIR} -iname "trash" -type f -exec echo "Install encountered some errors.  You might try copying the apps to your home directory (into ~/bin for instance) and use them locally." \;

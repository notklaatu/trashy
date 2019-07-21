#!/bin/sh
# install the humble but useful trash command

helpu() {
echo "This is the generic install script for trashy."
echo "Use it for Linux, BSD, or Darwin."
echo "Slackers: use the SlackBuild."
echo " "
echo "If you are admin:"
echo "install.sh              install to system "
echo "install.sh --draconian  alias rm=trashy for ALL users in /etc/profile"
echo " "
echo "If you do not have admin rights: "
echo "install.sh --local      install to $HOME/bin"
echo "install.sh --alias      alias rm=trashy in .bashrc"
echo " "
exit
}

OS=$(uname)
if [ "X${OS}" = "XDarwin" ]; then
    INSTDIR=/usr/bin
    exit
else 
    INSTDIR=/usr/local/bin
fi

while [ True ]; do 
    if [ "$1" = "--help" -o "$1" = "-h" ]; then
	helpu
	shift 1
    elif [ "$1" = "--local" -o "$1" = "-l" -o "$1" = "--user" -o "$1" = "-u" ]; then
	INSTDIR="$HOME/bin"
	shift 1
    elif [ "$1" = "--alias" ]; then
	ALIAS=1
	shift 1
    elif [ "$1" = "--draconian" ]; then
	DRACO=1
	shift 1
    else
	break
    fi
done

# does intall directory exist?
if [ -d $INSTDIR ]; then
    echo "Instal dir $INSTDIR found."
else
    mkdir -p $INSTDIR || echo "Unable to create $INSTDIR"
fi

# install
cp -fv ./trashy $INSTDIR
chmod +x $INSTDIR/trashy || exit 1

if [ -L $INSTDIR/trash ]
    then true
else
    ln -s $INSTDIR/trashy $INSTDIR/trash
fi

if [ "$DRACO" = "1" ]; then
    PROCHK=`cat /etc/profile | sed -n '/alias rm="trash"/p'`
    if [ "X$PROCHK" == "X" ]; then 
	echo 'alias rm="trash"' >> /etc/profile
	source /etc/profile
    fi
fi

if [ "$ALIAS" = "1" ]; then
    PROCHK=`cat $HOME/.bashrc | sed -n '/alias rm="trash"/p'`
    if [ "X$PROCHK" == "X" ]; then 
	echo 'alias rm="trash"' >> $HOME/.bashrc
	source $HOME/.bashrc
    fi
fi
    
find -L ${INSTDIR} -iname "trash" -type f -exec echo "Install complete. You can use the trash command now with 'trash --help'." \; \
    || echo "Install encountered some errors.  You might try copying the apps to your home directory (into ~/bin for instance) and use them locally."

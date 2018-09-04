if  [ ! -n "$1" ] ;then
    echo "no ip"
    exit 0
fi
if  [ ! -n "$2" ] ;then
    echo "no module"
    exit 0
fi
sh rsynccmd.sh update $1 $2
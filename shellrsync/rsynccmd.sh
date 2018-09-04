echo $3 > ${1}".txt"
file="../server/serverlist.dv"
cat $file | while read line
do
        times=0
        time1=1
        time2=2
        time3=3
        time4=4
        idx=0
        ip=0
        port=0
        servername=""
        for state in ${line}
        do
                let "times+=1" 
                if [ $times -eq $time1 ]; then
                        idx=$state
                elif [ $times -eq $time2 ]; then
                        ip=$state
                elif [ $times -eq $time3 ]; then
                        port=$state
                elif [ $times -eq $time4 ]; then
                        servername=$state
                fi
        done
        
        if [ "$2"x == "ALL"x ] || [ "$2"x == "all"x ] || [ "$2"x == ""x ]; then
                echo -e "\n\nrsync PUSH CMD ALL==> ${servername},idx=$idx,ip=$ip,port=$port,cmdtxt=${1}.txt,cmddata=$3 start\n"
                rsync -avz --delete ${1}".txt" root@$ip::server$idx/cmd/${1}".txt" --port=$port --password-file=/etc/rsyncd.pass
        elif [ "$2" == "$idx" ]; then
                echo -e "\n\nrsync PUSH CMD ONE==> ${servername},idx=$idx,ip=$ip,port=$port,cmdtxt=${1}.txt,cmddata=$3 start\n"
                rsync -avz --delete ${1}".txt" root@$ip::server$idx/cmd/${1}".txt" --port=$port --password-file=/etc/rsyncd.pass
        else
                echo "no send===>$state"
        fi
        
done

rm -f ${1}".txt"
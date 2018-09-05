echo -e "\n\nupload start ======================================================================> \n"
sh checkout.sh
sh compileall.sh
sh rsyncpyc.sh

#cd ..
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

	if [ "$1"x == "ALL"x ] || [ "$1"x == "all"x ] || [ "$1"x == ""x ]; then
		echo -e "\n\nrsync PUSH PYC ALL==> ${servername},idx=$idx,ip=$ip,port=$port start\n"
		#rsync -avzH --delete --progress "ssh -p $port" /server/upload/ root@$ip::server/server --password-file=/etc/rsyncd.pass
		rsync -avz --progress /server/upload/ root@$ip::server/server$idx/server --port=$port --password-file=/etc/rsyncd.pass
	elif [ "$1" == "$idx" ]; then
		echo -e "\n\nrsync PUSH PYC ONE==> ${servername},idx=$idx,ip=$ip,port=$port start\n"
		#rsync -avzH --delete --progress "ssh -p $port" /server/upload/ root@$ip::server/server --password-file=/etc/rsyncd.pass
		rsync -avz --progress /server/upload/ root@$ip::server/server$idx/server --port=$port --password-file=/etc/rsyncd.pass
	else
		echo "no send===>$state"
	fi
done
#cd shellrsync
echo -e "upload end ======================================================================> \n"

echo -e "\n\ncheckout start ======================================================================> \n"
cd ..
svn checkout https://192.168.1.99:998/svn/h5/trunk/serverstable --force server > checkout.txt
cd shellrsync
echo -e "checkout end ======================================================================> \n"
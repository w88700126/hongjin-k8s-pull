echo -e "\n\nrsync pyc start ======================================================================> \n"
cd ..
rsync -av --delete --force --include=*.pyc --include=servercnf.py --delete-excluded --exclude=*.py --exclude=*.txt --exclude=.svn server/ upload
cd shellrsync
echo -e "rsync pyc end ======================================================================> \n"
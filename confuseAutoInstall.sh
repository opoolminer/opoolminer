wget http://192.168.2.199:8080/download/redxx_linux_amd64.tar.gz  #修改下载地址
tar -zxvf redxx_linux_amd64.tar.gz
cd redxx_linux_amd64
chmod 777 redxx_linux.sh
cd ../
PROCESS=`ps -ef|grep redxx_linux.sh|grep -v grep|grep -v PPID|awk '{ print $2}'`
for i in $PROCESS
do
echo "Kill the $1 process [ $i ]"
kill -9 $i
done
PROCESS=`ps -ef|grep redxxrunning|grep -v grep|grep -v PPID|awk '{ print $2}'`
for i in $PROCESS
do
echo "Kill the $1 process [ $i ]"
kill -9 $i
done
cp -r redxx_linux_amd64 /etc
rm -rf redxx_linux_amd64
rm redxx_linux_amd64.tar.gz
rm confuseAutoInstall.sh
cd /etc
rm rc.local
touch rc.local
chmod 777 rc.local
echo "#!/bin/bash" >> rc.local
echo "#" >> rc.local
echo "# rc.local" >> rc.local
echo "#" >> rc.local
echo "# This script is executed at the end of each multiuser runlevel." >> rc.local
echo "# Make sure that the script will "#exit 0" on success or any other" >> rc.local
echo "# value on error." >> rc.local
echo "#" >> rc.local
echo "# In order to enable or disable this script just change the execution" >> rc.local
echo "# bits." >> rc.local
echo "#" >> rc.local
echo "# By default this script does nothing." >> rc.local
echo "#exit 0" >> rc.local
echo "cd /etc/redxx_linux_amd64 && setsid ./redxx_linux.sh &" >> rc.local
echo "exit 0" >> rc.local
cd /etc/redxx_linux_amd64 && setsid ./redxx_linux.sh $1 $2 $3 $4 $5 $6 $7 $8 &
cd /root
echo "启动成功,已经设置开机启动"

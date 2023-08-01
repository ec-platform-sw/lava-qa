export host_ip=$1
export lava_token=$2
sudo echo "$host_ip" > /etc/hostname
sudo apt install wget expect python-tz sshpass
sudo apt-get install python3-pip
sudo pip3 uninstall setuptools
sudo apt-get install python3-setuptools
sudo pip3 install pyftdi
sudo dpkg-reconfigure dash
sudo apt-get install tmux
wget http://apt.lavasoftware.org/lavasoftware.key.asc
sudo apt-key add lavasoftware.key.asc
echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free # raspi 4 needs a kernel and raspi-firmware newer than buster's" >> /etc/apt/sources.list
echo "deb http://apt.lavasoftware.org/release buster main" >> /etc/apt/sources.list
sudo apt update
apt-cache policy lava-dispatcher
sudo apt install lava-dispatcher
sed -i 's/# LOGLEVEL.*/LOGLEVEL="DEBUG"/' /etc/lava-dispatcher/lava-worker
sed -i 's/# URL.*/URL="http:\/\/192.168.3.198"/' /etc/lava-dispatcher/lava-worker
sed -i 's/TOKEN.*/TOKEN="--token '$lava_token'"/' /etc/lava-dispatcher/lava-worker
sudo service lava-worker restart
sudo apt install ser2net
sed -i '/^.00.*/,$s/^/#/'  /etc/ser2net.conf
echo "5001:telnet:0:/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_EQ-JT1-if03-port0:115200 8DATABITS NONE 1STOPBIT LOCAL edgeq-raptor2 max-connections=10" >> /etc/ser2net.conf
echo "5002:telnet:0:/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_EQ-JT1-if02-port0:115200 8DATABITS NONE 1STOPBIT LOCAL edgeq-raptor2 max-connections=10" >> /etc/ser2net.conf
echo "2000:telnet:600:/dev/ttyS0:9600 8DATABITS NONE 1STOPBIT banner" >> /etc/ser2net.conf
echo "3000:telnet:600:/dev/ttyS0:19200 8DATABITS NONE 1STOPBIT banner" >> /etc/ser2net.conf
echo "3001:telnet:600:/dev/ttyS1:19200 8DATABITS NONE 1STOPBIT banner" >> /etc/ser2net.conf
sudo /etc/init.d/ser2net restart
sudo /etc/init.d/ser2net restart

###after ser2net restart do reboot by below command
#sudo reboot

#!/bin/bash
#sudo raspi-config
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y oracle-java8-jdk

wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab' |sudo apt-key add -
echo "deb http://dl.bintray.com/openhab/apt-repo stable main" | sudo tee /etc/apt/sources.list.d/openhab.list
sudo apt-get update
sudo apt-get install -y openhab-runtime
sudo update-rc.d openhab defaults

sudo chown -hR openhab:openhab /etc/openhab
sudo chown -hR openhab:openhab /usr/share/openhab

sudo /etc/init.d/openhab start

#sudo apt-get install -y samba samba-common-bin
#sed -i '/wins support/c\wins support = yes' /etc/samba/smb.conf
#cat <<EOT >> /etc/samba/smb.conf
#[OpenHAB Home]
# comment= OpenHAB Home
# path=/usr/share/openhab
# browseable=Yes
# writeable=Yes
# only guest=no
# create mask=0777
# directory mask=0777
# public=no
#[OpenHAB Config]
# comment= OpenHAB Site Config
# path=/etc/openhab
# browseable=Yes
# writeable=Yes
# only guest=no
# create mask=0777
# directory mask=0777
# public=no
#EOT
#sudo smbpasswd -a openhab
#sudo update-rc.d smbd enable
#sudo update-rc.d nmbd enable
#sudo service smbd restart



# Save openhab_default.cfg else it will break

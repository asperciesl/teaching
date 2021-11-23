#!/bin/sh

mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFGck65npTf6ONDf8zaAvxOnCYZnZJj+sdZiobWDWTZaHXTBCOI0/84UevXhm1usMKjTJs9XETsr3Tlk+WOmhSeaRbAbrfeN127zobqCrG35bVyQSQVDhQTEsbdTCN+U7Ki1FKPcaN+7RH/KjqkUMjZ/hT/fPPvQXFs1L8TDt0X9yuXEOSDL/fKUq845DGtW4F5i7TKs0K//jdaDKsPzPFhHANPaKXhqKd68TphV/w/eW4BhTj4zyTAKFZBBqpJ6VlMkXs9eOKGLSfGkU883bzjN7eQV5r/5+LTyS0BklPduulI1bvMRKPgKQRXzEmduiic03W2slDITMl9m4zeTF3 rsa-key-20211122" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys


sudo apt-get update
sudo apt-get upgrade
export R_VERSION=4.0.5
sudo apt-get install gdebi-core -y
#sudo apt-get install r-base -y
sudo apt-get install curl -y
curl https://cdn.rstudio.com/r/ubuntu-2004/pkgs/r-4.0.5_1_amd64.deb > /root/r-4.0.5_1_amd64.deb
sudo gdebi --n /root/r-4.0.5_1_amd64.deb
sudo curl https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.1-372-amd64.deb > /root/rstudio-server-2021.09.1-372-amd64.deb
sudo gdebi --n /root/rstudio-server-2021.09.1-372-amd64.deb

sudo ufw allow http

sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student1') student1
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student2') student2
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student3') student3
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student4') student4
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student5') student5
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student6') student6
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student7') student7
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student8') student8
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student9') student9
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'student10') student10

sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'teacher1') teacher1
sudo useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'teacher2') teacher2

echo "www-port=80" > /etc/rstudio/rserver.conf
sudo reboot
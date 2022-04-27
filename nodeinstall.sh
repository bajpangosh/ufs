#!/bin/bash
# GET ALL USER INPUT
echo "App Name (eg. example google)?"
read DOMAIN
echo "App PORT (8085)"
read APP_PORT
tput setaf 2; echo 'Wellcome to Node Server and Dashboard on Ubuntu 20.04 install bash script';
sleep 2;
tput sgr0
cd ~
tput setaf 2; echo 'installing Node Js and Nginx Server';
sleep 2;
tput sgr0
cd /etc/nginx/sites-available/
sudo wget -O "app.$DOMAIN.adat.in" https://raw.githubusercontent.com/bajpangosh/ufs/main/apidomain.conf
sudo sed -i -e "s/apidomain.adat.in/app.$DOMAIN.adat.in/" "app.$DOMAIN.adat.in"
sudo sed -i -e "s/3569/$PORT/" "app.$DOMAIN.adat.in"

sudo wget -O "$DOMAIN.adat.in" https://raw.githubusercontent.com/bajpangosh/ufs/main/rootdomain.conf
sudo sed -i -e "s/rootdomain.adat.in/rootdomain.$DOMAIN.adat.in/" "$DOMAIN.adat.in"

sudo ln -s /etc/nginx/sites-available/"app.$DOMAIN.adat.in" /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/"$DOMAIN.adat.in" /etc/nginx/sites-enabled/
sudo mkdir -p /var/www/"$DOMAIN.adat.in"
sudo mkdir -p /root/projects/"app.$DOMAIN.adat.in"
echo
echo
tput setaf 2; echo "Here is your Credentials"
echo "--------------------------------"
echo "APP_PORT:   $APP_PORT"
echo
echo
echo "App:        https://app.$DOMAIN.adat.in"
echo "Web:        https://$DOMAIN.adat.in"
echo
echo "--------------------------------"
tput sgr0
echo
echo
tput setaf 3;  echo "Installation & configuration succesfully finished."
echo
echo "Twitter @TeamKloudboy"
echo "E-mail: support@kloudboy.com"
echo "Bye! Your boy KLOUDBOY!"
tput sgr0

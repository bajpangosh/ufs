#!/bin/bash
# GET ALL USER INPUT
echo "App Name (eg. example just google)?"
read DOMAINROOT
echo "App Name (eg. example googleapi)?"
read DOMAINAPI
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
sudo wget -O "$DOMAINAPI.adat.in" https://raw.githubusercontent.com/bajpangosh/ufs/main/apidomain.conf
sudo sed -i -e "s/porthere/$APP_PORT/" "$DOMAINAPI.adat.in"
sudo sed -i -e "s/apidomain.com/$DOMAINAPI/" "$DOMAINAPI.adat.in"

sudo wget -O "$DOMAINROOT.adat.in" https://raw.githubusercontent.com/bajpangosh/ufs/main/rootdomain.conf
sudo sed -i -e "s/rootdomain.com/$DOMAINROOT.adat.in/" "$DOMAINROOT.adat.in"

sudo ln -s /etc/nginx/sites-available/"$DOMAINAPI.adat.in" /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/"$DOMAINROOT.adat.in" /etc/nginx/sites-enabled/
sudo mkdir -p /var/www/"$DOMAINROOT.adat.in"
sudo mkdir -p /root/projects/"$DOMAINAPI.adat.in"
echo
echo
tput setaf 2; echo "Here is your Credentials"
echo "--------------------------------"
echo "APP_PORT:   $APP_PORT"
echo
echo
echo "App:        https://$DOMAINAPI.adat.in"
echo "Web:        https://$DOMAINROOT.adat.in"
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

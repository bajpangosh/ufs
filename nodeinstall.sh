#!/bin/bash
# GET ALL USER INPUT
echo "Domain Name (eg. example.com)?"
read DOMAIN
echo "App name PORT (8085)"
read APP_PORT
tput setaf 2; echo 'Wellcome to Parse Server and Dashboard on Ubuntu 18.04 install bash script';
sleep 2;
tput sgr0
cd ~
tput setaf 2; echo 'installing Node Js and Nginx Server';
sleep 2;
tput sgr0
cd /etc/nginx/sites-available/
sudo wget -O "app.$DOMAIN" https://goo.gl/2H3uGq
sudo sed -i -e "s/app.example.com/app.$DOMAIN/" "app.$DOMAIN"

sudo wget -O "dash.$DOMAIN" https://goo.gl/VZhPLP
sudo sed -i -e "s/dash.example.com/dash.$DOMAIN/" "dash.$DOMAIN"

sudo ln -s /etc/nginx/sites-available/"app.$DOMAIN" /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/"dash.$DOMAIN" /etc/nginx/sites-enabled/

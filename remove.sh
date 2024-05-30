#!/bin/bash

# Function to list websites in sites-available
list_websites() {
    echo "Available websites:"
    i=1
    for site in /etc/nginx/sites-available/*; 
    do
        basename_site=$(basename "$site")
        echo "$i) $basename_site"
        websites[$i]="$basename_site"
        ((i++))
    done
}

# Function to delete a website
delete_website() {
    read -p "Enter the number of the website you want to delete: " num
    site_name=${websites[$num]}
    if [ -z "$site_name" ]; then
        echo "Invalid selection."
        exit 1
    fi
    echo "You have selected: $site_name"
    
    read -p "Are you sure you want to delete $site_name? This will remove it from both 'sites-available' and 'sites-enabled'. (y/n): " confirmation
    if [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
        sudo rm -f "/etc/nginx/sites-available/$site_name"
        sudo rm -f "/etc/nginx/sites-enabled/$site_name"
        echo "$site_name has been deleted from both 'sites-available' and 'sites-enabled'."
        sudo systemctl reload nginx
    else
        echo "Deletion cancelled."
    fi
}

# Main script execution
declare -a websites
list_websites
delete_website

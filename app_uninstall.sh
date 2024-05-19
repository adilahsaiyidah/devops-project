#!/bin/bash

# Function to uninstall Nginx on Debian-based systems
uninstall_nginx_debian() {
    echo "Uninstalling Nginx..."
    sudo apt-get remove -y nginx
    echo "Nginx uninstalled successfully."
}

# Function to uninstall Nginx on RHEL-based systems
uninstall_nginx_rhel() {
    echo "Uninstalling Nginx..."
    sudo dnf remove -y nginx
    echo "Nginx uninstalled successfully."
}

# Function to uninstall PostgreSQL on Debian-based systems
uninstall_postgresql_debian() {
    echo "Uninstalling PostgreSQL..."
    sudo apt-get remove -y postgresql postgresql-contrib
    echo "PostgreSQL uninstalled successfully."
}

# Function to uninstall PostgreSQL on RHEL-based systems
uninstall_postgresql_rhel() {
    echo "Uninstalling PostgreSQL..."
    sudo dnf remove -y postgresql-server postgresql-contrib
    echo "PostgreSQL uninstalled successfully."
}

# Function to uninstall Docker
uninstall_docker() {
    echo "Uninstalling Docker..."
    sudo apt-get remove -y docker.io
    echo "Docker uninstalled successfully."
}

# Function to uninstall WordPress
uninstall_wordpress() {
    echo "Uninstalling WordPress..."
    # Add WordPress uninstallation steps here
    echo "WordPress uninstalled successfully."
}

# Check OS type
if [[ -e /etc/redhat-release ]]; then
    OS="RHEL"
    echo $OS
elif [[ -e /etc/debian_version ]]; then
    OS="Debian"
    echo $OS
else
    echo "Unsupported OS"
    exit 1
fi

# Main script
echo "Which application would you like to uninstall?"
echo "1. Uninstall Nginx"
echo "2. Uninstall PostgreSQL"
echo "3. Uninstall Docker"
echo "4. Uninstall WordPress"
echo "Enter the number of your choice: "
read -r choice

case $choice in
    1) 
        if [[ "$OS" == "Debian" ]]; then
            uninstall_nginx_debian
        elif [[ "$OS" == "RHEL" ]]; then
            uninstall_nginx_rhel
        fi
        ;;
    2) 
        if [[ "$OS" == "Debian" ]]; then
            uninstall_postgresql_debian
        elif [[ "$OS" == "RHEL" ]]; then
            uninstall_postgresql_rhel
        fi
        ;;
    3) 
        uninstall_docker
        ;;
    4)
        uninstall_wordpress
        ;;
    *) 
        echo "Invalid choice. Exiting..." 
        ;;
esac

#!/bin/bash

# Function to install Nginx on Debian-based systems
install_nginx_debian() {
    echo "Installing Nginx..."
    sudo apt-get update
    sudo apt-get install -y nginx
    echo "Nginx installed successfully."
}

# Function to install Nginx on RHEL-based systems
install_nginx_rhel() {
    echo "Installing Nginx..."
    sudo dnf install -y nginx
    echo "Nginx installed successfully."
}

# Function to install PostgreSQL on Debian-based systems
install_postgresql_debian() {
    echo "Installing PostgreSQL..."
    sudo apt-get install -y postgresql postgresql-contrib
    echo "PostgreSQL installed successfully."
}

# Function to install PostgreSQL on RHEL-based systems
install_postgresql_rhel() {
    echo "Installing PostgreSQL..."
    sudo dnf install -y postgresql-server postgresql-contrib
    echo "PostgreSQL installed successfully."
}

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    sudo apt-get install -y docker.io
    echo "Docker installed successfully."
}

# Function to install WordPress
install_wordpress() {
    echo "Installing WordPress..."
    # Add WordPress installation steps here
    echo "WordPress installed successfully."
}

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
echo "Which application would you like to manage?"
echo "1. Install Nginx"
echo "2. Install PostgreSQL"
echo "3. Install Docker"
echo "4. Install WordPress"
echo "5. Uninstall Nginx"
echo "6. Uninstall PostgreSQL"
echo "7. Uninstall Docker"
echo "8. Uninstall WordPress"
echo "Enter the number of your choice: "
read -r choice

case $choice in
    1) 
        if [[ "$OS" == "Debian" ]]; then
            install_nginx_debian
        elif [[ "$OS" == "RHEL" ]]; then
            install_nginx_rhel
        fi
        ;;
    2) 
        if [[ "$OS" == "Debian" ]]; then
            install_postgresql_debian
        elif [[ "$OS" == "RHEL" ]]; then
            install_postgresql_rhel
        fi
        ;;
    3) 
        install_docker
        ;;
    4)
        install_wordpress
        ;;
    5) 
        if [[ "$OS" == "Debian" ]]; then
            uninstall_nginx_debian
        elif [[ "$OS" == "RHEL" ]]; then
            uninstall_nginx_rhel
        fi
        ;;
    6) 
        if [[ "$OS" == "Debian" ]]; then
            uninstall_postgresql_debian
        elif [[ "$OS" == "RHEL" ]]; then
            uninstall_postgresql_rhel
        fi
        ;;
    7) 
        uninstall_docker
        ;;
    8)
        uninstall_wordpress
        ;;
    *) 
        echo "Invalid choice. Exiting..." 
        ;;
esac


#!/bin/bash

# Update all with -a
All() {
    echo -e "\nUpdating all components..."
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
    flatpak update -y
    sudo apt install python3 -y
    sudo apt install -y git
    exit 0
}

# installs git

git() {
echo -e "\nInstalling git" 
sudo apt update && sudo apt install -y git
exit 0
}
# Help display with -h
help() {
    echo -e "\nLinux Update Assistant Script"
    echo "This script helps you manage updates on your Linux system."
    echo "Options:"
    echo "1. Run system software updates"
    echo "2. Run Flatpak updates"
    echo "3. Install python3"
    echo "4. Install Git"
    echo "5. Quit"
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h, --help    Show this help message"
    echo "  -v, --version Show version information"
    echo "  -a, --all     Run all update functions"
    echo "  -g, --git     Run git installer"
    echo
}
# Version Display with -v
version() {
    echo -e "\nLinux Update Assistant Script Version 1.0"
    echo "Author: Daniel Berkley"
    echo "License: MIT License"
    exit 0
}
# Main Loop
main() {
while true; do
        echo "============================="
        echo "||  Linux Update Assistant  ||"
        echo "============================="
        echo "1. Run system software updates"
        echo "2. Run Flatpak updates"
        echo "3. Install python3"
        echo "4. Install git"
        echo "5. Quit"
        echo
        echo "Use -h or --help for more information"
        echo
        read -p "Choose an option (1-5 ): " choice
        
        case "$choice" in
            1) echo -e "\nSelected: System software updates"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo -e "\nContinuing with system software updates..." 
                    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
                    ;;
                    n|N) echo -e "\nAborting system software updates." ;;
                    *) echo -e "\nInvalid response: $answer" ;;
                    
                esac
                ;;
            2) echo -e "\nSelected: Flatpak updates"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo -e "\nContinuing with Flatpak updates..." 
                    flatpak update -y
                    ;;
                    n|N) echo -e "\nAborting Flatpak updates." ;;
                    *) echo -e "\nInvalid response: $answer" ;;
                esac
                ;;
            3) echo -e "\nSelected: Install python3"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo -e "\nContinuing with python3 installation..."
                    sudo apt install python3 -y
                    ;;
                    n|N) echo -e "\nAborting python3 installation." ;;
                    *) echo -e "\nInvalid response: $answer" ;;
                esac
                ;;
            4) echo -e "\nSelected: Install Git"
                read -p "Would you like to continue with the Git installation? y/n: " answer
                case "$answer" in
                    y|Y) echo -e "\nContinuing with the installation..."
                    sudo apt update && sudo apt install -y git
                    ;;
                    n|N) echo -e "\nAborting installation" ;;
                    *) echo -e "\nInvalid response: $answer" ;;
                esac
                ;;
            5) echo -e "\nBye."; exit 0 ;;
            help|--help|h) help ;;
            *) echo -e "\nInvalid choice: $choice" ;;
        esac

    
    done
}
# Argument options

case "$1" in
    -g|--git) git ;;
    -h|--help) help ;;
    -v|--version) version ;;
    -a|--all) All ;;
    *) main "$@" ;;
esac    

main "$@"

#!/bin/bash

# Update all with -a
All() {
    echo "Updating all components..."
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
    flatpak update -y
    sudo apt install python3 -y
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
    echo "Linux Update Assistant Script"
    echo "This script helps you manage updates on your Linux system."
    echo "Options:"
    echo "1. Run system software updates"
    echo "2. Run Flatpak updates"
    echo "3. Install python3"
    echo "4. Quit"
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
    echo "Linux Update Assistant Script Version 1.0"
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
        echo "4. Quit"
        echo
        echo "Use -h or --help for more information"
        echo
        read -p "Choose an option (1-4 ): " choice
        
        case "$choice" in
            1) echo "Selected: System software updates"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo "Continuing with system software updates..." 
                    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
                    ;;
                    n|N) echo "Aborting system software updates." ;;
                    *) echo "Invalid response: $answer" ;;
                    
                esac
                ;;
            2) echo "Selected: Flatpak updates"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo "Continuing with Flatpak updates..." 
                    flatpak update -y
                    ;;
                    n|N) echo "Aborting Flatpak updates." ;;
                    *) echo "Invalid response: $answer" ;;
                esac
                ;;
            3) echo "Selected: Install python3"
                read -p "Would you like to continue? y/n: " answer
                case "$answer" in
                    y|Y) echo "Continuing with python3 installation..."
                    sudo apt install python3 -y
                    ;;
                    n|N) echo "Aborting python3 installation." ;;
                    *) echo "Invalid response: $answer" ;;
                esac
                ;;
            4) echo "Bye."; exit 0 ;;
            help|--help|h) help ;;
            *) echo "Invalid choice: $choice" ;;
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

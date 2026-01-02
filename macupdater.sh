#!/bin/bash


# Help Display Function
help()
{	
	echo -e "\nMac Update Assistant Script"
	echo "This script helps you manage updates on your Mac."
	echo "Options:"
	echo "1. Run macOS software updates"
	echo "2. Run Homebrew updates"
	echo "3. Run App Store updates"
	echo "4. Install or update git" 
	echo "5. Quit"
	echo "Usage: $0 [options]"
	echo "Options:"
	echo "  -h, --help    Show this help message"
	echo "  -v, --version Show version information"
	echo "  -a, --all     Run all update functions"
	echo "  -g, --git	  Run git install or update"
	exit 0
}

#git installer

git() {
	echo -e "\nRunning git installation..."
	brew install git
	exit 0
}
# Version Display Function
version()
{		
	echo "Mac Update Assistant Script Version 1.0"
	echo "Author: Daniel Berkley"
	echo "License: MIT License"
	exit 0
}

# Update All
All() {
	echo "Updating all components..."
	sudo softwareupdate -ia
	brew update && brew upgrade && brew cleanup
	brew list mas && brew install mas && mas outdated && mas upgrade
	exit 0
}
# Main Menu Function

main() {
	while true; do
		echo "============================="
		echo "||  Mac Update Assistant   ||"
		echo "============================="
		echo "1. Run macOS software updates"
		echo "2. Run Homebrew updates"
		echo "3. Run App Store updates"
		echo "4. Install or update git"
		echo "5. Quit"
		echo

		read -p "Choose an option (1-5): " choice
		case "$choice" in
			1) echo "Selected: macOS software updates"
				read -p "Would you like to continue? y/n: " answer
				case "$answer" in
					y|Y) echo "Continuing with macOS software updates..." 
					sudo softwareupdate -ia 
					;;
					n|N) echo "Aborting macOS software updates." ;;
					*) echo "Invalid response: $answer" ;;
				esac
				;;
			2) echo "Selected: Homebrew updates"
				read -p "Would you like to continue? y/n: " answer
				case "$answer" in
					y|Y) echo "Continuing with Homebrew updates..." 
					brew update && brew upgrade && brew cleanup 
					;;
					n|N) echo "Aborting Homebrew updates." ;;
					*) echo "Invalid response: $answer" ;;
				esac
				;;
			3) echo "Selected: App Store updates"
				read -p "Would you like to continue? y/n: " answer
				case "$answer" in
					y|Y) echo "Continuing with App Store updates..." 
					brew list mas && brew install mas && mas outdated && mas upgrade
					;;
					n|N) echo "Aborting App Store updates." ;;
					*) echo "Invalid response: $answer" ;;
				esac
				;;
			4) echo "Selected: Install Git"
				read -p "Would you like to continue? y/n: " answer
				case "$answer" in
					y|Y) echo "Continuing with git installation..."
					brew install git
					;;
					n|N) echo "Aborting git installation"
					;;
					*) echo "invalid response: $answer" ;;
				esac
				;;
			5) echo "Bye."; exit 0 ;;
			help|--help|h) help ;;
			*) echo "Invalid choice: $choice" ;;
			esac

	done
}

case "$1" in
	"") main "$@" ;;
	-h|--help) help ;;
	-v|--version) version ;;
	-a|--all) All ;;
	-g|--git) git ;; 
	*) echo -e "\nInvalid option: $1" ; help ;;
esac

main "$@"


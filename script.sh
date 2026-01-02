#!/bin/bash


# Help Display Function
help()
{	
	echo
	echo "Mac Update Assistant Script"
	echo "This script helps you manage updates on your Mac."
	echo "Options:"
	echo "1. Run macOS software updates"
	echo "2. Run Homebrew updates"
	echo "3. Run App Store updates"
	echo "4. Quit"
	echo "Usage: $0 [options]"
	echo "Options:"
	echo "  -h, --help    Show this help message"
	echo "  -v, --version Show version information"
	echo "  -a, --all     Run all update functions"
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
		echo "4. Quit"
		echo

		read -p "Choose an option (1-4): " choice
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
			4) echo "Bye."; exit 0 ;;
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
	*) echo -e "\nInvalid option: $1" ; help ;;
esac

main "$@"


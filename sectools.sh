#!/bin/bash

ALL()
{
    echo "Installing all Security tools..."
    brew install nmap 
    brew install wireshark 
    brew install tcpdump 
    brew install metasploit
    brew install --cask burp-suite
}
Help()
{
    echo "Showing help information..."
    echo "Available commands:"
    echo "  ALL | -A | -a      - Install all security tools"
    echo "  Help | -H | -h     - Show this help message"
}

# Selection menu
main()
{
  while true; do
    echo "+--------------------------------+"
    echo "|Security Operations Batch loader|"
    echo "+--------------------------------+"
    echo "1. Install nmap"
    echo "2. Install wireshark"
    echo "3. Install tcpdump"
    echo "4. Install metasploit"
    echo "5. Install burpsuite"
    echo "6. Exit"
    read -p "Select an option: " option

      case $option in
      1)
        echo "Installing nmap...";
        brew install nmap
        ;;
      2)
        echo "Installing wireshark...";
        brew install wireshark-app
        ;;
      3)
        echo "Installing tcpdump...";
        brew install tcpdump
        ;;
      4)
        echo "Installing metasploit...";
        brew install metasploit
        ;;
      5)
        echo "Installing burpsuite...";
        brew install --cask burp-suite
        ;;
      6)
        echo "Exiting..."
        exit 0
        ;;
      *)
        echo "Invalid option. Please select between 1-6."
        ;;
    esac
done
}

case "$1" in
"") main "$@" ;;
-A|-a)
  ALL
  exit 0
  ;;
-H|-h) 
  Help
  exit 0
  ;;
*)
  echo "Invalid option. Use -H for help."
  exit 1
  ;;
  esac
  

  main "$@"
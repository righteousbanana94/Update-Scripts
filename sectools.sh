#!/bin/bash

ALL()
{
    echo "Installing all Security tools..."
    apt-get update && apt-get install nmap wireshark tcpdump metasploit-framework -y
}
Help()
{
    echo "Showing help information..."
    echo "Available commands:"
    echo "  ALL       - Install all security tools"
    echo "  Help      - Show this help message"
}

# Selection menu
echo "+--------------------------------+"
echo "|Security Operations Batch loader|"
echo "+--------------------------------+"
echo "1. Install nmap"
echo "2. Install wireshark"
echo "3. Install tcpdump"
echo "4. Install metasploit"
echo "5. Install burpsuite"
echo "6. Exit"
read option

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
    brew install burpsuite  
    ;;
  6)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "Invalid option. Please select between 1-6."
    ;;
esac

case $option in
  ALL|-a)
    ALL
    ;;
  Help|-h)
    Help
    ;;
  *)
    echo "Invalid option. Please select between 1-6."
    ;;
esac    

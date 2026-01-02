# Mac and Linux Update tool

## Description

A collection of Bash scripts designed to automate common system update and maintenance tasks.


## Usage

1. Clone the repository:
```bash
git clone https://github.com/righteousbanana94/Update-Scripts.git
cd Update-Scripts
```

2. Make the script executeable
```bash
chmod +x scripts/*.sh
```

3. Run the script

```bash
./scripts/script-name.sh
```


## Arguments

This script accepts optional command-line arguments to run specific actions without using the interactive menu.

### Options

- `-h`, `--help`  
  Show usage information and exit.

- `-v`, `--version`  
  Show version and author information and exit.

- `-g`, `-git`
  Installs git

- `-a`, `--all`  
  Run all update actions automatically:
  - System package updates
  - Flatpak updates
  - Install `python3`
  - Install `git`

### Examples

```bash
./linux-update-assistant.sh        # Interactive menu
./linux-update-assistant.sh -a     # Run all updates
./linux-update-assistant.sh --help # Show help
```


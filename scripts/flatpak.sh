#!/bin/bash
# Reference: https://github.com/lissy93/dotfiles

# Remote origin to use for installations
flatpak_origin='flathub'

# List of desktop apps to be installed (specified by app ID)
flatpak_apps=(
  'app.drey.Dialect'
  'com.discordapp.Discord'
  'com.github.eneshecan.WhatsAppForLinux'
  'com.github.finefindus.eyedropper'
  'com.github.zocker_160.SyncThingy'
  'com.mattjakeman.ExtensionManager'
  'de.shorsh.discord-screenaudio'
  'io.crow_translate.CrowTranslate'
  'io.github.nate_xyz.Paleta'
  'io.github.seadve.Kooha'
  'md.obsidian.Obsidian'
  'org.gnome.Music'
  'org.gnome.design.Contrast'
  'org.gnome.design.IconLibraryv'
  'org.gnome.design.Palette'
  'org.gnome.design.Typography'
  'org.kde.umbrello'
  'com.librumreader.librum'
)

# Color Variables
CYAN_B='\033[1;96m'
YELLOW='\033[0;93m'
RED_B='\033[1;31m'
RESET='\033[0m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
LIGHT='\x1b[2m'

# Options
PROMPT_TIMEOUT=15
PARAMS=$*

if [[ $PARAMS == *"--auto-yes"* ]]; then
  PROMPT_TIMEOUT=1
  AUTO_YES=true
fi

# Helper function to install each app if not already installed
function install_app () {
  app=$1

  # If --prompt-before-each is set, then ask user if they'd like to proceed
  if [[ $PARAMS == *"--prompt-before-each"* ]]; then
    echo -e -n "\n${CYAN_B}Would you like to install ${app}? (y/N) ${RESET}"
    read -t 15 -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
      echo -e "\n${YELLOW}[Skipping] ${LIGHT}${app}, rejected by user${RESET}"
      return
    fi
    echo
  fi

  # Check if the app is already installed via Flatpak
  if flatpak list --columns=ref | grep -q $app; then
    echo -e "${YELLOW}[Skipping] ${LIGHT}${app} is already installed.${RESET}"
  else
    echo -e "${GREEN}[Installing] ${LIGHT}Downloading ${app} (from ${flatpak_origin}).${RESET}"
    if [[ $PARAMS == *"--dry-run"* ]]; then return; fi # Skip if --dry-run enabled
    flatpak install -y --noninteractive $flatpak_origin $app
  fi
}

function print_usage () {
  echo -e "${CYAN_B}Flatpak Fedora Desktop App Installation and Update script${RESET}"
  echo -e "${PURPLE}This script will:\n"\
  "- Update all currently installed Flatpak apps\n"\
  "- Install each app in the list if not already present\n"\
  "${RESET}"
}

# Show help menu
print_usage
if [[ $PARAMS == *"--help"* ]]; then exit; fi

# Ask user if they'd like to proceed, and exit if not
echo -e "${CYAN_B}Would you like to install Flatpak desktop apps? (y/N)${RESET}\n"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]] && [[ $AUTO_YES != true ]] ; then
  echo -e "${YELLOW}Skipping Flatpak installations..."
  exit 0
fi

echo -e "${CYAN_B}Starting Flatpak App Installation Script${RESET}"

# Add FlatHub as upstream repo, if not already present
echo -e "${PURPLE}Adding Flathub repo${RESET}"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update currently installed apps
echo -e "${PURPLE}Updating installed apps${RESET}"
flatpak update --assumeyes --noninteractive

# Install each app listed above (if not already installed)
echo -e "${PURPLE}Installing apps defined in manifest${RESET}"
for app in ${flatpak_apps[@]}; do
  install_app $app
done

echo -e "${PURPLE}Finished processing Flatpak apps${RESET}"

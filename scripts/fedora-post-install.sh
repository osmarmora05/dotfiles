#!/bin/bash

: '

Autor: osmarmora05
https://github.com/osmarmora05/dotfiles

Warning: Do not take this script as a reference, I do very noob things and many bad practices, my goal is for the script to work :v

References
https://github.com/smittix/fedorable/blob/main/fedorab le.sh
https://github.com/gh0stzk/dotfiles/blob/master/RiceInstaller


This script is based on: https://www.youtube.com/watch?v=RrRpXs2pkzg

'

# Color globals
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#~~~~~~~~~~~~~~

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
ORANGE='\033[0;33m'

# Helper functions
#~~~~~~~~~~~~~~

show_error_with_url() {
  local url="$1"
  echo -e "❌ ${RED} Why don't you check the documentation, maybe the command has been changed: $url ${NC}"
}

show_error() {
  local msg="$1"
  echo -e "❌ ${RED}$msg${NC}"
}

show_warning() {
  local msg="$1"
  echo -e "⚠️ ${ORANGE}$msg${NC}"
}

show_succes() {
  local msg="$1"
  echo -e "✅ ${GREEN}$msg${NC}"
}

# Principal functions
#~~~~~~~~~~~~~~

# Responsibility: Add custom dnf configuration.
# 1. We check if the file exists
# 2. We go through each line of the file and add it to the `coincidences` variable
# 3. We eliminate those elements that `dnf_config` contains that match within the `coincidences` array:
# This is done mainly to add those lines that the `/etc/dnf/dnf.conf` file does not contain by default, basically
# So that you don't find repeated configurations, why imagine that fedora adds the first element of `dnf_config`,
# So with the logic from before it is not added
# 4. We verify that `dnf_config` contains elements, if there are none, it means that the config is already there
# 5. Add the `dnf_config` elements into `/etc/dnf/dnf.conf`, and then grep those added lines
#~~~~~~~~~~~~~~

function DNF_configuration() {
  local dnf_path="/etc/dnf/dnf.conf"
  local dnf_config=("fastestmirror=True" "max_parallel_downloads=10" "defaultyes=True" "keepcache=True")
  local coincidences=()
  local first=true
  local entered_content="# Configuration added by me (installer.sh)"$'\n'

  # Check if the file exists
  if [ -f "$dnf_path" ]; then
    # Go through each line of the file and add it to the coincidences variable
    while IFS= read -r line || [ -n "$line" ]; do
      for i in ${dnf_config[*]}; do
        if [ "$line" = "$i" ]; then
          coincidences+=("$line")
        fi
      done
    done <"$dnf_path"

    # We eliminate those elements that contain dnf config that match within the coincidences array
    # https://stackoverflow.com/questions/16860877/remove-an-element-from-a-bash-array
    if ((${#coincidences[@]} != 0)); then
      for c in ${coincidences[*]}; do
        for index in "${!dnf_config[@]}"; do
          if [ "$c" = "${dnf_config[$index]}" ]; then
            unset 'dnf_config[index]'
          fi
        done
      done
    fi
    # We check if the array is empty
    # https://itsfoss.com/bash-check-array-empty/
    if [[ -z "${dnf_config[@]}" ]]; then
      echo ""
      show_warning "Oh! It seems that the configuration was already there. We abort mission."
      echo ""
    else
      # We loop through each element of dnf_config and add it inside the /etc/dnf/dnf.conf file
      for i in ${dnf_config[*]}; do
        if [ "$first" = true ]; then
          first=false
          echo "
# Configuration added by me (installer.sh)" | sudo tee -a "$dnf_path" >/dev/null
        fi
        echo "$i" | sudo tee -a "$dnf_path" >/dev/null
        entered_content+="$i"$'\n'
      done
      # We grep the added lines
      echo ""
      show_succes "Settings Added!"
      echo ""
      grep --color='auto' "$entered_content" "$dnf_path"
    fi

  else
    echo ""
    show_error "Oh! It seems that the $dnf_path file does not exist, you will have to manually add the configuration."
    echo ""
  fi
}

# Responsibility: Enable RPM repositories https://rpmfusion.org/Configuration
# 1. We execute the RPM fusion command
# 2. We check that the command has been executed well
# 3. We repeat the same RPM funsion step only with the AppStream metadata
#~~~~~~~~~~~~~~

function enable_RPM_function() {
  local fedora_version=$(rpm -E %fedora)
  local rpmfusion_free_url=https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${fedora_version}.noarch.rpm
  local rpmfusion_nonfree_url=https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${fedora_version}.noarch.rpm
  local rpm_fusion_command="sudo dnf install "$rpmfusion_free_url" "$rpmfusion_nonfree_url""
  local appstream_metadate_command="sudo dnf groupupdate core"

  $rpm_fusion_command

  if [ $? -eq 0 ]; then
    echo ""
    show_succes "RPM Fusion has been installed successfully!"
    echo ""
  else
    show_error "Oh, wow! It appears that the RPM Fusion Installation has been cancelled. Command executed: $rpm_fusion_command"
    show_error_with_url "https://rpmfusion.org/Configuration"
  fi

  $appstream_metadate_command

  if [ $? -eq 0 ]; then
    echo ""
    show_succes "AppStream metadata has been successfully updated!"
    echo ""
  else
    show_error "Oh, wow! It appears that the AppStream metadata update has been cancelled. Command executed: $appstream_metadate_command"
    show_error_with_url "https://rpmfusion.org/Configuration"
  fi
}

# Responsibility: Enable flathub repositories https://dl.flathub.org/repo/flathub.flatpakrepo
# 1. We run the command to enable the flathub repo
# 2. We check that the command has been executed correctly
#~~~~~~~~~~~~~~

function enable_flatpak() {
  local flatpak_commmand="flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"

  $flatpak_commmand

  if [ $? -eq 0 ]; then
    echo ""
    show_succes "flathub has been successfully enabled!"
    echo ""
  else
    show_error "Oh, wow! It seems that flathub repositories have not been enabled. Command executed: $appstream_metadate_command"
    show_error_with_url "https://flatpak.org/setup/Fedora"
  fi
}

# Responsibility: Enable/install the media codes https://rpmfusion.org/Howto/Multimedia
#1. Run the `groupupdate_multimedia_command` and `groupupdate_sound_and_video_command` commands
# 2. We check that the command has been executed correctly
#~~~~~~~~~~~~~~

function install_media_codecs() {

  local groupupdate_multimedia_command="sudo dnf groupupdate multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin"
  local groupupdate_sound_and_video_command="sudo dnf groupupdate sound-and-video"

  $groupupdate_multimedia_command

  if [ $? -eq 0 ]; then
    echo ""
    show_succes "Groupupdate Multimedia has been installed successfully!"
    echo ""
  else
    show_error "Oh, wow! It seems that the Groupupdate Multimedia Installation has been cancelled. Command executed: $appstream_metadate_command"
    show_error_with_url "https://rpmfusion.org/Howto/Multimedia"
  fi

  $groupupdate_sound_and_video_command

  if [ $? -eq 0 ]; then
    echo ""
    show_succes "Groupupdate Sound And Video has been installed successfully!"
    echo ""
  else
    show_error "Oh, wow! It seems that the Installation of Groupupdate Sound And Video has been cancelled. Command executed: $appstream_metadate_command"
    show_error_with_url "https://rpmfusion.org/Howto/Multimedia"
  fi
}

# Responsibility: Show the main menu of the script
# 1. The function requires the `question` and the `action` as arguments
# 2. In a loop we execute the user's response, if it is the `y` or `n` options, then it runs its corresponding function and breaks the loop
#~~~~~~~~~~~~~~

function show_menu_and_execute_action() {
  local question="$1"
  local action="$2"

  while true; do
    read -p "$question [y/n]: " choice
    case $choice in
    [Yy]*)
      $action
      break
      ;;
    [Nn]*)
      break
      ;;
    *)
      echo "Please answer with 'y' for yes or 'n' for no."
      ;;
    esac
  done
}

# First we check if the user is SUPERUSER
# If it is '0' then it is superuser
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ "$(id -u)" = 0 ]; then
  show_error "This script SHOULD NOT BE RUN AS ROOT."
  exit 1
fi

# Menu Execution

show_menu_and_execute_action "Do you want to add DNF configuration?" DNF_configuration
show_menu_and_execute_action "Do you want to enable RPM Fusion?" enable_RPM_function
show_menu_and_execute_action "Do you want to enable Flatpak?" enable_flatpak
show_menu_and_execute_action "Do you want to install Media Codecs?" install_media_codecs

echo "Bay!"
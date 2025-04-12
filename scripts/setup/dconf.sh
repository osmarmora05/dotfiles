#!/bin/bash

extension=(
    https://extensions.gnome.org/extension/307/dash-to-dock/
    https://extensions.gnome.org/extension/615/appindicator-support/
    https://extensions.gnome.org/extension/19/user-themes/
    https://extensions.gnome.org/extension/3396/color-picker/
    https://extensions.gnome.org/extension/1319/gsconnect/
    https://extensions.gnome.org/extension/4470/media-controls/
)

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

echo "Dconf: "
echo "- Installing gnome extension: "

for i in "${extension[@]}"; do
    echo "  - Extension: $i"
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done

favorite_apps_to_the_dock=(
    "brave-browser.desktop" 
    "firefox.desktop"
    "nvim.desktop"
    "org.wezfurlong.wezterm.desktop"
    "org.gnome.Nautilus.desktop"
    "org.gnome.Calendar.desktop"
    "codium.desktop"
    "obsidian.desktop"
    "discord.desktop"
    "com.github.finefindus.eyedropper.desktop"
    "org.gnome.design.Contrast.desktop"
)

echo "- Pin favorite apps to the dock:"
echo ""${favorite_apps_to_the_dock[@]}""
apps_list=$(printf ",'%s'" "${favorite_apps_to_the_dock[@]}")
apps_list="[${apps_list:1}]"
gsettings set org.gnome.shell favorite-apps "$apps_list"


echo "- dash-to-dock click actions: previews"
echo "- dash-to-dock hot-keys false"
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock click-action 'previews'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock hot-keys false

echo "- org.gnome.desktop.wm.preferences..."
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.mutter dynamic-workspaces false

echo "- org.gnome.desktop.interface: show-battery-percentage: true, color-scheme: dark"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

echo "- org.gnome.desktop.wm.keybindings..."
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1  "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2  "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3  "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4  "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5  "['<Super>5']"

echo "- org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0..."
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding
'<Super>Return'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command
 'wezterm'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'term'

echo "- Creating folders: ~/Dev ~/Vault ~/Imágenes/Screenshots"
mkdir -p $HOME/Dev $HOME/Vault $HOME/Imágenes/Screenshots

echo "Completed dcon.sh"
echo ""

#!/bin/bash

CURSOR_THEME_URL="https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur.tar.gz"
CURSOR_THEME_NAME="macOS-BigSur"
ICON_DEST_DIR="$HOME/.icons"
FONT_DEST_DIR="$HOME/.fonts"
CURSOR_SIZE=40

fonts=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
)

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

echo "Cursor theme: $CURSOR_THEME_URL $CURSOR_THEME_NAME $ICON_DEST_DIR $CURSOR_SIZE"
echo "- Downloading the cursor theme..."
wget -O /tmp/cursor-theme.tar.gz "$CURSOR_THEME_URL"
if [ $? -ne 0 ]; then
    echo "Error downloading the theme. Please check the URL"
    exit 1
fi

echo "- Extracting the cursor theme..."
tar -xvf /tmp/cursor-theme.tar.gz -C /tmp
if [ $? -ne 0 ]; then
    echo "Error extracting the file"
    exit 1
fi

echo "- Installing the cursor theme..."
mkdir -p "$ICON_DEST_DIR"
mv /tmp/$CURSOR_THEME_NAME* "$ICON_DEST_DIR"
if [ $? -ne 0 ]; then
    echo "Error copying the files to the icons directory"
    exit 1
fi

echo "- Configuring the cursor theme..."
gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME_NAME"
gsettings set org.gnome.desktop.interface cursor-size "$CURSOR_SIZE"
if [ $? -ne 0 ]; then
    echo "Error configuring the cursor theme"
    exit 1
fi

echo "- Cleaning up temporary files..."
rm -rf /tmp/cursor-theme.tar.gz /tmp/$CURSOR_THEME_NAME*

echo "Installing Fonts: "
echo " - Fonts:"
echo ""${fonts[@]}""

mkdir -p "$FONT_DEST_DIR"
cd "$FONT_DEST_DIR"
for font in "${fonts[@]}"; do
    font_name=$(basename "$font" .zip)

    echo "- Downloading font $font"
    wget -q -O "$font_name.zip" "$font"
    
    if [ $? -ne 0 ]; then
        echo "Error downloading the font. Please check the URL"
        exit 1
    fi

    echo "- Creating directory for $font_name"
    mkdir -p "$FONT_DEST_DIR/$font_name"
    
    echo "- Cleaning up temporary files and decompressing..."
    unzip "$font_name.zip" -d "$FONT_DEST_DIR/$font_name"  && rm "$font_name.zip"
done

fc-cache -fv

echo "Completed theme.sh"
echo ""
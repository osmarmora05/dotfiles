<!-- PROFILE PICTURE -->
<p align="center">
  <img width="25%" src="https://github.com/osmarmora05.png" style="border-radius: 12px;"/>
</p>

<!-- NAME PROYECT -->
<p align="center">
  <b>~ osmarmora05's configuration Sway ~</b>
</p>

<img src="./.github/screenshots/sway.jpg">

<!-- FEATURES -->

# Features

- Bar with computer information
- Exit screen
- Minimalist lock screen
- Launcher

<!-- SETUP -->

# Setup

1. Install Required Dependencies

- [Sway](https://swaywm.org/) (Windows manager)
- [Waybar](https://github.com/Alexays/Waybar) (Bar)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter) (Notification Center)
- [wlogout](https://github.com/ArtsyMacaw/wlogout) (Exit screen)
- [swaylock](https://github.com/swaywm/swaylock), [swaylock-effects](https://github.com/mortie/swaylock-effects) (Lock screen)
- [Wireplumber](https://github.com/PipeWire/wireplumber) (Audio control)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) (Brightness control)
- [rofi](https://github.com/adi1090x/rofi) (Launcher)
- [hyprpicker](https://github.com/hyprwm/hyprpicker) (Color picker)
- [wayshot](https://github.com/reinefjord/wayshot), [grim](https://github.com/emersion/grim), [slurp](https://github.com/emersion/slurp), [jq](https://github.com/jqlang/jq) (Screenshot)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (Clipboard)
- [notify-send](https://github.com/GNOME/libnotify) (Notifications)
- [IBM-Plex-Mono](https://github.com/IBM/plex/tree/master/IBM-Plex-Mono/fonts/complete/ttf), [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads) (fonts) (you can find the required fonts inside the `fonts` folder of this repository)

<details>
<summary><b>Fedora</b></summary>

<p align="center">
    <b> </b>
</p>

> 1. Required Packages

```shell
sudo dnf install waybar sway wlogout swaylock wireplumber brightnessctl rofi grim slurp jq wl-clipboard notify-send
```

> To install `swaylock-effects` you will need the following dependencies and follow the build instructions [here](https://github.com/mortie/swaylock-effects):

```shell
sudo dnf install ninja-build meson wayland-protocols-devel wayland-devel
```

> To install `hyprpicker` you will need the following dependencies and follow the build instructions [here](https://github.com/hyprwm/hyprpicker):

```shell
sudo dnf install ninja-build meson mesa-libGLES-devel pango pango-devel
```

</details>

Install my configuration files

```shell
stow sway swaylock waybar wlogout rofi swaync
```

<p align="center">
    <b> </b>
</p>

<!-- CONFIGURATION -->

# Configuration

<p align="center">
    <b> </b>
</p>

~ `sway/config`: add terminal, gap size, file explorer, wallpaper path, screenshot directory path

~ So that the top bar correctly shows you the brightness percentage and allows you to control it. You must specify the brightness of the device, in my case it is AMD

`waybar/config`:

```json
"backlight": {
          "device": "amdgpu_bl2", // line to modify
          "format": "{percent}% {icon}",
          "format-icons": [
               "󰃞",
               "󰃟",
               "󰃠"
          ]
     },
```

`swaync/config`:

```json
"backlight": {
      "label": "󰃟",
      "device": "amdgpu_bl2"  // line to modify
    }
```

The device name resides in the following path: `/sys/class/backlight/`

<p align="center">
    <b> </b>
</p>

<!-- KEYBINDS -->

# Usage

<details>

| Keybind                 | Description                           |
| ----------------------- | ------------------------------------- |
| Sway                    | -                                     |
| `mod + Shift + q`       | Exit Sway.                            |
| `mod + Control + r`     | Reload config.                        |
| Applications            | -                                     |
| `mod + Return`          | Opens a terminal.                     |
| `mod + Shift + e`       | Opens a GUI file manager.             |
| Window Management       | -                                     |
| `mod + q`               | Close focused client.                 |
| `Control + mod + Space` | toggle floating.                      |
| `mod + j`               | Focus next by index.                  |
| `mod + k`               | Focus previous by index.              |
| `mod + m`               | (un)maximize.                         |
| `mod + n`               | Minimze.                              |
| Media Management        | -                                     |
| `XF86AudioRaiseVolume`  | Increase system audio volume.         |
| `XF86AudioLowerVolume`  | Decrease system audio volume.         |
| `XF86MonBrightnessUp`   | Increase screen backlight brightness. |
| `XF86MonBrightnessDown` | Decrease screen backlight brightness. |
| `Print`                 | Take cursor selection screenshot.     |
| `mod + Print`           | Take fullscreen screenshot.           |
| `mod + o`               | Color picker.                         |
| UI                      | -                                     |
| `mod + c`               | Toggle control center visibility.     |

</details>

<p align="center">
    <b> </b>
</p>

<!-- CREDITS -->

# Credits

- [yakei](https://gitlab.com/yakei/Desktop): Reference to get started with sway and its waybar configuration is very easy to understand. Very good
- [Stephan Raabe](https://gitlab.com/stephan-raabe/dotfiles/-/tree/main?ref_type=heads): Configuration for swaylock, wlogout. And also, their YouTube channel is very good and explains things very clearly.
- [ozwaldorf's](https://github.com/ozwaldorf/dotfiles): Setup for Swayfx
- [rxyhn's](https://github.com/ozwaldorf/dotfiles): Waybar and SwayNotificationCenter
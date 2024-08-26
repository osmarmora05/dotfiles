<!-- PROFILE PICTURE -->
<p align="center">
  <img width="25%" src="https://github.com/osmarmora05.png" style="border-radius: 12px;"/>
</p>

<!-- NAME PROYECT -->
<p align="center">
  <b>~ osmarmora05's configuration AwesomeWM ~</b>
</p>

<img src="./.github/screenshots/awesome.jpg">

<!-- FEATURES -->
# Features
- Control center
- Panel with shortcuts to popular pages with a task list
- Notifications
- Screenshot tools
- Interactive calendar
- Cute battery face
- Minimalist exitscreen
- Multiple color schemes

<!-- SETUP -->
# Setup
1. Install Required Dependencies
- [AwesomeWM](https://github.com/awesomeWM/awesome) (Windows manager)
- [Network Manager](https://github.com/NetworkManager/NetworkManager) (Network control)
- [Pipewire](https://github.com/PipeWire/pipewire), [Wireplumber](https://github.com/PipeWire/wireplumber) (Audio control)
- [maim](https://github.com/naelstrof/maim), [slop](https://github.com/naelstrof/slop), [xclip](https://github.com/astrand/xclip) (Screenshots)
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) (Icon pack)
- [IBM Plex Sans](https://github.com/IBM/plex/tree/master/IBM-Plex-Sans/fonts/complete/ttf), [IBM-Plex-Mono](https://github.com/IBM/plex/tree/master/IBM-Plex-Mono/fonts/complete/ttf) (Fonts) or (You can find the required fonts inside the `fonts` folder of this repository)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) (Brightness control)
- [bluez](https://github.com/bluez/bluez) (Bluetooth control)
- [upower](https://github.com/freedesktop/upower) (Battery control)
- [gpick](https://github.com/thezbyg/gpick), [ImageMagick](https://github.com/ImageMagick/ImageMagick) (Color picker)

<details>
<summary><b>Fedora</b></summary>

<p align="center">
    <b> </b>
</p>

> 1. To install `AwesomeWM` you will need the following dependencies and follow the build instructions [here](https://github.com/awesomeWM/awesome):

```shell
sudo dnf install xcb-util-devel xcb-util-keysyms-devel xcb-util-wm-devel \
startup-notification-devel libxdg-basedir-devel xcb-util-xrm-devel \
libxkbcommon-x11-devel xcb-cursor-devel make automake \
gcc gcc-c++ cmake glib2-devel gdk-pixbuf2-devel cairo-devel \
libX11-devel xcb-util-cursor-devel xcb-util-devel xcb-util-keysyms-devel \
xcb-util-wm-devel libxkbcommon-devel cairo-devel xcb-util-image-devel \
libstartup-notification-devel libxdg-basedir-devel xcb-util-xrm-devel \
libxcb-devel lua-devel cmake startup-notification-devel libxkbcommon-devel \
libxkbcommon-x11-devel libxdg-basedir-devel xcb-util-xrm-devel lua-lgi lua-devel
```

> 2. Required Packages

```shell
sudo dnf install NetworkManager pipewire wireplumber maim slop xclip brightnessctl bluez upower papirus-icon-theme gpick ImageMagick
```

</details>

<p align="center">
    <b> </b>
</p>

> _At this point I assume you have installed the modules.._

Install my configuration files

```shell
stow awesome
```

<!-- CONFIGURATION -->
# Configuration
<details>

<p align="center">
    <b> </b>
</p>

Most of this project follows the structure of the [Suconakh](https://github.com/suconakh/awesome-awesome-rc) project. However, there are some additions by [gwynsav](https://github.com/Gwynsav/gwileful).

~ `config/user.lua` aggregates user options like the wallpaper, avatar, and other options like gaps, colorscheme, screenshot.

| Variable       | Type      | Description                                                                        |
| -------------- | --------- | ---------------------------------------------------------------------------------- |
| gaps           | `integer` | Spacing between clients and screen padding size                                    |
| colorscheme    | `string`  | `default`, `everblush`, `everforest`, `tokyonight`, <br> `catppuccin`,`mar`,`nord`,`gruvbox_dark`,`dracula`, <br> `adwaita`, `gruvbox_light`,`solarized_dark`,`solarized_light` <br>`plata`,`amarena`,`rose`,`ephemeral`,`skyfall`,,`clean`, `sexy` <br> `oxocarbon`, `biscuit`, `janleigh`, `fullerene`|
| avatar         | `string`  | Path to user profile picture                                                       |
| wallpaper      | `string`  | Path to user wallpaper                                                             |
| screenshot_dir | `string`  | Directory to save screenshots to                                                   |

<p align="center">
  <b> </b>
</p>

> **Warning**
It is not recommended to move the `colorscheme` variable in the `config/user.lua` file from line **21**. Because it is linked to the `themer` widgets, since its functionality is to edit this line depending on the theme set. If you move it from the current line, you must modify the second argument of the `open_file` function call in the `widgets/control/module/themer.lua` file.

```lua
M.open_file('   colorscheme = "' .. current:gsub('"', '\\"') .. '",', 21, gfs.get_configuration_dir() .. "config/user.lua") --Change theme
```
---

~ `config/apps.lua` Here the default programs are defined

| Variable       | Type      |
| -------------- | --------- |
| terminal       | `string`  |
| editor         | `string`  |
| browser        | `string`  |
| file_explorer  | `string`  |

---

~ `config/auto.lua` contains autostart commands to be executed:

- At the start of an X session.
- Every time Awesome is loaded (and reloaded).
- Shell code.

</details>

<p align="center">
    <b> </b>
</p>

<!-- USAGE -->
# Usage
<details>

<p align="center">
    <b> </b>
</p>

The following table details all the available keyboard shortcuts. By default, the `mod (modkey)` key is set to the `Windows key`. If you want to see the keyboard shortcuts from my settings, you can do so by pressing the `mod + s` key.

| Keybind                | Description                                                |
| ---------------------- | ---------------------------------------------------------- |
| AwesomeWM              | -                                                          |
| `mod + Control + r`    | Reload AwesomeWM.                                          |
| `mod + s`              | Show help.                                                 |
| `mod + w`              | Show main menu.                                            |
| Applications           | -                                                          |
| `mod + Return`         | Opens a terminal.                                          |
| `mod + Shift + e`      | Opens a GUI file manager.                                  |
| Window Management      | -                                                          |
| `mod + q`              | Close focused client.                                      |
| `mod + Mouse1`         | Move client by dragging mouse.                             |
| `mod + Mouse3`         | Resize client by dragging mouse.                           |
| `Control + mod + Return`  | Move to master.                                         |
| `Control + mod + m`    | (un)maximize vertically.                                   |
| `Control + mod + n`    | Restore minimized.                                         |
| `Control + mod + Space` | toggle floating.                                          |
| `Shift + mod + j`      | Swap with next client by index.                            |
| `Shift + mod + k`      | Swap with previous client by index.                        |
| `Shift + mod + m`      | (un)maximize horizontally.                                 |
| `mod + f`              | Toggle fullscreen.                                         |
| `mod + j`              | Focus next by index.                                       |
| `mod + k`              | Focus previous by index.                                   |
| `mod + m`              | (un)maximize.                                              |
| `mod + n`              | Minimze.                                                   |
| `mod + o`              | Move to screen.                                            |
| `mod + t`              | Toggle keep on top.                                        |
| `mod + Tab`            | Go back.                                                   |
| `mod + u`              | Jump to urgent client.                                     |
| Layout Management      | -                                                          |
| `Alt + mod + j`        | Decrease client with factor.                               |
| `Alt + mod + k`        | Increase client with factor.                               |
| `Control + mod + h`    | Increase the number of columns.                            |
| `Control + mod + l`    | Decrease the number of columns.                            |
| `Shift + mod + h`      | Increase the number of master clients.                     |
| `Shift + mod + l`      | Decrease the number of master clients.                     |
| `Shift + mod + Space`  | Select previous.                                           |
| `mod + h`              | Decrease master with factor.                               |
| `mod + l`              | Increase master with factor.                               |
| `mod + space`          | Select next.                                               |
| Media Management       | -                                                          |
| `XF86AudioRaiseVolume` | Increase system audio volume.                              |
| `XF86AudioLowerVolume` | Decrease system audio volume.                              |
| `XF86MonBrightnessUp`  | Increase screen backlight brightness.                      |
| `XF86MonBrightnessDown`| Decrease screen backlight brightness.                      |
| `Print`                | Take cursor selection screenshot.                          |
| `mod + Print`          | Take fullscreen screenshot.                                |
| `mod + o`          | Color picker.                                |
| Tag                    | -                                                          |
| `Control + Shift + mod + 1/2/3/4/5/6/7/8/9/0` | Toggle focused client on tag.       |
| `Control + mod + 1/2/3/4/5/6/7/8/9/0` | Toggle tag.                                 |
| `Shift + mod + 1/2/3/4/5/6/7/8/9/0` | Move focused client to tag.                   |
| `mod + Left`           | View previous.                                             |
| `mod + Right`          | View next.                                                 |
| `mod + 1/2/3/4/5/6/7/8/9/0` | Only view tag.                                        |
| `mod + Esc`            | Go back.                                                   |
| UI                     | -                                                          |
| `mod + c`              | Toggle control center visibility.                          |
| `mod + t`              | Toggle themer-panel visibility.                            |
| `mod + Shift + c`      | Toggle calendar visibility.                                |
| `mod + p`              | Toggle menu bar visibility.                                |
| `mod + t`              | Toggle Tools panel visibility.                             |
| `mod + l`              | Toggle QuikLinks visibility.                                |

</details>

<p align="center">
  <b> </b>
</p>

<!-- MODULES -->
# Modules
AwesomeWM Modules:

<details>

<p align="center">
  <b> </b>
</p>

- [animation](https://github.com/Kasper24/KwesomeDE)
  - Animations made by [kasper's](https://github.com/Kasper24/)
- [color](https://github.com/andOrlando/color)
  - Clean and efficient api for color conversion in lua
- [UPower](https://github.com/Aire-One/awesome-battery_widget)
  - A UPowerGlib based battery widget for the Awesome WM
- [rubato](https://github.com/andOrlando/rubato)
  - Smooth animations with a slope curve for AwesomeWM
  
</details>

<p align="center">
  <b> </b>
</p>

<!-- CREDITS -->
# Credits
- [gw's](https://github.com/Gwynsav/gwileful), [chadcat7's](https://github.com/chadcat7/crystal): Base code and reference of my rice
- [Alpha's](https://github.com/AlphaTechnolog/nixdots): Control center and signals slider
- [rxyhn's](https://github.com/rxyhn/yoru): Battery signals and widget
- [elenapan's dotfiles](https://github.com/elenapan/dotfiles): Ideas and color scheme
- [tsukki9696's](https://github.com/tsukki9696/tsukiyomi): Buttons for control center
- [Blyaticon's](https://git.gemia.net/paul.s/homedots): Helpers
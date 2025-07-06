# Concept

A minimal Niri setup, without [Waybar](https://github.com/Alexays/Waybar) or anything else. The idea is to create a distraction-free productivity environment. For tasks like Wi-Fi,
Bluetooth, etc., I manage it through the command line or using TUIs like [Impala](https://github.com/pythops/impala). Perhaps in the future I'll make a bar using [Astal](https://github.com/Aylur/astal) (GTK) or
[Quickshell](https://github.com/quickshell-mirror/quickshell) (QT).

## Setup

1. Install dependencies...

<details>
<summary><b>Fedora</b></summary>

<p align="center">
    <b> </b>
</p>

- [Pipewire](https://github.com/PipeWire/pipewire), [Wireplumber](https://github.com/PipeWire/wireplumber) (Audio control)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) (Brightness control)
- [hyprlock](https://github.com/hyprwm/hyprlock) (Screen lock)
- [xwayland-satellite](https://github.com/Supreeeme/xwayland-satellite) (Running X11 apps in niri)
- [swaybg](https://github.com/swaywm/swaybg) (Wallpaper utility)

</details>

2. Install my configuration files

```shell
stow niri
```

> For the `hyprlock` configuration you have to import the hyrpland configuration :V

```shell
stow hypr
```

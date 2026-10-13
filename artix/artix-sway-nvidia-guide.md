#Artix Linux (OpenRC) Sway + NVIDIA Installation Guide

This guide documents the steps to reproduce the Artix Linux setup with Sway, Wayland, and NVIDIA proprietary drivers.

## 1. Enable Arch Linux & Chaotic AUR Repositories

First, enable Arch repository support for Artix, then add the Chaotic AUR for pre-compiled AUR packages.

```bash
# Install Arch Linux support
sudo pacman -S artix-archlinux-support
sudo pacman-key --populate archlinux

# Add Chaotic AUR keys and mirrorlist
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

*Note: After running this, edit `/etc/pacman.conf` (`sudo nvim /etc/pacman.conf`) to append the Chaotic AUR and Arch Linux repo entries, then update your system with `sudo pacman -Syu`.*

## 2. Configure User Groups

Add your user to the necessary groups for audio, video, and device management.

```bash
sudo usermod -aG video,audio,storage,power,plugdev tinkerist
```

## 3. Install NVIDIA Drivers for LTS Kernel

Since you are using the LTS kernel, you need the LTS headers for the NVIDIA DKMS module.

```bash
sudo pacman -S linux-lts-headers nvidia-580xx-dkms
```

Because NVIDIA is not officially supported by Sway, you must force Sway to run by adding the unsupported GPU flag to your environment variables:

```bash
# Open environment file
sudo nvim /etc/environment

# Add this line to the file:
# export SWAY_UNSUPPORTED_GPU=true
```

## 4. Install Sway & Wayland Utilities

Install the window manager, status bar, app launchers, clipboards, and portals necessary for a functional Wayland desktop.

```bash
sudo pacman -S sway polkit xorg-xwayland xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
waybar swaybg swayidle swaylock wmenu wmenu-run rofi \
dunst cliphist wl-clipboard nwg-look brightnessctl
```

## 5. Install Audio Subsystem

Set up Pipewire for sound management.

```bash
sudo pacman -S pipewire pipewire-pulse wireplumber pipewire-alsa pipewire-openrc wireplumber-openrc pipewire-pulse-openrc alsa-utils
rc-update add pipewire default --user
rc-update add wireplumber default --user
rc-update add pipewire-pulse default --user
```


## 6. Configure the Display Manager

Install the Ly display manager (specifically the OpenRC version) and set it to start on boot while disabling the default TTY2 login to prevent conflicts.

```bash
sudo pacman -S ly ly-openrc
sudo rc-update add ly
sudo rc-update del agetty.tty2
```

## 7. Install Fonts, Terminals, and Applications

Install your preferred terminal emulators, development tools, web browsers, and monitoring utilities.

```bash
# Fonts
sudo pacman -S nerd-fonts ttf-dejavu ttf-liberation noto-fonts

# Terminals
sudo pacman -S foot kitty alacritty

# Applications
sudo pacman -S neovim firefox nautilus lazygit keepassxc spotify-launcher

# System Monitoring
sudo pacman -S btop htop nvtop cmatrix rocm-smi-lib
```

## 8. Clone and Apply Dotfiles

Pull down your personal configurations from GitHub and move them into the correct `.config` directories.

```bash
cd ~
git clone https://github.com/DebNation/dotfiles
cp -r dotfiles/.config/sway ~/.config/

# Reload the configuration if Sway is currently running:
swaymsg reload
```
# Setup sway correctly

`cat /usr/share/wayland-sessions/sway.desktop`
```
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=dbus-run-session sway --unsupported-gpu
Type=Application
DesktopNames=sway;wlroots
```

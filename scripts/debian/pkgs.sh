#!/bin/bash
set -e

# Update package index
sudo apt update

# Install all packages
sudo apt install -y \
  curl \
  wget \
  aria2 \
  libconfig-dev \
  libdbus-1-dev \
  libegl-dev \
  libev-dev \
  libgl-dev \
  libepoxy-dev \
  libpcre2-dev \
  libpixman-1-dev \
  libx11-xcb-dev \
  libxcb1-dev \
  libxcb-composite0-dev \
  libxcb-damage0-dev \
  libxcb-dpms0-dev \
  libxcb-glx0-dev \
  libxcb-image0-dev \
  libxcb-present-dev \
  libxcb-randr0-dev \
  libxcb-render0-dev \
  libxcb-render-util0-dev \
  libxcb-shape0-dev \
  libxcb-util-dev \
  libxcb-xfixes0-dev \
  libxext-dev \
  meson \
  ninja-build \
  uthash-dev \
  xorg \
  xinit \
  alacritty \
  nautilus \
  feh \
  tar \
  starship \
  imv \
  mpv \
  ffmpeg \
  dbus \
  xinput \
  dbus-x11 \
  pipewire \
  pipewire-pulse \
  wireplumber \
  pipewire-alsa \
  pipewire-audio-client-libraries \
  pavucontrol \
  fonts-recommended \
  fonts-noto-core \
  fonts-noto-extra \
  fonts-noto-ui-core \
  fonts-noto-cjk \
  fonts-noto-color-emoji \
  fonts-noto \
  fonts-lohit-beng-bengali \
  fontconfig \
  flatpak \
  nodejs \
  npm \
  i3 i3lock i3status \
  firefox-esr chromium\
  vim git lazygit btop htop cmatrix feh nautilus \
  brightnessctl tmux grim slurp net-tools\
  nemo ffmpegthumbs ffmpegthumbnailer wireguard android-sdk-platform-tools\
  golang python-is-python3 lua5.4 ripgrep\
  network-manager-applet
  


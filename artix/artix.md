# Arch/Artix Sway Setup — Installed Packages & Added Repositories

 This is a cleaned-up Markdown record based on your shell history. I’ve separated **packages you explicitly installed**, **repositories/package sources you added**, and **configuration/system changes**. Commands with typos or repeated installs are noted rather than counted twice.

 ## Base System & Desktop

 - `sway` — Wayland compositor
- `polkit` — PolicyKit authorization framework
- `xorg-xwayland` — X11 application compatibility under Wayland
- `xdg-desktop-portal-gtk` — Desktop portal backend
- `xdg-desktop-portal-wlr` — wlroots/Sway portal backend
- `waybar` — Status bar
- `wmenu` — Wayland application/menu launcher
- `wmenu-run` — `wmenu` launcher interface
- `rofi` — Application launcher
- `foot` — Wayland terminal
- `kitty` — Terminal emulator
- `alacritty` — Terminal emulator
- `swaybg` — Sway wallpaper utility
- `swayidle` — Idle management daemon
- `swaylock` — Screen locker
- `dunst` — Notification daemon
- `ly` — TUI display/login manager
- `ly-openrc` — OpenRC integration/package for Ly

 ## Desktop Applications

 - `firefox` — Web browser
- `nautilus` — GNOME file manager
- `neovim` — Text editor
- `lazygit` — Terminal UI for Git
- `nvtop` — GPU monitoring
- `btop` — System resource monitor
- `htop` — Process monitor
- `cmatrix` — Matrix-style terminal display

 ## Audio

 - `pipewire` — Modern multimedia/audio framework
- `pipewire-pulse` — PulseAudio compatibility layer for PipeWire
- `wireplumber` — PipeWire session manager
- `pipewire-alsa` — ALSA integration for PipeWire

 ## Hardware & NVIDIA

 - `brightnessctl` — Backlight/brightness control
- `nvidia-drivers` — NVIDIA driver package
- `nvidia-580xx-dkms` — NVIDIA 580-series DKMS driver
- `linux-headers` — Linux kernel headers
- `linux-lts-headers` — LTS kernel headers

 You also configured:

```
export SWAY_UNSUPPORTED_GPU=true
```

 and added it to:

```
/etc/environment
```

 You used:

```
nvidia-smi
nvtop
```

 to verify/monitor the NVIDIA GPU.

 ## Fonts

 - `nerd-fonts` — Nerd Fonts collection
- `ttf-dejavu` — DejaVu font family
- `ttf-liberation` — Liberation fonts
- `noto-fonts` — Noto font family

 These were installed primarily to improve Unicode, terminal, Waybar, icon, and general desktop font coverage.

 ## Utilities

 - `wl-clipboard` — Wayland clipboard utilities
- `cliphist` — Clipboard history manager
- `brightnessctl` — Brightness control
- `cmatrix` — Terminal visual effect

 ## Networking

 You used:

```
nmtui
```

 for NetworkManager configuration.

 You also attempted:

```
sudo rc-service NetworkManager default
```

 which indicates you're using/configuring **OpenRC** rather than systemd.

 ## Login Manager / OpenRC

 You installed:

```
ly
ly-openrc
```

 and enabled Ly with:

```
sudo rc-update add ly
```

 You also removed the second virtual-console `agetty` service:

```
sudo rc-update del agetty.tty2
```

 This is consistent with setting Ly up as the graphical/TUI login manager.

 ## Git / Dotfiles

 You cloned:

```
git clone https://github.com/DebNation/dotfiles
```

 and copied the Sway configuration:

```
cp -r .config/sway ~/.config/
```

 Then reloaded Sway:

```
swaymsg reload
```

 Your Sway configuration is located at:

```
~/.config/sway/
```

 with the main configuration file:

```
~/.config/sway/config
```

 ## Added Repositories / Package Sources

 ### Arch Linux repositories

 You populated the Arch Linux package signing keys with:

```
sudo pacman-key --populate archlinux
```

 This suggests you enabled Arch repositories/package support in your Artix installation.

 You also edited:

```
/etc/pacman.conf
```

 multiple times.

 ### Artix Arch Linux Support

 You installed:

```
sudo pacman -S artix-archlinux-support
```

 This is the package that provides support for using Arch Linux packages/repositories on Artix.

 ### Chaotic-AUR

 You imported the Chaotic-AUR signing key:

```
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
```

 Then locally signed it:

```
sudo pacman-key --lsign-key 3056513887B78AEB
```

 You installed the Chaotic-AUR keyring:

```
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
```

 and mirrorlist:

```
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

 You subsequently edited:

```
/etc/pacman.conf
```

 and ran:

```
sudo pacman -Syu
```

 So your package configuration appears to include **Artix + Arch package support + Chaotic-AUR**.

 ## Configuration Files Modified

 From the history, you directly edited:

```
/etc/pacman.conf
/etc/environment
~/.config/sway/config
```

 You also worked with:

```
~/.config/sway/
```

 and installed/copy-pasted a Sway configuration from your dotfiles repository.

 ## User Groups

 You added your user to:

```
video
audio
storage
power
plugdev
```

 using:

```
sudo usermod -aG video,audio tinkerist
sudo usermod -aG storage,power,plugdev tinkerist
```

 ## Repository / Package Summary

 Your setup can be summarized as:

```
Artix Linux
├── OpenRC
├── Arch Linux package support
├── Chaotic-AUR
│
├── Sway / Wayland
│   ├── sway
│   ├── waybar
│   ├── foot
│   ├── wmenu
│   ├── rofi
│   ├── swaybg
│   ├── swayidle
│   ├── swaylock
│   ├── xorg-xwayland
│   └── xdg-desktop-portal-*
│
├── Login
│   ├── ly
│   └── ly-openrc
│
├── Audio
│   ├── pipewire
│   ├── pipewire-pulse
│   ├── wireplumber
│   └── pipewire-alsa
│
├── NVIDIA
│   ├── nvidia-drivers
│   ├── nvidia-580xx-dkms
│   └── linux-lts-headers
│
├── Applications
│   ├── Firefox
│   ├── Nautilus
│   ├── Neovim
│   └── Lazygit
│
├── Monitoring
│   ├── nvtop
│   ├── btop
│   └── htop
│
├── Fonts
│   ├── Nerd Fonts
│   ├── DejaVu
│   ├── Liberation
│   └── Noto
│
└── Utilities
    ├── brightnessctl
    ├── cliphist
    ├── wl-clipboard
    └── dunst
```

 ### Notes from the history

 A few commands were **typos or failed/redundant attempts**, so I wouldn't treat them as installed packages:

 - `sudo reboto` → typo for `sudo reboot`
- `lks` → likely typo for `ls`
- `uname =r` → incorrect syntax; later corrected to `uname -r`
- `sudo pacman -S nautilius` → typo; later correctly installed `nautilus`
- `sudo pacman -S wmenu-run` → may not be a separate package depending on the repository/package version
- `sudo pacman -S nerd-fonts` was run more than once
- `sudo pacman -Syu` was run repeatedly
- `linux-headers` was installed and subsequently removed, while `linux-lts-headers` was installed afterward.

 **Important:** this is a reconstruction from shell history, not a definitive inventory of what is currently installed. For the exact current package list, `pacman -Q` is authoritative.

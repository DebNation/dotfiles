#### config files that are used to customize/rice linux as per my workflow and liking

##### Windows not showing in GRUB in easy steps.


To find BIOS boot partition:
```
sudo fdisk -l
```

To get UUID of BIOS boot partition:
```
sudo blkid /dev/<efi_partition>
```

Edit GRUB file:
```
sudo nvim /etc/grub.d/40_custom
```

Windows menu entry code:
```
menuentry "Windows" --class windows --class os {
    search --fs-uuid --no-floppy --set=root UUID_Here
  chainloader (${root})/EFI/Microsoft/Boot/bootmgfw.efi
}
```

Update GRUB for Ubuntu/Debian Based Distro :
```
sudo update-grub
```
Update GRUB for Arch:
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
### Install yay(AUR helper)
```
sudo pacman -S git
```
```
git clone https://aur.archlinux.org/yay.git
```
```
cd yay && makepkg -si
```
## Dependencies that I use:

### For Hyprland :
```
adobe-source-code-pro-fonts alacritty android-studio ani-cli base base-devel biome brightnessctl btop
cava-git clipman cmatrix dbus-broker dhcpcd dmidecode docker docker-compose dosfstools
dunst efibootmgr fast feh firefox flatpak gammastep git gnome-keyring gnu-free-fonts gradle grub
gtk3 gvfs-gphoto2 gvfs-mtp htop hyprland-git hyprpaper-git hyprpicker hyprshade hyprshot
kitty lazygit libfido2 linux-firmware linux-lts linux-zen linux-zen-headers lutris man-db
minidlna mirage mtools mtpfs nautilus nemo neofetch neovide neovim net-tools networkmanager
ngrok noto-fonts-emoji ntp os-prober packer pavucontrol pcmanfm-git pipes.sh pipewire-pulse
pokemon-colorscripts-git postgresql postman9-bin python-pywal python-pywalfox python2-bin
qt5-graphicaleffects qt5-quickcontrols2 qt5-svg ranger redis redisinsight reflector ripgrep
rofi rsync rustup sddm sddm-sugar-dark sof-firmware speedtest-cli spotify-adblock-git
swaybg swayidle swaylock swww tldr tmux tokei ttf-adobe-source-code-pro-fonts ttf-arphic-uming
ttf-cascadia-code-nerd ttf-devicons ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols
ttf-symbola uget unzip vi vim vlc waybar webcord-bin wf-recorder wget wireguard-go-git wireguard-tools
wl-clip-persist-git wl-clipboard wlogout xdg-desktop-portal-gtk xdg-desktop-portal-hyprland yarn yay zip
```

## Showcase :
### i3

<p align="center">
  <img src="assets/i3.png"/>
</p>

### Hyprland
<p align="center">
  <img src="assets/hyprland.png"/>
</p>


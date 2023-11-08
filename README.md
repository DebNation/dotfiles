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
* Requires `yay` beforehand.

```
yay -S gtk3 go ani-cli base base-devel brightnessctl btop cava-git cmatrix
dhcpcd dosfstools dunst efibootmgr fast feh firefox flatpak gammastep git gnome-keyring
grub htop hyprland hyprpaper hyprpicker hyprshot kitty linux-zen linux-zen-headers
linux-firmware linux-lts man-db mtools nemo neofetch neovim net-tools networkmanager
nodejs npm os-prober packer pavucontrol pipewire pipewire-pulse ranger ripgrep rofi
rust sddm sddm-sugar-dark sof-firmware speedtest-cli swayidle swaylock swww
tmux tokei ttf-jetbrains-mono ttf-jetbrains-mono-nerd unzip vim waybar wget wireguard-tools
wl-clipboard wlogout xclip xdg-desktop-portal-hyprland xdg-desktop-portal-gtk zip
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


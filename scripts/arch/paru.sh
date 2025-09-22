sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
rustup default stable
makepkg -si
cd ..
rm -rf paru

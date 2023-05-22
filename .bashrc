# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

eval "$(starship init bash)"

export PATH="/home/debxd/.detaspace/bin:$PATH"

alias space="/home/debxd/.detaspace/bin/space"
alias setwifi="./home/debxd/rofi-wifi-menu/rofi-wifi-menu.sh"
alias deno="/home/debxd/.deno/bin/deno"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs:
export EDITOR="lvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH=$PATH:$HOME/.cargo/bin
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export http_proxy=http://192.168.1.14:7890
export https_proxy=http://192.168.1.14:7890

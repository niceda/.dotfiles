# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs:
export EDITOR="lvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export PATH=$PATH:$HOME/.cargo/bin
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export http_proxy=http://192.168.1.8:7890
export https_proxy=http://192.168.1.8:7890

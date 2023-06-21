# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

export EDITOR="lvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history"
# 轻舟
# export http_proxy=http://10.4.1.98:7890
# export https_proxy=http://10.4.1.98:7890
# 家
export http_proxy=http://192.168.1.194:7890
export https_proxy=http://192.168.1.194:7890

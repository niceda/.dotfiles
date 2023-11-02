# export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH=$HOME/.local/bin:$PATH
export EDITOR="lvim"
export XDG_CONFIG_HOME="$HOME/.config"
export LOCALBIN=$XDG_CONFIG_HOME/bin
export PATH=$PATH:$LOCALBIN
export LOCALPROG=$HOME/prog
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=~/.npm-global/bin:$PATH
export ZFM_NO_BINDINGS=1

export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# 轻舟
export http_proxy=http://10.4.1.45:7890
export https_proxy=http://10.4.1.45:7890
# export all_proxy=socks5://10.4.1.45:7890
# 家
# export http_proxy=http://192.168.1.194:7890
# export https_proxy=http://192.168.1.194:7890
# export all_proxy=socks5://192.168.1.194:7890

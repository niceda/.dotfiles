# Disable brew auto update
# export C_INCLUDE_PATH=/usr/local/include
# export CPLUS_INCLUDE_PATH=/usr/local/include

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$HOME/.influxdb/"
export PATH="$PATH:$HOME/.tiup/bin/"
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export LOCALBIN=$XDG_CONFIG_HOME/bin
export PATH=$PATH:$LOCALBIN
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history"
export PATH=~/.npm-global/bin:$PATH
export ZFM_NO_BINDINGS=1

# Go
export GOPATH="$HOME/Library/go"
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CARGO_TARGET_DIR="$HOME/.target"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add this to your shell configuration file (e.g., ~/.bashrc or ~/.zshrc)
refreshenv() {
    source ~/.zshrc  # Replace with the path to your actual shell configuration file
    echo "Running on $(uname)"
    echo "Environment variables refreshed!"
}

noproxy() {
  unset https_proxy
  unset http_proxy
  unset all_proxy
}

# Mac OS X 操作系统
if [[ "$(uname)" == "Darwin" ]]; then
# proxy
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
# python
if [[ -d "$HOME/Library/Python/venv/" ]]; then
  source "$HOME/Library/Python/venv/bin/activate"
fi

# java
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# protobuf
export PATH="/opt/homebrew/opt/protobuf@21/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/protobuf@21/lib"
export CPPFLAGS="-I/opt/homebrew/opt/protobuf@21/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/protobuf@21/lib/pkgconfig"

# GNU/Linux操作系统
elif [[ "$(uname -s | cut -c 1-5)" == "Linux" ]]; then
# FIXME:容器里面的tmux路径不对
export TMUX_PROGRAM=$(which tmux)

# Windows NT操作系统
elif [[ "$(uname -s | cut -c 1-10)" == "MINGW32_NT" ]]; then

fi

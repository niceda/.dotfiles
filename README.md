# My dotfiles

## Prerequisites

- stow
- tmux
- zsh
  - [fzf](https://github.com/junegunn/fzf)
  - [atuin](https://docs.atuin.sh/guide/installation/)
  - [zoxide](https://github.com/ajeetdsouza/zoxide)
  - [starship](https://github.com/starship/starship)
- [ranger](https://github.com/ranger/ranger)
- [lazygit](https://github.com/jesseduffield/lazygit)
- git
- curl
- wget

## Install

### mac

``` bash
brew install stow tmux zsh fzf git ranger curl lazygit wget
chsh -s $(which zsh)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh # atuin
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh # zoxide
curl -sS https://starship.rs/install.sh | sh # starship
```

### arch

```bash
pacman -S stow tmux zsh fzf git ranger curl lazygit wget
chsh -s $(which zsh)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh # atuin
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh # zoxide
curl -sS https://starship.rs/install.sh | sh # starship
```

### debian11

``` bash
apt install stow tmux zsh fzf git ranger curl wget
chsh -s $(which zsh)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh # atuin
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh # zoxide
curl -sS https://starship.rs/install.sh | sh # starship
```

```bash
mkdir -p /tmp/lazygit &&
cd /tmp/lazygit &&
wget https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Linux_x86_64.tar.gz &&
tar -zxvf lazygit_0.43.1_Linux_x86_64.tar.gz &&
cp lazygit /usr/sbin/lazygit
```

## stow everything

```bash
stow zsh # touch ~/.dotfiles/zsh/.config/zsh/.env.zsh
mkdir -p ~/.local/bin/ # Manual creation is required, otherwise stow will link the entire folder.
stow bin
stow tmux
stow git 
stow ranger
stow m2
```

## neovim

- [lazyvim](https://www.lazyvim.org/)

## tmux

- [.tmux](https://github.com/gpakosz/.tmux)

## zsh

- [zimfw](https://zimfw.sh)

## ranger

只是简单配置了一写图标和快捷键

## win

### autohotkey

#### winUtils.ahk: 一些常用的快捷键

- win + q: 关闭当前窗口
- win + Enter: 打开终端

### windows Terminal

## ideavimrc

## surfing

- [QuantumultX](https://apps.apple.com/us/app/quantumult-x/id1443988620)

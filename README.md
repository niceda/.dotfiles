# 搭建属于你自己的终端环境

## Prerequisites

确保你的系统中已经安装了以下软件，不然使用体验可能会受到影响

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
- ccat (optional)

## Install

### mac

``` bash
brew install stow tmux zsh fzf git ranger curl lazygit wget ccat
chsh -s $(which zsh)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh # atuin
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh # zoxide
curl -sS https://starship.rs/install.sh | sh # starship
```

### arch

```bash
pacman -S stow tmux zsh fzf git ranger curl lazygit wget
yay -S ccat
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

## zsh

- [zimfw](https://zimfw.sh)
- [fzf](https://github.com/junegunn/fzf)
- [atuin](https://docs.atuin.sh/guide/installation/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [starship](https://github.com/starship/starship)

| file | description |
| --- | --- |
| `aliases.zsh` | alias config |
| `env.zsh` | env config |
| `.env.zsh` | private env config |

| Shortcut/Aliases | Action |
| --- | --- |
| `ra` | ranger |
| `ctrl + g` | open lazygit |
| `ctrl + r` | search history |
| `ctrl + t` | fzf tab completion |
| `ctrl + p` | fzf file completion |
| `ctrl + v` | edit command line |
| `bip` | brew:install |
| `bup` | brew:update |
| `bcp` | brew:uninstall |

### zoxide

```bash
z foo              # cd into highest ranked directory matching foo
z foo bar          # cd into highest ranked directory matching foo and bar
z foo /            # cd into a subdirectory starting with foo

z ~/foo            # z also works like a regular cd command
z foo/             # cd into relative path
z ..               # cd one level up
z -                # cd into previous directory

zi foo             # cd with interactive selection (using fzf)

z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
```

## tmux

- [.tmux](https://github.com/gpakosz/.tmux)

### main keymap

`prefix` = `ctrl + s`

| Shortcut | Action |
| --- | --- |
| `alt + o` | open new window |
| `alt + q` | kill pane |
| `prefix + Tab` | last window |
| `prefix + shift + Tab` | last session |
| `prefix + e` | edit tmux.conf |
| `prefix + r` | reload configuration |
| `prefix + T` | toggle status bar |
| `prefix + C-c` | create new session |
| `prefix + C-f` | find session |
| `prefix + f` | find window |
| `prefix + k` | split window horizontal (top) |
| `prefix + j` | split window horizontal (bottom) |
| `prefix + h` | split window vertical (left) |
| `prefix + l` | split window vertical (right) |
| `alt + k` | select pane (top) |
| `alt + j` | select pane (bottom) |
| `alt + h` | select pane (left) |
| `alt + l` | select pane (right) |
| `prefix + S` | choose session |
| `prefix + +` | maximize current pane |
| `alt + 1~9` | select window 1~9 |
| `alt + !~(` | move pane to window 1~9 |
| `prefix + m` | toggle mouse |
| `prefix + Enter` | enter copy mode |
| `prefix + p` | paste buffer |
| `prefix + P` | choose buffer to paste |
| `prefix + r` | reload tmux config |
| `prefix + y` | save current layout |
| `prefix + R` | restore layout |
| `prefix + ?` | list shortcuts |

## ranger

| Shortcut | Action |
| --- | --- |
| `q` | quit |
| `ctrl + n` |  create new tab |
| `Tab` | switch to next tab |
| `M` | mkdir then cd |
| `T` | touch file |
| `<space><space>` | select dir |
| `ec` | compress file |
| `ex` | extract file |

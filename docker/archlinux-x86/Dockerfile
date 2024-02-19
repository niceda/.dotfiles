FROM archlinux/archlinux:base-devel

COPY pacman.conf /etc/pacman.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman-key --init &&\
    pacman-key --populate archlinux &&\
    pacman -Syu --noconfirm git openssh &&\
    : "Clear cache" &&\
    pacman -Qtdq | xargs -r pacman --noconfirm -Rcns

ARG USERNAME=fida
ARG UID=1000
ARG GID=1000
RUN echo "Build start with USERNAME: $USERNAME UID: $UID GID: $GID" &&\
    pacman -Sy &&\
    : "Add user ${USERNAME} for yay install" &&\
    groupadd -g ${GID} ${USERNAME} &&\
    useradd -u ${UID} -g ${GID} -m -s /bin/zsh ${USERNAME} &&\
    passwd -d ${USERNAME} &&\
    mkdir -p /etc/sudoers.d &&\
    touch /etc/sudoers.d/${USERNAME} &&\
    echo "${USERNAME} ALL=(ALL) ALL" > /etc/sudoers.d/${USERNAME} &&\
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

Run pacman -S --noconfirm gcc
Run pacman -S --noconfirm cmake
Run pacman -S --noconfirm openjdk17-src
Run pacman -S --noconfirm neovim
Run pacman -S --noconfirm curl
Run pacman -S --noconfirm wget
Run pacman -S --noconfirm lazygit
Run pacman -S --noconfirm zsh
Run pacman -S --noconfirm tmux
Run pacman -S --noconfirm starship
Run pacman -S --noconfirm ranger
Run pacman -S --noconfirm npm
Run pacman -S --noconfirm go
Run pacman -S --noconfirm reflector
Run pacman -S --noconfirm stow
Run pacman -S --noconfirm fd
Run pacman -S --noconfirm fzf
Run pacman -S --noconfirm ripgrep
Run pacman -S --noconfirm bat
Run pacman -S --noconfirm stylua
Run pacman -S --noconfirm python3
Run pacman -S --noconfirm jq
Run pacman -S --noconfirm clang
# Run pacman -S --noconfirm yay

WORKDIR /home/${USERNAME}
USER ${USERNAME}

RUN git clone https://github.com/niceda/.dotfiles.git /home/${USERNAME}/.dotfiles \
    && cd /home/${USERNAME}/.dotfiles \
    && stow zsh \
    && stow tmux \
    && stow nvim \
    && stow git \
    && stow ranger

# RUN git clone https://aur.archlinux.org/yay.git \
#     && cd yay \
#     && makepkg -si --noprogressbar --noconfirm \
#     && cd .. \
#     && rm -Rf yay

# # Base pacakages for neovim and terminal
# RUN yay -Syu --noprogressbar --noconfirm --needed \
#         python3 python-pip nodejs-lts-gallium npm clang \
#         eslint_d prettier stylua git-delta github-cli \
#         tmux bat fzf fd ripgrep kitty-terminfo \
#         neovim neovim-remote nvim-packer-git \
#         oh-my-zsh-git spaceship-prompt zsh-autosuggestions \
#         aws-cli-v2 aws-session-manager-plugin aws-vault pass \
#         docker docker-compose lazydocker \
#         ncdu glances nnn-nerd jq zoxide-gi
#         # ncdu glances nnn-nerd jq zoxide-gi \
#     # && sudo pip --disable-pip-version-check install pynvim \
#     # && sudo npm install -g neovim wip \
#     # && yay -Scc --noprogressbar --noconfirm

# CMD 

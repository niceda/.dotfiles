# TODO: change shell to zsh
FROM --platform=linux/amd64 debian:latest

ARG user=fida
ARG password=603551

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list.d/debian.sources && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

RUN apt update

RUN apt -y --no-install-recommends install gcc
RUN apt -y --no-install-recommends install g++
RUN apt -y --no-install-recommends install cmake
RUN apt -y --no-install-recommends install git
RUN apt -y --no-install-recommends install curl
RUN apt -y --no-install-recommends install openjdk-17-jdk
RUN apt -y --no-install-recommends install default-jdk
RUN apt -y --no-install-recommends install ssh
RUN apt -y --no-install-recommends install vim
RUN apt -y --no-install-recommends install build-essential
RUN apt -y --no-install-recommends install gosu
RUN apt -y --no-install-recommends install sudo
RUN apt -y --no-install-recommends install gdb
RUN apt -y --no-install-recommends install gdbserver
RUN apt -y --no-install-recommends install locales
RUN apt -y --no-install-recommends install clang-format
RUN apt -y --no-install-recommends install clangd
RUN apt -y --no-install-recommends install man
RUN apt -y --no-install-recommends install net-tools
RUN apt -y --no-install-recommends install iproute2
RUN apt -y --no-install-recommends install wget
RUN apt -y --no-install-recommends install locate
RUN apt -y --no-install-recommends install libssl-dev
RUN apt -y --no-install-recommends install clang
RUN apt -y --no-install-recommends install inetutils-ping
RUN apt -y --no-install-recommends install zsh
RUN apt -y --no-install-recommends install stow

# RUN rm -rf /var/lib/apt/lists/*

# linux
RUN useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo "root:${password}" | chpasswd \
    && echo "${user}:${password}" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config 

# TODO: fida --> ${user}
WORKDIR /Users/fida

RUN ssh-keygen -A
RUN /etc/init.d/ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

FROM --platform=linux/amd64 debian:11.7

ARG user=fida
ARG password=603551

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

RUN apt update \
    && apt -y --no-install-recommends install gcc g++ cmake git curl openjdk-11-jdk ssh vim build-essential gosu sudo gdb gdbserver locales clang-format clangd man net-tools iproute2 wget locate libssl-dev inetutils-ping
    # && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo "root:603551" | chpasswd \
    && echo "${user}:603551" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config 

WORKDIR /home/${user}

RUN ssh-keygen -A
RUN /etc/init.d/ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

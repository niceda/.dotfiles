FROM debian:11.7

ARG user=fida

RUN apt update && apt -y --no-install-recommends install gcc g++ cmake git curl openjdk-11-jdk ssh vim build-essential gosu sudo

RUN useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo "${user}:603551" | chpasswd

# 改变用户的UID和GID
# RUN usermod -u 1000 ${user} && usermod -G 1000 ${user}

# 指定容器起来的工作目录
WORKDIR /home/${user}

# 指定容器起来的登录用户
USER ${user}

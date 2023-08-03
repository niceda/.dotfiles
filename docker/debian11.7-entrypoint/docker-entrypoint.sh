#!/bin/bash

# 获取主机用户id
USER_ID=${LOCAL_USER_ID:-9001}
# 给主机用户授权制定的非绑定挂载目录
chown -R $USER_ID /QZ

# 创建和主机用户相同uid的用户，名为user
useradd --shell /bin/bash -u $USER_ID -o -c "" -m fida
usermod -a -G root fida
export HOME=/home/fida

exec /usr/local/bin/gosu fida "$@"

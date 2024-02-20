#/bin/bash

# TODAY=$(date +"%Y-%m-%d")
# # docker build . --no-cache -t cseickel/arch-linux && \
# docker build . -t niceda/archlinux-x86 && \
# docker tag niceda/arch-linux-x86 "niceda/arch-linux:$TODAY" && \
# docker push cseickel/arch-linux -a

docker build . -t niceda/archlinux-x86


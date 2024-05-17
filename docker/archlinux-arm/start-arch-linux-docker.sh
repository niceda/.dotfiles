#/bin/bash
EXISTING=$(docker container ls -a | grep archlinux-x86-tmux | awk '{ print $1}')
RUNNING=$(docker container ls | grep archlinux-x86-tmux | awk '{ print $1}')
if [[ $EXISTING && $RUNNING ]]; then
	docker attach $EXISTING
elif [[ $EXISTING && !$RUNNING ]]; then
    docker start $EXISTING
    docker attach $EXISTING
else
	# EXISTING=$(docker run -d -it --platform linux/amd64 \
	# 	-v /var/run/docker.sock:/var/run/docker.sock \
	# 	-h $HOSTNAME \
	# 	-e DISPLAY=$DISPLAY \
	# 	-h $HOSTNAME \
	# 	--network host \
	# 	--name archlinux-x86-tmux \
	# 	niceda/archlinux-x86 \
	# 	tmux)
    
	EXISTING=$(docker run -d -it --platform linux/amd64 \
		-v /var/run/docker.sock:/var/run/docker.sock \
        -v $HOME/Documents/Code:/Users/fida/Documents/Code \
		-h $HOSTNAME \
		-e DISPLAY=$DISPLAY \
		-e https_proxy=http://127.0.0.1:7890 \
		-e http_proxy=http://127.0.0.1:7890 \
        -e all_proxy=socks5://127.0.0.1:7890 \
		-h $HOSTNAME \
		--network host \
		--name archlinux-x86-tmux \
		niceda/archlinux-x86 \
		tmux)
	docker attach $EXISTING
fi

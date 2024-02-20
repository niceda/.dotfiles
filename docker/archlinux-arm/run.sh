#/bin/bash
# if [ ! "$TMUX" ]; then
	EXISTING=$(docker container ls | grep arch-linux-tmux | awk '{ print $1}')
	if [[ $EXISTING ]]; then
		docker attach $EXISTING
	else
		EXISTING=$(docker run --rm -d -it \
			-h $HOSTNAME \
			-e DISPLAY=$DISPLAY \
			-h $HOSTNAME \
			--network host \
			--name arch-linux \
			niceda/arch-linux \
			)
		docker attach $EXISTING
	fi
# fi

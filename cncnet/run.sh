#!/bin/bash
IMAGE=cncnet
docker build -t $IMAGE .

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
	--device=/dev/snd:/dev/snd \
	--device=/dev/dri/card0:/dev/dri/card0 \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$XAUTH \
	-ti \
	$IMAGE

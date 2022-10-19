#!/bin/bash

SCONE_IMG_NAME=scone-debug/iexec-sconify-image-unlocked
SCONE_IMG_VERSION=5.7.1
SCONE_IMG=registry.scontain.com:5050/$SCONE_IMG_NAME:$SCONE_IMG_VERSION

IMG_FROM=go-hello-world
IMG_TO=tee-go-hello-world

OPT=$(cat scone/sconify.args | IMG_FROM=$IMG_FROM IMG_TO=$IMG_TO envsubst | tr '\n' ' ')
echo "OPT: $OPT"

docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $SCONE_IMG \
        sconify_iexec \
            --cli=$SCONE_IMG \
            --crosscompiler=$SCONE_IMG \
            $OPT

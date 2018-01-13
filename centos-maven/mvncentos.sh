#!/usr/bin/env bash
docker run -it \
        --rm  \
        -v $(pwd):/project \
        -v $(echo "$HOME/.m2/repository"):/repository \
        --entrypoint /entrypoint.sh \
        ivonet/centos-maven:7-3.0.5 mvn "$@"
#!/usr/bin/env bash
docker rmi vodsquad/activemq
docker build -t vodsquad/activemq .
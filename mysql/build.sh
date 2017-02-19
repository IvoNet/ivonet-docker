#!/usr/bin/env bash
docker rmi ivonet/mysql
docker build -t ivonet/mysql .
docker push ivonet/mysql
#!/usr/bin/env bash

ids=($(docker images | grep '^<none>' | awk '{ print $3 }'))
ids+=($(docker images | awk '$2=="<none>"' | awk '{ print $3 }'))

for i in "${ids[@]}"; do
  docker rmi -f $i
done

ids=($(docker ps -a | grep 'Exited (' | awk '{ print $1 }'))

for i in "${ids[@]}"; do
  docker rm -f $i
done

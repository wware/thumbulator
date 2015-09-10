#!/bin/bash

for x in $(sudo docker ps -a | tail -n +2 | cut -c -12)
do
    sudo docker stop $x
    sudo docker rm -f $x
done

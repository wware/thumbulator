#!/bin/bash

if (( $# < 1 ))
then
	echo Usage: $0 SERVERIMAGE
	exit 1
fi

 docker run -i -t $1 /bin/bash

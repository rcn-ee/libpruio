#!/bin/bash

ARCH=$(uname -m)

if [ -f .builddir ] ; then

	if [ "x${ARCH}" = "xx86_64" ] ; then
		x86_dir="`pwd`/../../normal"
		if [ -f `pwd`/../../normal/.CC ] ; then
			. `pwd`/../../normal/.CC
			make_options="CROSS_COMPILE=${CC} KDIR=${x86_dir}/KERNEL"
		fi
	else
		make_options="CROSS_COMPILE= KDIR=/build/buildd/linux-src"
	fi

	echo "make ARCH=arm ${make_options} all"
	make ARCH=arm ${make_options} all
fi
#

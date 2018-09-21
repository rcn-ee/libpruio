#!/bin/bash

ARCH=$(uname -m)

if [ -f .builddir ] ; then

	if [ "x${ARCH}" = "xarmv7l" ] ; then
		make_options="CROSS_COMPILE= KDIR=/build/buildd/linux-src"
	else
		x86_dir="`pwd`/../../normal"
		if [ -f `pwd`/../../normal/.CC ] ; then
			. `pwd`/../../normal/.CC
			make_options="CROSS_COMPILE=${CC} KDIR=${x86_dir}/KERNEL"
		fi
	fi

	echo "make ARCH=arm ${make_options} all"
	make ARCH=arm ${make_options} all
fi
#

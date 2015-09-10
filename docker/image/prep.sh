#!/bin/sh

PREFIX=/opt/gnu-arm

export PATH=$PREFIX/bin:$PATH

mkdir -p /opt /root $PREFIX
chmod -R 777 /opt

BINUTILS=binutils-2.25
GCC=gcc-4.8.5

cd /root

wget http://ftp.gnu.org/gnu/binutils/$BINUTILS.tar.gz || exit 1
wget http://ftp.gnu.org/gnu/gcc/$GCC/$GCC.tar.gz || exit 1
wget http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.2.tar.xz || exit 1
wget http://ftp.gnu.org/gnu/gmp/gmp-6.0.0a.tar.xz || exit 1
wget http://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz || exit 1

for f in *.tar*; do tar xf $f; done

(cd $GCC
ln -s ../mpfr-3.1.2 mpfr
ln -s ../gmp-6.0.0 gmp
ln -s ../mpc-1.0.2 mpc)

mkdir build-binutils
(cd build-binutils
CC=$GCC CFLAGS=-Wno-error=deprecated-declarations ../$BINUTILS/configure \
    --target=arm-none-eabi --enable-interwork --disable-multilib
make -j4
make install)

mkdir -p build-gcc
(cd build-gcc
../$GCC/configure --prefix=$PREFIX --target=arm-none-eabi --enable-languages=all --disable-multilib
make -j4 all-gcc
make install-gcc)

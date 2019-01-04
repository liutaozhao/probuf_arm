#!/bin/sh
# build the CDVS Test Model
# with full optimizations and multithreading:
CFLAGS="-march=armv7-a -O2 -DNDEBUG -fopenmp -pipe"
export PATH=$PATH:/home/liutao/ndk_toolchain/arm-linux-androideabi/bin
# run configure with optimization flags and prepending "tm-" to all binaries (e.g. tm-extract, tm-match, etc.)
mkdir -p build
cd build
LIBS=-llog CC=arm-linux-androideabi-gcc CXX=arm-linux-androideabi-g++ LD=arm-linux-androideabi-ld AR=arm-linux-androideabi-ar AS=arm-linux-androideabi-as NM=arm-linux-androideabi-nm STRIP= RANLIB=arm-linux-androideabi-strip  OBJDUMP=arm-linux-androideabi-objdump ../configure --build=i386-pc-linux-gnu --host=arm-linux-androideabi --target=arm-linux-androideabi --cache-file=arm-linux-androideabi.cache --prefix=/home/liutao/install/protobuf-for-arm --with-sysroot=/home/liutao/ndk_toolchain/arm-linux-androideabi/sysroot --with-protoc=/home/liutao/test/protobuf-3.6.1/protoc  CFLAGS="${CFLAGS}" CXXFLAGS="${CFLAGS}"
# build all binaries
make
# install all binaries in $HOME/bin (no need of admin priviledges)
make install

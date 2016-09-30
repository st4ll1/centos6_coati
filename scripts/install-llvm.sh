#!/bin/sh

LLVM_VERSION=3.8.0

mkdir -p /llvm
cd /llvm
wget http://llvm.org/releases/${LLVM_VERSION}/llvm-${LLVM_VERSION}.src.tar.xz
tar xvf llvm-${LLVM_VERSION}.src.tar.xz
cd llvm-${LLVM_VERSION}.src
cd tools
wget http://llvm.org/releases/${LLVM_VERSION}/cfe-${LLVM_VERSION}.src.tar.xz
tar xvf cfe-${LLVM_VERSION}.src.tar.xz
. /opt/rh/python27/enable
. /opt/rh/devtoolset-4/enable
python --version
cd /llvm/llvm-${LLVM_VERSION}.src && mkdir -p build && cd build
make .. -DCMAKE_INSTALL_PREFIX=/opt/llvm/ -DCMAKE_BUILD_TYPE=Release && make -j8 install && rm -Rf /llvm

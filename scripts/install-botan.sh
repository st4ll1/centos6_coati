#!/bin/sh
git clone https://github.com/randombit/botan.git && \
cd botan && \
git checkout 1.11.31 && \
./configure.py --disable-shared --prefix=/usr && \
make -j8 && make install && \
rm -rf /botan

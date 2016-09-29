#!/bin/sh
wget http://upx.sourceforge.net/download/upx-3.91-amd64_linux.tar.bz2 -O upx.tar.bz2 && \
mkdir upx && \
tar xjf upx.tar.bz2 -C upx --strip-components=1 && \
cp upx/upx /usr/local/bin && \
rm -r upx

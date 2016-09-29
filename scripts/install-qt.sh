#!/bin/sh
QVERSION_SHORT=5.7
QTVERSION=5.7.0

mkdir -p /qt
cd /qt
wget http://download.qt.io/archive/qt/${QVERSION_SHORT}/${QTVERSION}/single/qt-everywhere-opensource-src-${QTVERSION}.tar.xz
tar xvf qt-everywhere-opensource-src-${QTVERSION}.tar.xz
ln -sf /opt/rh/devtoolset-4/root/usr/bin/g++ /usr/bin/g++
ln -sf /opt/rh/devtoolset-4/root/usr/bin/c++ /usr/bin/c++
cd /qt/qt-everywhere-opensource-src-$QTVERSION
./configure -v -skip qtgamepad -platform linux-g++ -qt-pcre -qt-xcb -qt-xkbcommon -xkb-config-root /usr/share/X11/xkb -no-pch -confirm-license -opensource
make -j 8 || make -j 1 install; make -j8 install && rm -Rf /qt

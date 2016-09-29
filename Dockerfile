FROM centos:6

MAINTAINER "Andreas Stallinger" <astallinger@coati.io>

#COPY scriptsfolder into opt
COPY scripts/* /opt/
WORKDIR /opt

RUN ./install-deps.sh

# Install Qt
RUN ./install-qt.sh

# Install llvm
RUN ./install-llvm.sh

# Install botan
RUN ./install-botan.sh

# Boost
RUN ./install-boost.sh

# git & gcc
RUN scl enable git19 true && scl enable devtoolset-4 true

# Ninja
RUN ./install-ninja.sh

# CxxTest
RUN ./install-cxxtest.sh

# Upx
RUN ./install-upx.sh

# set env
ENV CXX=/opt/llvm/bin/clang++ \ 
CC=/opt/llvm/bin/clang \ 
QT_DIR=/usr/local/Qt-5.7.0 \ 
CXX_TEST_DIR=/opt/cxxtestlib \
JAVA_HOME=/usr/lib/jvm/java-openjdk

#add user
RUN useradd builder

# Make sure the above SCLs are already enabled
ENTRYPOINT ["/usr/bin/scl", "enable", "python27", "devtoolset-4", "git19", "--"]
CMD ["/usr/bin/scl", "enable", "python27", "devtoolset-4", "git19", "--", "/bin/bash"]

RUN GCC_VERSION=$(g++ -dumpversion) && \
ln -s /opt/rh/devtoolset-4/root/usr/include/c++/${GCC_VERSION} /usr/include/c++/${GCC_VERSION} && \
ln -s /opt/rh/devtoolset-4/root/usr/lib/gcc/x86_64-redhat-linux/${GCC_VERSION} \
/usr/lib/gcc/x86_64-redhat-linux/${GCC_VERSION} && \
ln -s /usr/bin/cmake3 /usr/local/bin/cmake

WORKDIR /home/builder
USER builder


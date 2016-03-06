FROM ubuntu:14.04
MAINTAINER osawagiboy@gmail.com

RUN apt-get update && apt-get install -y build-essential libtool libssl-dev automake clang-3.6 libedit-dev python2.7 python2.7-dev libicu52  libxml2 git wget && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100

RUN git clone https://github.com/libuv/libuv.git /usr/src/libuv \
    && cd /usr/src/libuv \
    && sh autogen.sh \
    && ./configure \
    && make \
    && make install

RUN git clone https://github.com/Zewo/uri_parser.git /usr/src/uri_parser \
    && cd /usr/src/uri_parser \
    && make \
    && make install

RUN git clone https://github.com/Zewo/http_parser.git /usr/src/http_parser \
    && cd /usr/src/http_parser \
    && make \
    && make install

RUN wget https://swift.org/builds/development/ubuntu1404/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-ubuntu14.04.tar.gz && \
    tar -xvzf swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-ubuntu14.04.tar.gz --directory / --strip-components=1 && \
    rm -rf swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-ubuntu14.04/* /tmp/* /var/tmp/*

ENV PATH /usr/bin:$PATH

RUN ldconfig -v
RUN swift --version

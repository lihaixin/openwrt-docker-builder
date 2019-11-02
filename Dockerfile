FROM ubuntu:14.04
MAINTAINER sanjin <sanjin@gmail.com>
ENV TZ=Asia/Shanghai
ENV LANG en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt-get update  \
    && apt-get upgrade \
    && apt-get install -y locales curl wget tzdata\
    && apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && git clone https://github.com/coolsnowwolf/lede.git \
    && cd lede \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a 

WORKDIR /lede
CMD ["/bin/bash"]

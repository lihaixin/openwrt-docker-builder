FROM ubuntu:14.04
MAINTAINER sanjin <sanjin@gmail.com>
ENV TZ=Asia/Shanghai
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt-get -y update  \
    && apt-get -y upgrade \
    && apt-get install -y locales curl wget tzdata \
    && apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
#    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && useradd -m sanjin \
    && usermod -s /bin/bash sanjin \
    && echo -e "password\npassword" | (passwd lede) \
    && chmod u+w /etc/sudoers \
    && echo "lede ALL=(ALL:ALL) ALL" >>/etc/sudoers \
    && chmod u-w /etc/sudoers
   
user sanjin
WORKDIR /home/sanjin

CMD ["/bin/bash"]

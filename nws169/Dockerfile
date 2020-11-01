FROM i386/ubuntu:bionic

RUN mkdir /nws
WORKDIR /nws

# installation tools
RUN apt-get update \
    && apt-get install -y wget unzip

# unpacking instalation package
RUN wget https://neverwintervault.org/sites/all/modules/pubdlcnt/pubdlcnt.php?fid=2674 -O nwndedicatedserver1.69.zip \
    && unzip nwndedicatedserver1.69.zip \
    && tar xzf linuxdedserver169.tar.gz \
    && bash fixinstall

# remove unnecessary files
RUN rm -rf \
    *.zip \
    *.tar.gz \
    fixinstall \
    *.exe \
    *.dll \
    *.txt \
    *.ini \
    database \
    dmvault \
    docs \
    erf \
    hak \
    localvault \
    logs \
    modules \
    nwm \
    portraits \
    servervault \
    utils

# dockerize installation
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# cleanup unnecessary tools
RUN apt-get purge -y wget unzip \
    && apt-get autoclean -y

COPY nwnplayer.ini.tmpl .

# module name is not available in nwnplayer.ini, should be configured separately
ENV NWS_MODULE module

ENTRYPOINT dockerize \
    -template ./nwnplayer.ini.tmpl:./nwnplayer.ini \
    ./nwserver -module $NWS_MODULE

FROM i386/ubuntu:bionic

RUN mkdir /nws \
    && chmod 0777 /nws
WORKDIR /nws

# installation tools
RUN apt-get -qq update \
    && apt-get -qq install wget unzip p7zip

# unpacking instalation package
RUN wget --quiet https://neverwintervault.org/sites/all/modules/pubdlcnt/pubdlcnt.php?fid=2674 -O nwndedicatedserver1.69.zip \
    && unzip -q nwndedicatedserver1.69.zip \
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
    database/* \
    dmvault \
    docs \
    erf \
    localvault \
    logs \
    modules/* \
    nwm \
    portraits \
    utils

# dockerize installation
ENV DOCKERIZE_VERSION v0.6.1
RUN wget --quiet https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-386-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzf dockerize-linux-386-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-386-$DOCKERIZE_VERSION.tar.gz

# create missing directory
RUN mkdir tlk

# configuration template
COPY nwnplayer.ini.tmpl .
COPY entrypoint.sh .
COPY DockerDemo.zip .

# demo module for quick testing purposes
RUN unzip -q -d modules/ DockerDemo.zip \
    && rm -f DockerDemo.zip

# module name is not available in nwnplayer.ini, should be configured separately
ENV NWS_MODULE DockerDemo

ENTRYPOINT [ "./entrypoint.sh" ]

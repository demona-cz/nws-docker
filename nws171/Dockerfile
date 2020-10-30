FROM tlii/nwserver169:latest

# installation tools
RUN apt-get update \
    && apt-get -y install wget p7zip

# unpacking 1.71 instalation package
RUN mkdir p171 \
    && wget https://neverwintervault.org/sites/all/modules/pubdlcnt/pubdlcnt.php\?fid\=1982 -O p171/nwnpatch171.exe \
    && 7zr e -op171 p171/nwnpatch171.exe \
    && mv p171/patch171.bif data \
    && mv p171/xp2patch.key xp \
    && rm -rf p171/

# cleanup unnecessary tools
RUN apt-get purge -y wget p7zip \
    && apt-get autoclean -y

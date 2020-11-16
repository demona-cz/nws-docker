FROM demonacz/nws169:latest

# unpacking 1.71 instalation package
RUN mkdir p171 \
    && wget --quiet https://neverwintervault.org/sites/all/modules/pubdlcnt/pubdlcnt.php\?fid\=1982 -O p171/nwnpatch171.exe \
    && 7zr e -bsp0 -bso0 -op171 p171/nwnpatch171.exe \
    && mv p171/patch171.bif data \
    && mv p171/xp2patch.key . \
    && rm -rf p171/

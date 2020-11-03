#!/bin/bash
exec /usr/local/bin/dockerize -template ./nwnplayer.ini.tmpl:./nwnplayer.ini ./nwserver -module ${NWS_MODULE}

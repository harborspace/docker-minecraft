#!/bin/bash
# -----------------------------------------------------------------------------
# docker-minecraft /start script
#
# Authors: Isaac Bythewood
# Updated: Dec 14th, 2014
# -----------------------------------------------------------------------------



    curl "https://s3.amazonaws.com/Minecraft.Download/versions/1.8.7/minecraft_server.1.8.7.jar" -o /data/minecraft_server.jar
    echo "eula=true" > /data/eula.txt
	cd /data/; java -Xmx2G -jar minecraft_server.jar nogui
	


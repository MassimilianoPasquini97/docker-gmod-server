# GMOD Server
![!GMOD Logo!](https://upload.wikimedia.org/wikipedia/commons/a/a0/GMod-logo.png)

# Description
This docker image provides a GMOD (Garry's Mod) Server. It automatically download the latest version at startup. To update the server just restart the container. To start the server with the default settings run

```bash
docker run -d -p 27015:27015/udp -p 27005:27005/udp --name server-gmod-prophunt massimilianopasquini/gmod-server
```

It may take several minutes for the server to start, it depends on the speed of your ISP. Once the container starts, it will download the GMOD server and the related mods.

# Enviromment variable
With the variables you can change some settings of the GMOD server, below the variable table with their description and default value.

| Variable                   | Default value | Description                                             |
|----------------------------|---------------|---------------------------------------------------------|
| Server_Name                | DockerTEST    | Name of your server visible in the list of GMOD servers |
| Server_Max_Player          | 20            | Maximum number of players on the server                 |
| Server_Gmod_Mod            | prop_hunt     | Game mode                                               |
| Server_workshop_collection | 1648902801    | Workshop mod collection with which to start the server  |
| Server_Map                 | ph_infernaria | map with which to start the server                      |


below is a list of known mods with which to start the server

| Server_Gmod_Mod | Server_workshop_collection | Server_Map      |
|-----------------|----------------------------|-----------------|
| prop_hunt       | 1648902801                 | ph_infernaria   |
| psw2            | 648145510                  | pw_ocean_day    |
| sledbuild       | 322430043                  | slb_snowsled_v3 |
| terrortown      | 1649752447                 | ttt_island_2013 |

below is an example on how to start a gmod server with the terrortown mod

```bash 
docker run -d -p 27015:27015/udp -p 27005:27005/udp -e Server_Name="Terrortown Server" -e Server_Max_Player="40" -e Server_Gmod_Mod="terrortown" -e Server_workshop_collection="1649752447" -e Server_Map="ttt_island_2013" --name server-gmod-terrortown massimilianopasquini/gmod-server
``` 

# Attaching game data directory to the host
If you need to access the gmod server folder you can mount it as a volume, here are the directories you can mount

| Directory              |
|------------------------|
| /home/gmod/gmod-server |

Example below

```bash
docker run -d -p 27015:27015/udp -p 27005:27005/udp --name server-gmod-prophunt -v gmod_server:/home/gmod/gmod-server massimilianopasquini/gmod-server
```

# Docker Compose
To facilitate the start of the containers it is possible to use the docker compose files present in the Example/docker-compose directory. Choose the docker-compose.yml based on the mod you want to use and run

```bash
sudo docker-compose up -d gmod-server
```
FROM steamcmd/steamcmd:latest

LABEL maintainer "massimilianopasquini"

ENV Server_Name="DockerTEST" \
    Server_Max_Player="20" \
    Server_Gmod_Mod="prop_hunt" \
    Server_workshop_collection="1648902801" \
    Server_Map="ph_infernaria"

RUN addgroup --gid 1000 gmod \
    && adduser --system --shell /bin/bash --uid 1000 --ingroup gmod --home /home/gmod gmod 

COPY --chown=gmod:gmod File/ /home/gmod/
RUN chmod +x /home/gmod/gmod-server/Start

EXPOSE 27015/udp 27005/udp

ENTRYPOINT ["/home/gmod/gmod-server/Start"]
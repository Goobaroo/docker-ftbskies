# syntax=docker/dockerfile:1

FROM openjdk:17-jdk-buster

LABEL version="1.8.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Skies"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/82/82f09c704f3625f3726bc34e2b9533b4d7d8b874d2651f6c2fe1ab9806c04c77.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBSkies:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Skies v1.8.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]
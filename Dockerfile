FROM debian:bullseye

RUN apt update && \
    apt install -y icecast2 liquidsoap ffmpeg && \
    apt clean

COPY icecast.xml /etc/icecast2/icecast.xml
COPY radio.liq /root/radio.liq
COPY music/ /root/music/

EXPOSE 8000

CMD service icecast2 start && liquidsoap /root/radio.liq

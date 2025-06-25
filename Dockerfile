FROM debian:bookworm-slim

# Installer icecast2 et liquidsoap
RUN apt-get update && apt-get install -y icecast2 liquidsoap && apt-get clean

# Copier la config Icecast et script Liquidsoap dans le container
COPY icecast.xml /etc/icecast2/icecast.xml
COPY radio.liq /radio.liq

# Exposer le port Icecast
EXPOSE 8000

# Commande pour lancer Icecast et Liquidsoap
CMD icecast2 -c /etc/icecast2/icecast.xml & liquidsoap /radio.liq

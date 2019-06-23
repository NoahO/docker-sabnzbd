FROM linuxserver/sabnzbd

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update ; apt-get install -y php-cli ffmpeg git && apt-get clean && rm -rf /var/lib/apt/lists/*

#COPY defaultsabnzbd.ini /
COPY phpsed.php /
COPY 40-sabconfig /etc/cont-init.d

VOLUME /nzbtomedia
VOLUME /config/nzbtomedia/admin/future

HEALTHCHECK --start-period=600s CMD  curl -f http://localhost:8080 || exit 1
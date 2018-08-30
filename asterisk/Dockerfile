FROM debian:9

# Installing dependencies
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    build-essential \
    openssl \
    libxml2-dev \
    libncurses5-dev \
    uuid-dev \
    sqlite3 \
    libsqlite3-dev \
    pkg-config \
    libjansson-dev \
    wget

WORKDIR /usr/src/asterisk/

ARG ASTERISK_SRC_VERSION=14.7.7

RUN wget --quiet http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_SRC_VERSION}.tar.gz && tar xf asterisk-${ASTERISK_SRC_VERSION}.tar.gz && rm asterisk-${ASTERISK_SRC_VERSION}.tar.gz

WORKDIR /usr/src/asterisk/asterisk-${ASTERISK_SRC_VERSION}

RUN ./configure && make menuselect.makeopts

RUN menuselect/menuselect --enable CORE-SOUNDS-FR-ULAW menuselect.makeopts && menuselect/menuselect --enable MOH-OPSOUND-ULAW menuselect.makeopts && menuselect/menuselect --enable EXTRA-SOUNDS-FR-ULAW menuselect.makeopts && menuselect/menuselect --disable MOH-OPSOUND-WAV menuselect.makeopts

RUN make && make install && ldconfig

WORKDIR /etc/asterisk/

RUN rm -rf /usr/src/asterisk/

EXPOSE 5060/udp
EXPOSE 4069/udp
EXPOSE 4026/udp
EXPOSE 1000-2000/udp
EXPOSE 2727/udp

VOLUME ["/etc/asterisk"]

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["asterisk"]

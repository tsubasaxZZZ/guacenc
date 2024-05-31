FROM ubuntu:latest

ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt update && apt install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev git autoconf libtool freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev make && \
    git clone https://github.com/apache/guacamole-server.git /guacamole-server

WORKDIR /guacamole-server

RUN autoreconf -fi && \
    ./configure --disable-guacd --disable-guaclog && \
    make && \
    make install

ENTRYPOINT ["/usr/local/bin/guacenc"]



FROM redhat/ubi9-minimal
LABEL maintainer="nico@bleiler.dev"

RUN microdnf install shadow-utils glibc.i686 libstdc++.i686 tar gzip -y
RUN useradd -m steam
WORKDIR /home/steam

USER steam

RUN curl -s "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
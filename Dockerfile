FROM redhat/ubi9-minimal
LABEL maintainer="nico@bleiler.dev"

# Install & upgrade packages
RUN microdnf install shadow-utils glibc.i686 libstdc++.i686 tar gzip -y
RUN microdnf upgrade -y
# Create unprivileged user
RUN useradd -m steam
# Use the steam user directory
WORKDIR /home/steam
# Switch to the unprivileged steam user
USER steam
# Download SteamCMD and extract it
RUN curl -s "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
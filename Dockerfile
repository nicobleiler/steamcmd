FROM redhat/ubi9-minimal
LABEL maintainer="nico@bleiler.dev"

ENV USER steam
ENV USERDIR "/home/${USER}"
ENV STEAMCMDDIR "${USERDIR}/cmd"
# Install & upgrade packages
RUN microdnf install shadow-utils glibc.i686 libstdc++.i686 tar gzip -y
RUN microdnf upgrade -y
# Create unprivileged user
RUN useradd -m ${USER}
# Switch to the unprivileged steam user
USER ${USER}
# Create and use the steamcmd directory
RUN mkdir ${STEAMCMDDIR}
WORKDIR ${STEAMCMDDIR}
# Download SteamCMD and extract it
RUN curl -s "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
# Switch to root user to clean up
USER root
RUN microdnf remove tar gzip shadow-utils openldap -y
RUN microdnf clean all -y
# Switch back to the unprivileged steam user
USER ${USER}
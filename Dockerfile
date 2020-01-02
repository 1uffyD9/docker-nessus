FROM ubuntu
ENV nessus Nessus-8.8.0-ubuntu910_amd64.deb
WORKDIR /root
COPY $nessus $nessus
RUN dpkg -i $nessus
EXPOSE 8834/tcp

FROM ubuntu
ENV nessus nessus.deb 
WORKDIR /root
COPY $nessus $nessus
RUN dpkg -i $nessus
EXPOSE 8834/tcp

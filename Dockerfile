FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y python-dev python-pip wget && \
    pip install -U pip && \
    pip install j2cli && \
    rm -rf ~/.pip/cache

RUN MESOS_DNS_VERSION=0.6.0 && \
    wget https://github.com/mesosphere/mesos-dns/releases/download/v${MESOS_DNS_VERSION}/mesos-dns-v${MESOS_DNS_VERSION}-linux-amd64 -O /usr/bin/mesos-dns && \
    chmod ug+x /usr/bin/mesos-dns

EXPOSE 53

WORKDIR /etc/mesos-dns
COPY start.sh /etc/mesos-dns/start.sh
COPY config.j2 /etc/mesos-dns/config.j2

ENTRYPOINT /etc/mesos-dns/start.sh

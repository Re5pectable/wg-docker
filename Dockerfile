FROM ubuntu:22.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wireguard

RUN echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
RUN sysctl -p

EXPOSE 51820/udp

CMD ["wg-quick", "up", "wg0"]
FROM ubuntu:latest

LABEL org.opencontainers.image.source=https://github.com/n-Arno/udp-pod-k8s

COPY server /server

EXPOSE 1053/udp

ENTRYPOINT ["/server"]

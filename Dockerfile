FROM quay.io/fedora/fedora:latest
RUN dnf -y install golang git
ENV APP_ROOT /opt/app-root

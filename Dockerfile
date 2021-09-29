FROM quay.io/centos/centos:stream8 AS builder
RUN cd / && dnf -y download golang golang-src golang-bin

FROM registry.access.redhat.com/ubi8:latest
COPY --from=builder /golang* .
RUN dnf -y install ./golang* git
ENV APP_ROOT /opt/app-root

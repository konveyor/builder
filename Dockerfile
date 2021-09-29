FROM quay.io/centos/centos:stream8 AS builder
RUN dnf -y download golang golang-src golang-bin

FROM registry.access.redhat.com/ubi8:latest
COPY --from=builder /golang* ./
RUN dnf -y install ./golang* git

#This just makes it easier to switch to/from go-toolset.
ENV APP_ROOT /opt/app-root

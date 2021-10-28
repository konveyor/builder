FROM registry.access.redhat.com/ubi8:latest AS builder
RUN echo -ne "[centos-appstream-source]\nname=CentOS Stream 8 - AppStream - Source\nbaseurl=https://vault.centos.org/centos/8-stream/AppStream/Source/\ngpgcheck=1\nenabled=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial\n" > /etc/yum.repos.d/centos-stream-source.repo
RUN dnf -y install rpm-build dnf-plugins-core
RUN dnf download --source golang --disablerepo=* --enablerepo=centos-appstream-source
RUN rpm -ivh ./golang*

# Net and other tests are failing because we're in an unprivileged container
RUN sed -i 's/fail_on_tests\ 1/fail_on_tests 0/g' /root/rpmbuild/SPECS/golang.spec

RUN dnf builddep -y /root/rpmbuild/SPECS/golang.spec
RUN rpmbuild -ba /root/rpmbuild/SPECS/golang.spec


FROM registry.access.redhat.com/ubi8:latest
COPY --from=builder /root/rpmbuild/RPMS/*/golang-1* ./
COPY --from=builder /root/rpmbuild/RPMS/*/golang-bin-1* ./
COPY --from=builder /root/rpmbuild/RPMS/*/golang-src-1* ./
RUN dnf -y install ./golang* git

#This just makes it easier to switch to/from go-toolset.
ENV APP_ROOT /opt/app-root

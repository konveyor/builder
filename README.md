[![UBI 8 multi-arch image build](https://github.com/konveyor/builder/actions/workflows/ubi8_multi_arch_image_build.yml/badge.svg)](https://github.com/konveyor/builder/actions/workflows/ubi8_multi_arch_image_build.yml)
[![UBI 9 multi-arch image build](https://github.com/konveyor/builder/actions/workflows/ubi9_multi_arch_image_build.yml/badge.svg)](https://github.com/konveyor/builder/actions/workflows/ubi9_multi_arch_image_build.yml)

# Builder
From time to time we need a newer version of Go to build projects than is available from go-toolset, or other images available on Quay or registry.access.redhat.com.

While there are usually up to date images on docker.io we tend to hit frequent issues with rate limiting when pulling from there to build on Quay.

This Dockerfile can be used to build an updated image if necessary.

To see the most recent version of Go for EL8:  
https://vault.centos.org/centos/8-stream/AppStream/Source/SPackages/  
  
To see the most recent version of Go for EL9:  
http://mirror.stream.centos.org/9-stream/AppStream/source/tree/

[![multi-arch images build](https://github.com/konveyor/builder/actions/workflows/multi_arch_image_build.yml/badge.svg)](https://github.com/konveyor/builder/actions/workflows/multi_arch_image_build.yml)

# Builder
From time to time we need a newer version of Go to build projects than is available from go-toolset, or other images available on Quay or registry.access.redhat.com.

While there are usually up to date images on docker.io we tend to hit frequent issues with rate limiting when pulling from there to build on Quay.

This Dockerfile can be used to build an updated image if necessary.

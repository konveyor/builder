# Builder
From time to time we need a newer version of Go to build projects than is available from go-toolset, or other images available on Quay or registry.access.redhat.com.

While there are usually up to date images on docker.io we tend to hit frequent issues with rate limiting when pulling from there to build on Quay.

This Dockerfile can be used to build an updated image if necessary.

One consequence of using a Fedora builder to produce a binary for UBI images is that you are likely to see glibc version mismatches when trying to run the binary. This will look something like:
```
$ /usr/local/bin/crane
/usr/local/bin/crane: /lib64/libc.so.6: version `GLIBC_2.32' not found (required by /usr/local/bin/crane)
```

To counter this you can build a static binary by adding `CGO_ENABLED=0` and `'-w -extldflags "-static"'` in your build. For example:
```
RUN CGO_ENABLED=0 go build -ldflags '-w -extldflags "-static"' -o crane main.go
```

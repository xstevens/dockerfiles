# This is somewhat based on the Dockerfile in the subfinder repo. 
# However this doesn't require having their source locally ahead of time. In 
# addition this image does not run as root and uses more recent version of 
# Alpine Linux and Go.
FROM golang:1.11-alpine3.8 AS build
LABEL maintainer="Xavier Stevens"

RUN apk add --no-cache --upgrade git openssh-client ca-certificates
RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /go/src/app
RUN git clone https://github.com/subfinder/subfinder.git . && \
    dep ensure -vendor-only -v && \
    go build -o ./subfinder *.go

# Final Container
FROM alpine:3.8

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /go/src/app/subfinder /usr/bin/subfinder

VOLUME /output

RUN adduser -s /bin/sh -D user
USER user

ENTRYPOINT ["/usr/bin/subfinder"]

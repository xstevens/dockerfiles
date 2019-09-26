FROM golang:1.13-alpine AS build
LABEL maintainer="Xavier Stevens"

RUN apk add --no-cache --upgrade git ca-certificates

WORKDIR /go/src/github.com/OWASP/Amass

ARG AMASS_VERSION=v3.1.9
RUN git clone https://github.com/OWASP/amass.git . && \
    git checkout ${AMASS_VERSION} -b pinned && \
    GO111MODULE=on go get -u github.com/OWASP/Amass/...

# Final Container
FROM alpine:3.10

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /go/bin/amass* /usr/bin/
COPY --from=build /go/src/github.com/OWASP/Amass/wordlists /wordlists

VOLUME /output

RUN adduser -s /bin/sh -D amass
USER amass

ENTRYPOINT ["/usr/bin/amass"]

FROM golang:1.13-alpine AS build
LABEL maintainer="Xavier Stevens"

RUN apk add --no-cache --upgrade git ca-certificates

WORKDIR /go/src/github.com/OWASP/Amass

ARG AMASS_VERSION=e7066984afb04a0687fe3df946371cb57c68a455
RUN git clone https://github.com/xstevens/amass.git . && \
    git checkout ${AMASS_VERSION} -b pinned && \
    GO111MODULE=on go install -v ./...

# Final Container
FROM alpine:3.10

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /go/bin/amass* /usr/bin/
COPY --from=build /go/src/github.com/OWASP/Amass/examples/wordlists /wordlists

VOLUME /output

RUN adduser -s /bin/sh -D amass
USER amass

ENTRYPOINT ["/usr/bin/amass"]

FROM cgr.dev/chainguard/go:latest AS build
LABEL maintainer="Xavier Stevens"

ARG AMASS_VERSION=v5.1.1

RUN CGO_ENABLED=0 go install -v github.com/owasp-amass/amass/v5/...@${AMASS_VERSION} && \
    cp /root/go/bin/amass /usr/bin/

# Final Container
FROM cgr.dev/chainguard/static

# COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
# COPY --from=build /go/src/github.com/OWASP/Amass/examples/wordlists /wordlists
COPY --from=build /usr/bin/amass /usr/bin/amass

VOLUME /output

ENTRYPOINT ["/usr/bin/amass"]

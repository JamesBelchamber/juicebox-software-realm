FROM debian:latest

COPY jb-sw-realm /usr/local/bin/jb-sw-realm

ENV PORT 8080

EXPOSE 8080

HEALTHCHECK CMD curl --fail "http://localhost:8080" || exit 1

ENTRYPOINT ["/usr/local/bin/jb-sw-realm"]

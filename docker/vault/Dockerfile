FROM alpine:3.9

RUN apk --no-cache add bash libarchive-tools postgresql-client

COPY 3rdparty/vault_1.1.1_linux_amd64.zip /tmp/
RUN bsdtar -C /bin/ -xvf /tmp/vault_1.1.1_linux_amd64.zip

COPY vault.hcl /etc/

RUN mkdir -p /vault/data

USER root
CMD ["/bin/vault", "server", "-config", "/etc/vault.hcl"]

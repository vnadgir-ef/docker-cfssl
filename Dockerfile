FROM golang:1.7-alpine

RUN apk add --update --no-cache git gcc g++ openssl

RUN go get github.com/cloudflare/cfssl/cmd/cfssl \
  && go get github.com/cloudflare/cfssl/cmd/cfssljson \
  && go get github.com/cloudflare/cfssl/cmd/mkbundle

RUN mkdir -p  /etc/cfssl/data
ENV VERSION=100
ENV CFSSL_CA_HOST=efset.local \
    CFSSL_CA_ALGO=ecdsa \
    CFSSL_CA_KEY_SIZE=521 \
    CFSSL_CA_ORGANIZATION="EF Education Limited " \
    CFSSL_CA_ORGANIZATIONAL_UNIT="Efset" \
    CFSSL_CA_POLICY_FILE=/etc/cfssl/data/ca_policy.json

COPY start-cfssl /start-cfssl

WORKDIR /etc/cfssl/data

CMD ["/start-cfssl"]

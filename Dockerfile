FROM alpine:3.11.3 as builder

RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

FROM alpine:3.11.3

COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl

RUN kubectl version --client

ENTRYPOINT [ "kubectl" ]

FROM golang:1.14
WORKDIR /go/src/github.com/larkintuckerllc/hello-jenkins
COPY . .
RUN go install

FROM alpine:3.12
WORKDIR /root
COPY --from=0 /go/bin/hello-jenkins .
CMD ["./hello-jenkins"]

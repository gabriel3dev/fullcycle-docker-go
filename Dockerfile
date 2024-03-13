FROM golang:1.17.2-alpine3.14 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init github.com/gabriel3dev/desafios-docker-go && \
    go build -o meuapp
   
FROM scratch
WORKDIR /app
COPY --from=builder /app/meuapp .

CMD ["./meuapp"]

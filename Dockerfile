FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go build -o myapp .

FROM debian:buster-slim

COPY --from=builder /app/myapp /usr/local/bin/myapp

WORKDIR /usr/local/bin/

CMD ["./myapp"]

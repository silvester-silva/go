FROM golang:latest AS builder

WORKDIR /go/src/desafiogo
COPY . .

RUN go mod init
RUN go build -o desafiogo .
RUN ls -la
CMD ["./desafiogo"]

FROM  scratch
COPY --from=builder /go/src/desafiogo .
CMD ["./desafiogo"]
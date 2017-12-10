FROM golang:1.9.2-alpine3.6

RUN apk upgrade
RUN apk update
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN apk add git

WORKDIR /go/src/app
COPY . .

RUN rm restfulapi.exe

RUN go-wrapper download   # "go get -d -v ./..."
RUN go-wrapper install    # "go install -v ./..."

RUN go build -v

CMD ["go-wrapper", "run"] # ["app"]

EXPOSE 8000
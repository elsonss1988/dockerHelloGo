FROM golang:1.17-alpine AS build

RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/mypackage/myapp/

#WORKDIR /go/src/app

COPY . .

RUN go build -o bin/hello
#ENTRYPOINT ["go","run","hello-world.go"]

FROM scratch AS b

COPY --from=build hello hello

ENTRYPOINT ["./hello"]
 
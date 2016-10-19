.PHONY: all deps

GOPATH := ${CURDIR}
export GOPATH
AMD64=GOOS=linux GOARCH=amd64
OUT=bin/galera-healthcheck
GOBUILD=go build -o $(OUT) server.go

all: build-amd64

deps:
	go get -d .

build: deps
	$(GOBUILD)

build-amd64: deps
	env $(AMD64) $(GOBUILD)

clean:
	go clean

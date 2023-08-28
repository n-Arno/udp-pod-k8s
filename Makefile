all: image client

server:
	GOOS=linux GOARCH=amd64 go build server.go

test-server:
        go build -o test-server server.go

client:
	go build client.go

image: server
	docker build . -t ghcr.io/n-arno/udpserver:latest && docker push ghcr.io/n-arno/udpserver:latest

clean:
	- rm -f client server

VER=latest

all: build
build:
	docker build --no-cache=true -t openvas-scanner openvas-scanner/
	docker tag -f openvas-scanner docker.sunet.se/openvas-scanner:$(VER)
	docker build --no-cache=true -t greenbone greenbone/
	docker tag -f greenbone docker.sunet.se/greenbone:$(VER)

update:
	docker build -t openvas-scanner openvas-scanner/
	docker tag -f openvas-scanner docker.sunet.se/openvas-scanner:$(VER)
	docker build -t greenbone greenbone/
	docker tag -f greenbone docker.sunet.se/greenbone:$(VER)

push:
	docker push docker.sunet.se/openvas-scanner:$(VER)
	docker push docker.sunet.se/greenbone:$(VER)

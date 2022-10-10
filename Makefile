all: build

build_base:
	docker build -t transmission_4.0.0_base:aarch64 -f Dockerfile_base.aarch64 --no-cache=true .
build:
	docker build -t transmission:aarch64 -f Dockerfile.aarch64 .
upload:
	docker tag transmission:aarch64 nulldevil/transmission4:aarch64
	docker push nulldevil/transmission4:aarch64
clean:
	docker image prune -a -f
	docker volume prune -f
	docker network prune -f
	docker system prune --volumes -f
enter:
	docker run --rm -it --entrypoint bash transmission:aarch64
test:
	docker-compose up
up:
	docker-compose up -d

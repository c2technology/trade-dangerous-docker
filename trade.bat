@echo off
SET IMAGE=trade-dangerous-cli
SET DOCKERFILE=Dockerfile-cli

SETLOCAL ENABLEEXTENSIONS
SET DOCKER_BUILDKIT=0
SET COMPOSE_DOCKER_CLI_BUILD=0
docker volume create trade-dangerous
docker stop -t 0 trade-dangerous
docker rm trade-dangerous
docker build -t %IMAGE% -f %DOCKERFILE% .
docker run --name trade-dangerous -dt --rm -v trade-dangerous:/home/traded:rw %IMAGE%:latest
docker cp "C:\Users\chris\Saved Games\Frontier Developments\Elite Dangerous" trade-dangerous:/home/traded/journals
docker exec -it trade-dangerous bash
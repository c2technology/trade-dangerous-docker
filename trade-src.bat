@echo off
SET IMAGE=trade-dangerous-src
SET DOCKERFILE=Dockerfile-src
git submodule sync --recursive
SETLOCAL ENABLEEXTENSIONS
SET DOCKER_BUILDKIT=0
SET COMPOSE_DOCKER_CLI_BUILD=0
docker volume create trade-dangerous
docker stop trade-dangerous
docker rm trade-dangerous
docker build -t %IMAGE% -f %DOCKERFILE% .
docker run --name trade-dangerous -dt --rm -v trade-dangerous:/home/traded:rw -v "C:\Users\chris\Saved Games\Frontier Developments\Elite Dangerous":/home/traded/journals %IMAGE%:latest
docker logs -f trade-dangerous
docker build -t trade-dangerous Dockerfile-gui
docker stop -t 0 trade-dangerous-gui || True
docker run --name trade-dangerous-gui --rm -ti -v %CD%/traded:/home/traded:rw --name trade-dangerous-gui trade-dangerous
pause
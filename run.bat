docker build -t trade-dangerous .
docker run --rm -ti -v %CD%/traded:/home/traded:rw trade-dangerous
pause
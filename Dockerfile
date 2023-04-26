# Use an official Ubuntu 20.04 as a base image
FROM ubuntu:20.04

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y python3-tk python3-pip
RUN python3 -m pip install --upgrade pip
RUN pip3 install pyqt5
RUN pip install --upgrade tradedangerous
RUN pip install pycparser
# Set the environment variable for the display
ENV DISPLAY=host.docker.internal:0
ENV TD_DATA=/home/traded/data 
ENV TD_TMP=/home/traded/tmp

# Set the entry point
CMD ["tradegui"]

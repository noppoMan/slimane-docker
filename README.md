# slimane-docker
[Docker Image] (https://hub.docker.com/r/osawagiboy/slimane-docker/) for Slimane

## How to use this docker image
### Create a Dockerfile in your Slimane app project
```
FROM slimane/application:latest
MAINTAINER osawagiboy@gmail.com

RUN mkdir -p /slimane
WORKDIR /slimane
ADD . /slimane
RUN make

EXPOSE 3000
CMD .build/release/SlimaneExample
```
Put this file in the root of your app.

### You can then build and run the Slimane image
```
$ docker build -t slimane-app .
$ docker run -d --name slimane-app -p 3000:3000 slimane-app
```

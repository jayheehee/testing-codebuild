FROM golang:1.12-alpine AS build
#Install git
RUN apk add --no-cache git
#Get the hello world package from a GitHub repository
RUN go get github.com/golang/example/hello
WORKDIR /go/src/github.com/golang/example/hello
# Build the project and send the output to /bin/HelloWorld
RUN go build -o /bin/HelloWorld

FROM golang:1.12-alpine
#Copy the build's output binary from the previous build container
COPY --from=build /bin/HelloWorld /bin/HelloWorld
ENTRYPOINT ["/bin/HelloWorld"]

# syntax=docker/dockerfile:1

#FROM ubuntu:latest

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y python3-pip
RUN mkdir -p /databricks/jars
RUN pip3 install -r requirements.txt
RUN apt-get install -y curl
RUN cd /databricks/jars && curl -O https://search.maven.org/remotecontent?filepath=org/mlflow/mlflow-client/1.19.0/mlflow-client-1.19.0.jar



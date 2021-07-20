#syntax=docker/dockerfile:1

FROM ubuntu:latest

WORKDIR /app
#
#COPY requirements.txt .
#
RUN echo "Other branch2"
#RUN apt-get update \
#    && apt-get install -y python3-pip
#RUN mkdir -p /databricks/jars
#RUN pip3 install -r requirements.txt
#RUN apt-get install -y curl
#RUN cd /databricks/jars && curl -O https://search.maven.org/remotecontent?filepath=org/mlflow/mlflow-client/1.19.0/mlflow-client-1.19.0.jar
#

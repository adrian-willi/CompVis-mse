ARG TAG=latest
FROM jupyter/datascience-notebook:${TAG}

USER root
RUN apt update && apt install -yq gcc g++ build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

USER jovyan

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN ls -al /tmp
RUN jupyter nbextension enable --py widgetsnbextension
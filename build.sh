#!/bin/bash

docker pull dclong/jupyter-nodejs:next
docker build -t dclong/jupyterlab:next .

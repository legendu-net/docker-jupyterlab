#!/bin/bash

docker pull dclong/python-nodejs
docker build -t dclong/jupyterlab:next .

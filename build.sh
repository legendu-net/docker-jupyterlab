#!/bin/bash

docker pull dclong/python-nodejs:next
docker build -t dclong/jupyterlab:next .

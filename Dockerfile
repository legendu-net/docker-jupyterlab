FROM dclong/jupyter-nodejs

RUN pip3 install jupyterlab

COPY scripts /scripts
COPY settings /settings

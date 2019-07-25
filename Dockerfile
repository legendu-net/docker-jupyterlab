FROM dclong/jupyter-nodejs

RUN pip3 install --no-cache-dir jupyterlab \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install jupyterlab-favorites \
    && jupyter labextension install jupyterlab-recents \
    && npm cache clean --force

COPY scripts /scripts
COPY settings /settings

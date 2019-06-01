FROM dclong/jupyter-nodejs

RUN pip3 install --no-cache-dir jupyterlab \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install @mflevine/jupyterlab_html \
    && npm cache clean --force

COPY scripts /scripts
COPY settings /settings

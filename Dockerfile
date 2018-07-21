FROM dclong/jupyter-nodejs

RUN pip3 install jupyterlab \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @mflevine/jupyterlab_html \
    && jupyter lab build

COPY scripts /scripts
COPY settings /settings

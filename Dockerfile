FROM dclong/jupyter-nodejs

RUN pip3 install --no-cache-dir "jupyterlab>=1.2.7,<2.0.0" \
      # jupyter-lsp 
      python-language-server[all] \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/toc \
    # && jupyter labextension install jupyterlab-favorites \
    # && jupyter labextension install jupyterlab-recents \
    # && jupyter labextension install @krassowski/jupyterlab-lsp \
    && npm cache clean --force

COPY scripts /scripts
COPY settings /settings

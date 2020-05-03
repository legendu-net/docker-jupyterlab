FROM dclong/jupyter-nodejs

RUN pip3 install --no-cache-dir "jupyterlab>=2.1.0,<2.2.0" \
      # jupyter-lsp 
      python-language-server[all] \
      jupyterlab-quickopen \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/toc \
    # && jupyter labextension install jupyterlab-favorites \
    # && jupyter labextension install jupyterlab-recents \
    # && jupyter labextension install @krassowski/jupyterlab-lsp \
    && jupyter labextension install @parente/jupyterlab-quickopen \
    && npm cache clean --force

COPY scripts /scripts
COPY settings /settings

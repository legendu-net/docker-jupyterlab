# NAME: dclong/jupyterlab
FROM dclong/jupyter-nodejs
# GIT: https://github.com/dclong/docker-jupyter-nodejs.git

RUN pip3 install --no-cache-dir "jupyterlab>=2.1.0,<2.3.0" \
      # jupyter-lsp 
      python-language-server[all] \
      nbresuse \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install jupyterlab-favorites \
    && jupyter labextension install jupyterlab-recents \
    && jupyter labextension install jupyterlab-topbar-extension jupyterlab-system-monitor \
    # && jupyter labextension install @krassowski/jupyterlab-lsp \
    && npm cache clean --force

COPY scripts /scripts
#COPY settings/themes.jupyterlab-settings /etc/jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY settings /settings

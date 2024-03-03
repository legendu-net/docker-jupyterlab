# NAME: dclong/jupyterlab
FROM dclong/python-nodejs
# GIT: https://github.com/legendu-net/docker-python-nodejs.git

RUN pip3 install --break-system-packages \
      nbdime jinja2 nbconvert "jupyterlab>=2.1.0,<4.1.0" \
      jupyterlab_widgets ipywidgets jupyterlab_myst \
      jupyterlab-lsp python-lsp-server[all] \
      jupyterlab-code-formatter \
      jupyterlab_vim \
      jupyter-resource-usage \
      jupyter_ai \
    && jupyter labextension disable @axlair/jupyterlab_vim \
    && /scripts/sys/purge_cache.sh \
    && npm cache clean --force

COPY scripts /scripts
#COPY settings/themes.jupyterlab-settings /etc/jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY settings /settings

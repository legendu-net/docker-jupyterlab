# NAME: dclong/jupyterlab
FROM dclong/python-nodejs
# GIT: https://github.com/legendu-net/docker-python-nodejs.git

RUN pip3 install nbdime jinja2 nbconvert "jupyterlab>=2.1.0,<3.3.0" \
      jupyterlab_widgets ipywidgets \
      jupyterlab_vim \
      jupyterlab-lsp python-language-server[all] \
      jupyterlab_kernel_usage \
    && jupyter labextension disable @axlair/jupyterlab_vim \
    && /scripts/sys/purge_cache.sh \
    && npm cache clean --force

COPY scripts /scripts
#COPY settings/themes.jupyterlab-settings /etc/jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY settings /settings

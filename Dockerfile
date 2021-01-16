# NAME: dclong/jupyterlab
FROM dclong/python-nodejs
# GIT: https://github.com/dclong/docker-python-nodejs.git

RUN pip3 install --no-cache-dir "nbconvert==5.6.1" "jupyterlab>=2.1.0,<3.1.0" \
      # jupyter-lsp 
      python-language-server[all] \
      # nbresuse jupyter-resource-usage \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    #&& jupyter labextension install jupyterlab-favorites \
    #&& jupyter labextension install jupyterlab-recents \
    # && jupyter labextension install jupyterlab-topbar-extension jupyterlab-system-monitor \
    # && jupyter labextension install @krassowski/jupyterlab-lsp \
    && npm cache clean --force
    
# Python 3.7 Kernel
RUN /opt/pyenv/versions/3.7.*/bin/python -m pip install ipykernel \
    && /opt/pyenv/versions/3.7.*/bin/python -m ipykernel install --name python3.7 --display-name "Python 3.7"

COPY scripts /scripts
#COPY settings/themes.jupyterlab-settings /etc/jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY settings /settings

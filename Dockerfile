FROM dclong/jupyter

RUN conda install -y -c conda-forge \
        nodejs \
        jupyterlab \
    # && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager

COPY scripts /scripts
COPY settings /settings
# ADD jupyter_notebook_config.py /root/.jupyter/

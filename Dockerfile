FROM dclong/python

RUN mkdir -p /jupyter \ 
    && pip3 install \
        jupyterlab \
        ipywidgets jupyterlab-widgets \
        # plotly jupyterlab_plotly \
        qgrid \
    # && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension install --sys-prefix --py --symlink jupyterlab_plotly \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_plotly \
    && jupyter serverextension enable --sys-prefix --py jupyterlab \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension  

EXPOSE 8888
EXPOSE 8889

# ADD jupyter_notebook_config.py /root/.jupyter/
ADD scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]

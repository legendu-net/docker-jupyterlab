FROM dclong/python

RUN pip3 install \
        jupyterlab \
        ipywidgets jupyterlab-widgets \
        # plotly jupyterlab_plotly \
        qgrid \
    && jupyter serverextension enable --sys-prefix --py jupyterlab \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension
    # && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension install --sys-prefix --py --symlink jupyterlab_plotly \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_plotly \

EXPOSE 8888
EXPOSE 8889

# ADD jupyter_notebook_config.py /root/.jupyter/
ADD init.sh /
ADD script.sh /
ADD list.sh /

ENTRYPOINT ["/init.sh"]

FROM ubuntu

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        gcc \
        python3 python3-pip \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && apt-get autoremove \
    && apt-get autoclean 

RUN pip3 install \
        jupyterlab \
        ipywidgets jupyterlab-widgets \
        # plotly jupyterlab_plotly \
        qgrid \
    && jupyter serverextension enable --sys-prefix --py jupyterlab \
    # && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension install --sys-prefix --py --symlink jupyterlab_plotly \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_plotly \
    && mkdir -p /jupyter 

EXPOSE 8888
EXPOSE 8889

# ADD jupyter_notebook_config.py /root/.jupyter/
ADD init.sh /
ADD script.sh /

ENTRYPOINT ["/init.sh"]

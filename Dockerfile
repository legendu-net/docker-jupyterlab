FROM dclong/python

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs npm \
    && ln -s /usr/bin/nodejs /usr/bin/node

ARG nver=9.2.1
RUN npm install -g n \
    && n $nver \
    && ln -sf /usr/local/n/versions/node/$nver/bin/node /usr/bin/nodejs \
    && ln -sf /usr/bin/nodejs /usr/bin/node

RUN pip3 install \
        jupyterlab nbdime \
        ipywidgets jupyterlab-widgets \
        qgrid \
        # plotly jupyterlab_plotly \
    # && jupyter labextension install --sys-prefix --py --symlink jupyterlab_plotly \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_plotly \
    # && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    && jupyter serverextension enable --sys-prefix --py jupyterlab \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension  

RUN mkdir /jupyter && chmod 777 /jupyter
COPY scripts /scripts
COPY settings /settings
# ADD jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8888

ENTRYPOINT ["/scripts/init.sh"]

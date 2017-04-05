FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        git \
        python3 python3-pip \
        gcc python3-all-dev python3-setuptools build-essential python3-wheel \
        libssl-dev \
    && pip3 install \
        jupyterlab ipywidgets qgrid \
        numpy scipy pandas dask \
        scikit-learn nltk \
        matplotlib plotly \ 
        # bokeh arrow python-dateutil \
        JayDeBeApi pymongo sqlalchemy \
        requests Scrapy beautifulsoup4 \
    # jupyter setup	
    && jupyter serverextension enable --py jupyterlab --sys-prefix \
    && jupyter nbextension enable --py widgetsnbextension \
    # python2 kernel
    && apt-get install -y --no-install-recommends \
        python python-pip \
        python-all-dev python-setuptools python-wheel \
    && pip install ipykernel \
    && python -m ipykernel install \
    # more setup & clean up	
    && mkdir -p /jupyter \
    && apt-get autoremove \
    && apt-get autoclean 

# ADD jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8888
EXPOSE 8889

ADD init.sh /
ADD script.sh /
ADD script_jupyter.sh /
ADD script_jupyterlab.sh /

ENTRYPOINT ["/init.sh"]

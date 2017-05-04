FROM centos

RUN yum update -y \
    && yum install -y epel-release 

RUN yum install -y \
        sudo \
        gcc gcc-c++ \
        python34 python34-devel python34-pip \
    && yum clean all 

RUN pip3 install \
        jupyterlab \
        ipywidgets jupyterlab-widgets \
        # plotly jupyterlab_plotly \
        qgrid \
    && jupyter serverextension enable --sys-prefix --py jupyterlab \
    && jupyter labextension install --sys-prefix --py jupyterlab_widgets \
    && jupyter labextension enable --sys-prefix --py jupyterlab_widgets \
    # && jupyter labextension install --sys-prefix --py --symlink jupyterlab_plotly \
    # && jupyter labextension enable --sys-prefix --py jupyterlab_plotly \
    && mkdir -p /jupyter 

EXPOSE 8888

# ADD jupyter_notebook_config.py /root/.jupyter/
ADD init.sh /
ADD script.sh /

ENTRYPOINT ["/init.sh"]

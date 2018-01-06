# [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)

JupyterLab (in Python 3). 

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage in Linux/Unix

```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -v /wwwroot:/jupyter \
    dclong/jupyterlab
```
## Image Tree Related to [dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

- [dclong/python](https://hub.docker.com/r/dclong/python/)
    - [dclong/dryscrape](https://hub.docker.com/r/dclong/dryscrape/)
    - [dclong/flask](https://hub.docker.com/r/dclong/flask/)
    - [dclong/jupyter](https://hub.docker.com/r/dclong/jupyter/)
        - [dclong/jupyter-beakerx](https://hub.docker.com/r/dclong/jupyter-beakerx/)
    - [dclong/bokeh](https://hub.docker.com/r/dclong/bokeh/)
    - [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)
        - [dclong/jupyterlab-ts](https://hub.docker.com/r/dclong/jupyterlab-ts/)
        - [dclong/jupyterlab-js](https://hub.docker.com/r/dclong/jupyterlab-js/)
        - [dclong/jupyterlab-beakerx](https://hub.docker.com/r/dclong/jupyterlab-beakerx/)
        - [dclong/jupyterlab-tdodbc](https://hub.docker.com/r/dclong/jupyterlab-tdodbc/)
        - [dclong/jupyterlab-jdk](https://hub.docker.com/r/dclong/jupyterlab-jdk/)
            - [dclong/jupyterlab-scala](https://hub.docker.com/r/dclong/jupyterlab-scala/)
                - [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)
            - [dclong/jupyterlab-antlr4](https://hub.docker.com/r/dclong/jupyterlab-antlr4/)
        - [dclong/jupyterlab-py](https://hub.docker.com/r/dclong/jupyterlab-py/)
        - [dclong/jupyterlab-rb](https://hub.docker.com/r/dclong/jupyterlab-rb/)
            - [dclong/jupyterlab-rp](https://hub.docker.com/r/dclong/jupyterlab-rp/)
                - [dclong/jupyterlab-rp-py](https://hub.docker.com/r/dclong/jupyterlab-rp-py/)
                - [dclong/jupyterlab-rstudio](https://hub.docker.com/r/dclong/jupyterlab-rstudio/)
                    - [dclong/jupyterlab-rstudio-py](https://hub.docker.com/r/dclong/jupyterlab-rstudio-py/)
                        - [dclong/jupyterlab-ds](https://hub.docker.com/r/dclong/jupyterlab-ds/)
                            - [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)

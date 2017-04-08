# JupyterLab

Jupyter Notebook/Lab with Python 3 and Python 2 (minimal packages). 

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage 

```
docker run -d -p 8888:8888 -p 8889:8889 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -v $HOME:/jupyter \
    dclong/jupyterlab
```
```
docker run -d -p 8888:8888 -p 8889:8889 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -v $HOME:/jupyter \
    dclong/jupyterlab
```

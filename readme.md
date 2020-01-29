# dclong/jupyterlab [@DockerHub](https://hub.docker.com/r/dclong/jupyterlab/) | [@GitHub](https://github.com/dclong/docker-jupyterlab)

JupyterLab in Docker. 
**It is recommended that you use the image
[dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)
for data science related work.**
Note: Python packages are managed using pip instead of conda.

## Prerequisite
You need to [install Docker](http://www.legendu.net/en/blog/docker-installation/) before you use this Docker image.

## Usage in Linux/Unix

Please refer to the Section
[Usage](http://www.legendu.net/en/blog/my-docker-images/#usage)
of the post [My Docker Images](http://www.legendu.net/en/blog/my-docker-images/) 
for detailed instruction on how to use the Docker image.

The following command starts a container 
and mounts the current working directory and `/home` on the host machine 
to `/workdir` and `/home_host` in the container respectively.
```
docker run -d \
    --name jupyterlab \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v $(pwd):/workdir \
    -v $(dirname $HOME):/home_host \
    dclong/jupyterlab /scripts/sys/init.sh
```
The following command (only works on Linux) does the same as the above one 
except that it limits the use of CPU and memory.
```
docker run -d \
    --name jupyterlab \
    --log-opt max-size=50m \
    --memory=$(($(head -n 1 /proc/meminfo | awk '{print $2}') * 4 / 5))k \
    --cpus=$(($(nproc) - 1)) \
    -p 8888:8888 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v $(pwd):/workdir \
    -v $(dirname $HOME):/home_host \
    dclong/jupyterlab /scripts/sys/init.sh
```
## [Get the Token for Login](http://www.legendu.net/en/blog/my-docker-images/#get-information-of-running-jupyterlab-servers) 

## [Log Information](http://www.legendu.net/en/blog/my-docker-images/#docker-container-logs)

## [Detailed Information](http://www.legendu.net/en/blog/my-docker-images/#list-of-images-and-detailed-information) 

## [Known Issues](http://www.legendu.net/en/blog/my-docker-images/#known-issues)

## [About the Author](http://www.legendu.net/pages/about)

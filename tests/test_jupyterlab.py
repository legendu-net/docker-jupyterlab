import subprocess as sp 


def test_launch():
    sp.run("docker ps", shell=True, check=True)
    proc = sp.run("""
        docker run -d --init \
            --hostname jupyterlab \
            --log-opt max-size=50m \
            -p 8888:8888 \
            -e DOCKER_USER=$(id -un) \
            -e DOCKER_USER_ID=$(id -u) \
            -e DOCKER_PASSWORD=$(id -un) \
            -e DOCKER_GROUP_ID=$(id -g) \
            -v "$(pwd)":/workdir \
            -v "$(dirname $HOME)":/home_host \
            dclong/jupyterlab:next /scripts/sys/init.sh
            """, shell=True, check=True, capture_output=True)
    cid = proc.stdout.decode()
    sp.run(f"docker stop {cid}", shell=True, check=True)
    sp.run("docker ps", shell=True, check=True)

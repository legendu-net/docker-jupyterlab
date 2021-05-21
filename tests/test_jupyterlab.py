import subprocess as sp 


def test_launch():
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
    cid = proc.stdout
    cids = sp.run("docker ps -q --no-trunc", shell=True, check=True, capture_output=True).stdout.split()
    assert cid in cids
    sp.run(f"docker stop {cid}", shell=True, check=True)
    sp.run(f"docker rm {cid}", shell=True, check=True)

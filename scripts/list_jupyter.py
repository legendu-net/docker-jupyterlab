#!/usr/bin/env python3
import getpass
import subprocess as sp


def get_jupyter_user() -> bytes:
    cmd = "ps aux | grep -i -E 'python3 .*jupyter(-lab)?'"
    proc = sp.run(cmd, shell=True, stdout=sp.PIPE)
    for line in proc.stdout.strip().split(b"\n"):
        if b"/usr/bin/python3 /usr/local/bin/jupyter" in line:
            return line.strip().split()[0]
    raise ProcessLookupError("No process named jupyter or jupyter-lab.")


def main():
    cmd = ["/scripts/sys/list_jupyter.py"]
    if getpass.getuser() == "root":
        cmd = ["su", get_jupyter_user(), "-c"] + cmd
    sp.run(cmd, check=True)


if __name__ == "__main__":
    main()

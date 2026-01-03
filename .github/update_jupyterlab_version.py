#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "github-rest-api>=0.26.0",
# ]
# ///
from pathlib import Path
import re
import subprocess as sp
from github_rest_api import Repository

DOCKERFILE = Path(__file__).parent.parent / "Dockerfile"


def parse_latest_version() -> str:
    repo = Repository(token="", owner="jupyterlab", repo="jupyterlab")
    # repo = Repository(token="", owner="legendu-net", repo="icon")
    release = repo.get_release_latest()
    return release["tag_name"].replace("v", "")


def strip_patch_version(version: str):
    parts = version.split(".")
    return ".".join(parts[:2]) + ".0"


def push_changes():
    proc = sp.run("git status --porcelain", shell=True, check=True, capture_output=True)
    if proc.stdout:
        sp.run(
            """git add Dockerfile \
            && git commit -m "update version of JupyterLab" \
            && git push origin dev
            """.strip(),
            shell=True,
            check=True,
        )
        print("Changes have been committeed and pushed.")
    else:
        print("No changes!")


def update_version() -> None:
    version = parse_latest_version()
    print(f"The latest version of JupyterLab is v{version}.")
    text = DOCKERFILE.read_text()
    text = re.sub(r",<\d+\.\d+\.0", ",<" + strip_patch_version(version), text)
    DOCKERFILE.write_text(text)


def main():
    update_version()
    push_changes()


if __name__ == "__main__":
    main()

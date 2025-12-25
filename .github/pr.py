#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "github-rest-api>=0.25.0",
# ]
# ///

"""Create a PR from the specified branch to dev.
The branch is updated (using dev) before creating the PR.
"""
from argparse import ArgumentParser, Namespace
from github_rest_api import Repository


def parse_args(args=None, namespace=None) -> Namespace:
    """Parse command-line arguments.
    :param args: The arguments to parse.
        If None, the arguments from command-line are parsed.
    :param namespace: An inital Namespace object.
    :return: A namespace object containing parsed options.
    """
    parser = ArgumentParser(description="Create pull requests to the dev branch.")
    parser.add_argument(
        "--token",
        dest="token",
        required=True,
        help="The personal access token for authentication.",
    )
    parser.add_argument(
        "--head-branch",
        dest="head_branch",
        required=True,
        help="The head branch containing changes to merge.",
    )
    parser.add_argument(
        "--base-branch",
        dest="base_branch",
        required=True,
        help="The base branch to merge changes into.",
    )
    return parser.parse_args(args=args, namespace=namespace)


def main():
    """Main entrance of the script,
    which creates a PR from the specified branch to dev.
    The branch is updated (using dev) before creating the PR.
    """
    args = parse_args()
    # skip branches with the pattern _*
    if args.head_branch.startswith("_"):
        return
    repo = Repository(args.token, "legendu-net", "docker-jupyterlab")
    repo.create_pull_request(
        {
            "base": args.base_branch,
            "head": args.head_branch,
            "title": f"Merge {args.head_branch} Into {args.base_branch}",
        },
    )


if __name__ == "__main__":
    main()

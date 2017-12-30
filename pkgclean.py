#!/usr/bin/env python
from github import Github
import subprocess
import sys


def main():
    github_token = sys.argv[1]
    repo_name = sys.argv[2].split('/')[1]
    tag_name = sys.argv[3]

    packages = list_available_packages(repo_name)

    repository = Github(github_token).get_user().get_repo(repo_name)

    for asset in repository.get_release(tag_name).get_assets():
        if asset.name.endswith('.pkg.tar.xz') and not asset.name.startswith(tuple(packages)):
            if asset.delete_asset():
                print('Deleted: {0}'.format(asset.name))
            else:
                sys.exit('Failed to delete: {0}'.format(asset.name))


def list_available_packages(repo):
    results = []

    # Use `pacman -Sl <repo>` to get all packages available in given repo
    data = subprocess.Popen(['pacman', '-Syl', repo], stderr=subprocess.PIPE, stdout=subprocess.PIPE).communicate()

    for x in data[0].decode().split('\n'):
        if not x.split():
            continue
        x = x.split(' ')
        # Store package in 'name-version' format
        results.append(x[1] + '-' + x[2])

    return results


if __name__ == "__main__":
    main()

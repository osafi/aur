# aur [![Build](https://github.com/osafi/aur/workflows/Build%20ArchLinux%20Package%20Repository/badge.svg)](https://github.com/osafi/aur/actions)

Use GitHub Actions for building and packaging a few [AUR](https://aur.archlinux.org) packages and deploy them to [GitHub Releases](https://github.com/osafi/aur/releases) so it can be used as repository in [Arch Linux](https://www.archlinux.org).

## Use repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[aur]
SigLevel = Optional TrustAll
Server = https://github.com/osafi/aur/releases/download/repository
```

Then on the command line:

```
pacman -Sy            # Refresh package database.
pacman -Sl aur        # Show packages in repository.
pacman -S {package}   # Install a package.
```

**NOTE:** List of currently maintained packages can change at any moment.

## Forking repository

To build the [AUR](https://aur.archlinux.org) packages of your choice fork this repository and setup the GitHub Actions workflow:

  - Fork this GitHub repository and edit `pkglist`.
  - Generate a personal access token with scope `public_repo`.
  - In the forked repository settings declare the following secrets:
    - `ACCESS_TOKEN_GITHUB`: The previously created personal access token

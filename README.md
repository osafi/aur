# aurci [![Build Status](https://travis-ci.org/localnet/aurci.svg?branch=master)](https://travis-ci.org/localnet/aurci)

Use [Travis CI](https://travis-ci.org/localnet/aurci) for building and packaging a few [AUR](https://aur.archlinux.org) packages and deploy them to [GitHub Releases](https://github.com/localnet/aurci/releases) so it can be used as repository in [Arch Linux](https://www.archlinux.org).

## Use repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[aurci]
SigLevel = Optional TrustAll
Server = https://github.com/localnet/aurci/releases/download/repository
```

Then on the command line:

```
pacman -Sy            # Refresh package database.
pacman -Sl aurci      # Show packages in repository.
pacman -S {package}   # Install a package.
```

**NOTE:** List of currently maintained packages can change at any moment.

## Forking repository

For build the [AUR](https://aur.archlinux.org) packages of your election fork this repository and enable [Travis CI](https://travis-ci.org):

  - Fork this GitHub repository and edit `pkglist`.
  - Create a release for your new forked repository.
  - Generate a personal access token with scope `public_repo`.
  - Enable Travis CI for your new forked repository.
  - In Travis CI repository settings disable build pull request updates, for security.
  - In Travis CI repository settings declare two environment variables:
    - `GITHUB_TOKEN`: The previously created personal access token, disable display value.
    - `TRAVIS_TAG`: The name of your previosly created GitHub release.
  - Optionally, enable a cron job in Travis CI repository settings.

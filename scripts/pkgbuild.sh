#!/bin/bash

set -ex

# Make AURDEST directory
mkdir -p src

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"
export AURDEST="$(pwd)/src"

# Fix for installing cower (pod2man required on path)
export PATH=/usr/bin/core_perl:$PATH

# Variables declaration.
declare -r pkgrepo="${1#*/}"
declare -a pkglist=()
declare -a pkgkeys=()

# Remove comments or blank lines.
for pkgfile in "pkglist" "pkgkeys"; do
  sed -i -e "/\s*#.*/s/\s*#.*//" -e "/^\s*$/d" ${pkgfile}
done

# Load files.
mapfile pkglist < "pkglist"
mapfile pkgkeys < "pkgkeys"

# Remove packages from repository that are no longer in pkglist file
mkdir -p bin && pushd bin
while read pkgpackage; do
  repo-remove "${pkgrepo}.db.tar.gz" ${pkgpackage}
done < <(comm -23 <(pacman -Sl ${pkgrepo} | cut -d" " -f2 | sort) <(aurchain ${pkglist[@]} | sort))
popd

# Get package gpg keys.
for pkgkey in ${pkgkeys[@]}; do
  gpg --recv-keys --keyserver "hkp://ipv4.pool.sks-keyservers.net" $pkgkey
done

# Build outdated packages.
aursync --repo ${pkgrepo} --root "bin" -nr ${pkglist[@]}

{ set +ex; } 2>/dev/null

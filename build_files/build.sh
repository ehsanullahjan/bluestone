#!/bin/bash

set -euxo pipefail

/ctx/build_files/pre-build.sh

/ctx/build_files/install/gpu-hwe.sh
/ctx/build_files/install/multimedia.sh

/ctx/build_files/install/montools.sh
/ctx/build_files/install/systools.sh

/ctx/build_files/install/network.sh
/ctx/build_files/install/vpn.sh

/ctx/build_files/install/docker.sh
/ctx/build_files/install/podman.sh
/ctx/build_files/install/libvirt.sh

/ctx/build_files/install/fonts.sh
/ctx/build_files/install/git.sh
/ctx/build_files/install/packages.sh
/ctx/build_files/install/yazi.sh

/ctx/build_files/install/1password.sh
/ctx/build_files/install/flatpaks.sh

/ctx/build_files/post-build.sh

#!/bin/bash

set -euxo pipefail

/ctx/build_files/pre-build.sh

/ctx/build_files/install/rocm.sh
/ctx/build_files/install/rpmfusion.sh

/ctx/build_files/install/docker.sh
/ctx/build_files/install/podman.sh
/ctx/build_files/install/libvirt.sh
/ctx/build_files/install/tailscale.sh

/ctx/build_files/install/sysmon.sh

/ctx/build_files/install/carapace.sh
/ctx/build_files/install/dysk.sh
/ctx/build_files/install/fonts.sh
/ctx/build_files/install/git.sh
/ctx/build_files/install/packages.sh
/ctx/build_files/install/starship.sh
/ctx/build_files/install/yazi.sh

/ctx/build_files/install/1password.sh
/ctx/build_files/install/flatpaks.sh

/ctx/build_files/post-build.sh

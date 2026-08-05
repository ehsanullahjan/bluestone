#!/bin/bash

set -euxo pipefail

dnf copr -y enable atim/starship
dnf config-manager setopt copr:copr.fedorainfracloud.org:atim:starship.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:atim:starship install starship

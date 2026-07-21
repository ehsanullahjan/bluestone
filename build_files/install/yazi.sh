#!/bin/bash

set -euxo pipefail

dnf copr -y enable lihaohong/yazi
dnf config-manager setopt copr:copr.fedorainfracloud.org:lihaohong:yazi.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:lihaohong:yazi install chafa yazi

#!/bin/bash

set -euxo pipefail

dnf copr -y enable fernando-debian/dysk
dnf config-manager setopt copr:copr.fedorainfracloud.org:fernando-debian:dysk.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:fernando-debian:dysk install dysk

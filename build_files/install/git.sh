#!/bin/bash

set -euxo pipefail

dnf copr -y enable atim/lazygit
dnf config-manager setopt copr:copr.fedorainfracloud.org:atim:lazygit.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:atim:lazygit install \
	git \
	lazygit \
	difftastic \
	git-delta

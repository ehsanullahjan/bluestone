#!/bin/bash

set -euxo pipefail

dnf -y copr enable che/nerd-fonts
dnf config-manager setopt copr:copr.fedorainfracloud.org:che:nerd-fonts.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:che:nerd-fonts install \
	cascadia-code-fonts \
	fira-code-fonts \
	jetbrains-mono-fonts-all \
	nerd-fonts

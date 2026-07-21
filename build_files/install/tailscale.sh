#!/bin/bash

set -euxo pipefail

rpm --import https://pkgs.tailscale.com/stable/fedora/repo.gpg
cat <<-EOF >/etc/yum.repos.d/tailscale.repo
	[tailscale-stable]
	name=Tailscale stable
	baseurl=https://pkgs.tailscale.com/stable/fedora/\$basearch
	enabled=1
	repo_gpgcheck=1
	gpgcheck=1
	gpgkey=https://pkgs.tailscale.com/stable/fedora/repo.gpg
EOF
dnf config-manager setopt tailscale-stable.enabled=0

dnf -y --enable-repo=tailscale-stable install tailscale
systemctl enable tailscaled.service

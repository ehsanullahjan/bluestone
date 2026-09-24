#!/bin/bash

set -euxo pipefail

dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf config-manager setopt docker-ce-stable.enabled=0

dnf -y --enable-repo=docker-ce-stable install \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin \
	docker-model-plugin \
	docker-ce \
	docker-ce-cli

# Create sysusers.d entry for docker group
cat <<-EOF >/usr/lib/sysusers.d/docker.conf
	g docker - -
EOF

systemctl enable docker.socket

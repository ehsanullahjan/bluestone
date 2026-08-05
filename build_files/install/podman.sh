#!/bin/bash

set -euxo pipefail

dnf -y install \
	podlet \
	podman \
	podman-compose \
	podman-tui

systemctl enable podman.socket
systemctl enable podman-auto-update.timer

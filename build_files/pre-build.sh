#!/bin/bash

set -euxo pipefail

# Copy custom configs
rsync -rvK /ctx/system_files/pre-build/ /

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)' rsync

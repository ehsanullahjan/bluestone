#!/bin/bash

set -euxo pipefail

dnf -y install @virtualization guestfs-tools
systemctl enable virtqemud.service

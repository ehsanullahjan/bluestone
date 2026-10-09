#!/bin/bash

set -euxo pipefail

dnf -y install @virtualization guestfs-tools bcvk
systemctl enable virtqemud.service

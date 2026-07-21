#!/bin/bash

set -euxo pipefail

dnf -y install @virtualization
systemctl enable virtqemud.service

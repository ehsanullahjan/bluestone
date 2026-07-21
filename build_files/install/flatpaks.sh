#!/bin/bash

set -euxo pipefail

# Disable Fedora flatpak remote
systemctl disable flatpak-add-fedora-repos.service

# Enable Flathub flatpak remote
systemctl enable flathub-init.service

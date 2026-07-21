#!/bin/bash

set -euxo pipefail

# Enable rpmfusion and its dependencies
dnf config-manager setopt fedora-cisco-openh264.enabled=1
dnf -y install \
	"https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
	"https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Enable appstream for rpmfusion
dnf -y install rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data

# Enable add'l multimedia codecs (must list pkgs explicitly on silverblue base image)
# >>> dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf -y swap ffmpeg-free ffmpeg --allowerasing
dnf -y install --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
	gstreamer1-plugins-bad-freeworld \
	gstreamer1-plugins-ugly \
	libheif-freeworld \
	pipewire-codec-aptx

# Enable hw-accel for AMD hardware
dnf -y install libva-utils mesa-va-drivers-freeworld

dnf config-manager setopt \
	fedora-cisco-openh264.enabled=0 \
	rpmfusion-free.enabled=0 \
	rpmfusion-free-updates.enabled=0 \
	rpmfusion-nonfree.enabled=0 \
	rpmfusion-nonfree-updates.enabled=0

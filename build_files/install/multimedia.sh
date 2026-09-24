#!/bin/bash

set -euxo pipefail

# Enable rpmfusion
dnf -y install \
	"https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
	"https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Enable openh264 for native firefox
dnf -y swap noopenh264 openh264 --allowerasing
dnf -y install --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
	mozilla-openh264 \
	gstreamer1-plugin-openh264

# Enable add'l multimedia codecs from rpmfusion (must list pkgs explicitly on silverblue base image)
# >>> dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf -y swap ffmpeg-free ffmpeg --allowerasing
dnf -y install --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
	gstreamer1-plugins-bad-freeworld \
	gstreamer1-plugins-ugly \
	libheif-freeworld \
	pipewire-codec-aptx

dnf config-manager setopt \
	rpmfusion-free.enabled=0 \
	rpmfusion-free-updates.enabled=0 \
	rpmfusion-nonfree.enabled=0 \
	rpmfusion-nonfree-updates.enabled=0

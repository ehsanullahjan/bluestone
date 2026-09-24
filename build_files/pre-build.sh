#!/bin/bash

set -euxo pipefail

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)' rsync

# Install prereqs
dnf -y install rsync

# Copy custom configs
rsync -rvK /ctx/system_files/pre-build/ /

# Install terra repo with online gpgkey (instead of file://). This workaround for
# https://github.com/osbuild/bootc-image-builder/issues/1188 unblocks ISO builds.
# Once issuse #1188 is fixed, we can consider reverting this.
cat <<-'EOF' >/etc/yum.repos.d/terra.repo
	[terra]
	name=Terra $releasever
	#baseurl=https://repos.fyralabs.com/terra$releasever
	metalink=https://tetsudou.fyralabs.com/metalink?repo=terra$releasever&arch=$basearch
	metadata_expire=6h
	type=rpm
	gpgcheck=1
	gpgkey=https://raw.githubusercontent.com/terrapkg/packages/f$releasever/anda/terra/gpg-keys/RPM-GPG-KEY-terra$releasever
	repo_gpgcheck=1
	enabled=1
	enabled_metadata=1
	countme=1

	[terra-source]
	name=Terra $releasever - Source
	#baseurl=https://repos.fyralabs.com/terra$releasever-source
	metalink=https://tetsudou.fyralabs.com/metalink?repo=terra$releasever-source&arch=$basearch
	metadata_expire=6h
	type=rpm
	gpgcheck=1
	gpgkey=https://raw.githubusercontent.com/terrapkg/packages/f$releasever/anda/terra/gpg-keys/RPM-GPG-KEY-terra$releasever-source
	repo_gpgcheck=1
	enabled=0
	enabled_metadata=0
EOF
dnf config-manager setopt terra.enabled=0

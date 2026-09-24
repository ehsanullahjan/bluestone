#!/bin/bash

set -euxo pipefail

# Install terra-mesa repo with online gpgkey (instead of file://). This workaround
# for https://github.com/osbuild/bootc-image-builder/issues/1188 unblocks ISO builds.
# Once issuse #1188 is fixed, we can consider reverting this.
cat <<-'EOF' >/etc/yum.repos.d/terra-mesa.repo
	[terra-mesa]
	name=Terra $releasever (Mesa)
	#baseurl=https://repos.fyralabs.com/terra$releasever-mesa
	metalink=https://tetsudou.fyralabs.com/metalink?repo=terra$releasever-mesa&arch=$basearch
	metadata_expire=6h
	type=rpm
	gpgcheck=1
	gpgkey=https://raw.githubusercontent.com/terrapkg/packages/f$releasever/anda/terra/gpg-keys/RPM-GPG-KEY-terra$releasever-mesa
	repo_gpgcheck=1
	enabled=1
	enabled_metadata=1
	countme=1
	priority=80

	[terra-mesa-source]
	name=Terra $releasever (Mesa) - Source
	#baseurl=https://repos.fyralabs.com/terra$releasever-mesa-source
	metalink=https://tetsudou.fyralabs.com/metalink?repo=terra$releasever-mesa-source&arch=$basearch
	metadata_expire=6h
	type=rpm
	gpgcheck=1
	gpgkey=https://raw.githubusercontent.com/terrapkg/packages/f$releasever/anda/terra/gpg-keys/RPM-GPG-KEY-terra$releasever-mesa-source
	repo_gpgcheck=1
	enabled=0
	enabled_metadata=0
	priority=80
EOF
dnf config-manager setopt terra-mesa.enabled=0

dnf -y --enable-repo=terra-mesa install mesa-dri-drivers mesa-va-drivers mesa-vulkan-drivers

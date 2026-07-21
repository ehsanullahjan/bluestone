#!/bin/bash

set -euxo pipefail

cat <<-EOF >/etc/yum.repos.d/fury.repo
	[fury]
	name=Gemfury Private Repo
	baseurl=https://yum.fury.io/rsteube/
	enabled=1
	gpgcheck=0
EOF
dnf config-manager setopt fury.enabled=0

dnf -y --enable-repo=fury install carapace-bin

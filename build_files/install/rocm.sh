#!/bin/bash

set -euxo pipefail

dnf -y install \
	rocm-smi \
	rocminfo

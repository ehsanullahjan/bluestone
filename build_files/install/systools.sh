#!/bin/bash

set -euxo pipefail

dnf -y install borgbackup ddcutil pciutils lm_sensors lshw sysstat

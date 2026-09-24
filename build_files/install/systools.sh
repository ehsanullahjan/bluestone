#!/bin/bash

set -euxo pipefail

dnf -y install pciutils lm_sensors lshw sysstat

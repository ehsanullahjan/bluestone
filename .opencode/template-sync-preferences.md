# Template Sync Preferences

This file documents the preferences for keeping the ublue-os image template in sync while preserving customizations.

## Key Principles

1. **Always sync with upstream** unless explicitly marked as a customization
2. **Customizations take precedence** over upstream defaults
3. **Document all customizations** in this file so they can be preserved during future syncs

## Current Customizations (DO NOT OVERWRITE)

### Cron Schedule
- **File**: `.github/workflows/build.yml`
- **Value**: `05 10 * * 2` (every Tuesday at 10:05am UTC)
- **Reason**: This repo builds an atomic distro with the Cosmic desktop, and Tuesday is the preferred build day

### Disk Configuration Files
- **File**: `disk_config/iso-cosmic.toml`
- **Reason**: Custom ISO configuration for Cosmic desktop environment
- **References in Justfile**:
  - `build-iso` uses `disk_config/iso-cosmic.toml`
  - `rebuild-iso` uses `disk_config/iso-cosmic.toml`
  - `run-vm-iso` uses `disk_config/iso-cosmic.toml`

### Group Names
- **File**: `Justfile`
- **Custom group names** (not in upstream):
  - `[group('Build Virtual Machine Image')]` (upstream has "Virtal")
  - `[group('Run Virtual Machine')]` (upstream has "Virtal")
- **Reason**: Typo fix - "Virtual" not "Virtal"

### ISO Config References
All ISO-related recipes reference `disk_config/iso-cosmic.toml` instead of upstream's `disk_config/iso.toml`

## What to Sync (Standard Updates)

### GitHub Actions Workflow (`.github/workflows/build.yml`)
- ✅ Checkout action version (update to latest v7)
- ✅ Login action version (update to latest v4.5.x)
- ✅ Cosign installer version
- ✅ Cosign release version (currently `v3.1.2`)
- ✅ Signing command flags (`--new-bundle-format=false --use-signing-config=false`)
- ❌ Cron schedule (keep custom Tuesday schedule)
- ❌ Remove docker/metadata-action step (not needed, labels are in Justfile)

### Justfile Updates
- ✅ Shebangs: Use `#!/usr/bin/env bash` (not `#!/usr/bin/bash`)
- ✅ sudoif function: Use bare `sudo` (not `/usr/bin/sudo`)
- ✅ rechunk recipe: Update to upstream's CHUNKAH_CONFIG_FILE approach
- ✅ ostree-rechunk: Use local image (`localhost/${target_image}:${tag}`) instead of pulling from registry
- ✅ Group names: Update to match upstream ("Virtal" vs "Virtual") - but keep custom if preferred
- ✅ find commands: Use bare `find` (not `/usr/bin/find`)
- ✅ numfmt commands: Use bare `numfmt` (not `/usr/bin/numfmt`)
- ❌ ISO config paths: Keep referencing `disk_config/iso-cosmic.toml`

### Git Commit Messages for Syncs
When syncing with upstream, use a message like:
```
chore: sync with ublue-os/image-template upstream

Updated to latest upstream template while preserving Cosmic desktop customizations.
Customizations preserved:
- Cron schedule: every Tuesday (05 10 * * 2)
- ISO config: disk_config/iso-cosmic.toml
- Group names: Build Virtual Machine Image / Run Virtual Machine
```

## Reference Upstream Templates

- Workflow: https://raw.githubusercontent.com/ublue-os/image-template/main/.github/workflows/build.yml
- Justfile: https://raw.githubusercontent.com/ublue-os/image-template/main/Justfile

## Last Sync Date
2026-08-05

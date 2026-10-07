#!/bin/bash

set -euxo pipefail

EXCLUDED_PACKAGES=(
	toolbox
)
dnf -y remove "${EXCLUDED_PACKAGES[@]}"

INCLUDED_PACKAGES=(
	alacritty
	autofs
	bat
	carapace
	dbus-daemon
	distrobox
	dysk
	eza
	fastfetch
	fd-find
	fzf
	grc
	ripgrep
	starship
	tealdeer
	tmux
	trash-cli
	vim
	xdg-terminal-exec
	zoxide
	zsh
)
dnf -y --enable-repo terra install "${INCLUDED_PACKAGES[@]}"

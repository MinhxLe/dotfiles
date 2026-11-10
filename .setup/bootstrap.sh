#!/usr/bin/env bash
# Set up a machine after the base Arch install. Safe to re-run.
#   ~/.setup/bootstrap.sh server
# Installs packages/common.txt + packages/<machine>.txt, shell/tmux plugins,
# and enables that machine's services.
set -euo pipefail
here=$(dirname "$(readlink -f "$0")")
machine=${1:?usage: bootstrap.sh MACHINE  (one of: $(ls "$here/packages" | grep -v common | sed 's/\.txt//' | xargs))}
[ -f "$here/packages/$machine.txt" ] || { echo "no packages/$machine.txt" >&2; exit 1; }

step() { printf '\n==> %s\n' "$*"; }
pkgs() { sed 's/#.*//; s/\s//g; /^$/d' "$@"; }

step "Packages"
pkgs "$here/packages/common.txt" "$here/packages/$machine.txt" | sudo pacman -Syu --needed --noconfirm -

step "oh-my-zsh"
# clone directly: the official installer overwrites ~/.zshrc
[ -d ~/.oh-my-zsh ] || git clone -q --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

step "tmux plugins"
[ -d ~/.tmux/plugins/tpm ] || git clone -q --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins >/dev/null

step "Login shell"
[ "$(getent passwd "$USER" | cut -d: -f7)" = /usr/bin/zsh ] || sudo chsh -s /usr/bin/zsh "$USER"

case $machine in
  server)
    step "Services"
    sudo systemctl enable --now docker tailscaled
    id -nG "$USER" | grep -qw docker || { sudo usermod -aG docker "$USER"; echo "    added to docker group: log out and back in"; }
    tailscale status >/dev/null 2>&1 || echo "    tailscale not logged in: run 'sudo tailscale up'"
    ;;
esac

step "Done"

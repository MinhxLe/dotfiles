# Setup fzf: only ctrl-r (history search) for now
# ---------
# key-bindings.zsh location: homebrew (macOS / linuxbrew), debian/ubuntu, arch/fedora
for fzf_bindings in \
  "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/fzf/shell/key-bindings.zsh" \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/fzf/key-bindings.zsh \
  /usr/share/fzf/shell/key-bindings.zsh; do
  if [ -f "$fzf_bindings" ]; then
    source "$fzf_bindings"
    # restore zsh defaults for ctrl-t and alt-c
    bindkey -M emacs '^T' transpose-chars
    bindkey -M emacs '\ec' capitalize-word
    bindkey -r -M viins '^T' '\ec'
    bindkey -r -M vicmd '^T' '\ec'
    break
  fi
done
unset fzf_bindings

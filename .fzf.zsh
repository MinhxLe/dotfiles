# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion (disabled: only using ctrl-r for now)
# ---------------
# [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Only keep ctrl-r (history); restore zsh defaults for ctrl-t and alt-c
bindkey -M emacs '^T' transpose-chars
bindkey -M emacs '\ec' capitalize-word
bindkey -r -M viins '^T' '\ec'
bindkey -r -M vicmd '^T' '\ec'

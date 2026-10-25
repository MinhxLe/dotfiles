# homebrew (macOS: /opt/homebrew, linux: linuxbrew if installed)
if [ -z "$HOMEBREW_PREFIX" ]; then
  for brew_bin in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [ -x "$brew_bin" ] && eval "$("$brew_bin" shellenv)" && break
  done
  unset brew_bin
fi

# oh my zsh set up
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# plugins=(git)
source $ZSH/oh-my-zsh.sh

if command -v nvim &> /dev/null 
then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi


if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

if [ -f $HOME/.secrets ]; then
  source $HOME/.secrets
fi

# . "$HOME/.cargo/env"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

### Additional Programs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v fasd &> /dev/null
then
    eval "$(fasd --init auto)"
fi

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# NVM
# [[ -r "/usr/share/z/nvm/init-nvim.sh" ]] && source /usr/share/z/nvm/init-nvim.sh
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/scripts"

HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=$HISTSIZE
# . "$HOME/.cargo/env"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# macOS ships an old system ruby; prefer homebrew's
[ -d /opt/homebrew/opt/ruby/bin ] && export PATH="/opt/homebrew/opt/ruby/bin:$PATH"


# # Add to ~/.bashrc or ~/.zshrc on remote machines only
if [ -n "$SSH_CONNECTION" ]; then
   export TERM=xterm-256color
fi

# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519

export PATH=~/.npm-global/bin:$PATH
export TZ=America/Los_Angeles

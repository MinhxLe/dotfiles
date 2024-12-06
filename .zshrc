# oh my zsh set up
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
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


# homebrew
# export PATH="/opt/homebrew/bin:$PATH"


# . "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

### Additional Programs
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

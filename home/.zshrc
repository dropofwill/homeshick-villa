# Path to your oh-my-zsh installation.
export ZSH=/Users/wpaul/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# my prompt
# (master) [146] λ
PROMPT='$(git_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}λ%{$reset_color%} '
RPROMPT='$(basename $(git rev-parse --show-toplevel 2> /dev/null || pwd))'

export EDITOR='nvim'

bindkey -v
bindkey -M viins 'kj' vi-cmd-mode
bindkey "^R" history-incremental-search-backward

# Bootstrap homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source $HOME/Code/scripts/zfunctions.sh
source $HOME/Code/scripts/zalias.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

stty sane

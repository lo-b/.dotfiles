# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep

# Use vi -- insert mode (viins) keymap
bindkey -v

# Enable autocompletion
autoload -Uz compinit
compinit

# Load module below for vim menu keybinds to work.
zmodload zsh/complist

# Enable completion menu with vi momevement keys.
zstyle ':completion:*' menu select
# Compinit will sometimes not find new executables in the $PATH. To include
# these new executables enable automatical rehash.
zstyle ':completion:*' rehash true

# ENV variables
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg
export EDITOR='vim'

# Key bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Fish-like syntax highlighting using zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt
PS1='%~ %F{red}⟩%f%F{green}⟩%f%F{blue}⟩%f '


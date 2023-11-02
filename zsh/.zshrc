# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=( ~/.zfunc "${fpath[@]}" )

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

# terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# cog autocompletions
autoload -Uz _cog

# Load module below for vim menu keybinds to work.
zmodload zsh/complist

# Enable completion menu with vi momevement keys.
zstyle ':completion:*' menu select
# Compinit will sometimes not find new executables in the $PATH. To include
# these new executables enable automatical rehash.
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

export EDITOR='nvim'
# Use nvim as pager for manpage
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export VISUAL='nvim'

# Needs to be set by nvim-jdtsl
export JAVA_HOME='/usr/lib/jvm/default'
export _JAVA_AWT_WM_NONREPARENTING=1

# nnn 'config'
export NNN_PLUG='v:preview-tui;d:dragdrop'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1 # use trash-cli

# JDTLS exports
export JDTLS_HOME=/usr/share/java/jdtls/
export LOMBOK_JAR=/usr/lib/lombok-common/lombok.jar
export WORKSPACE=/home/bram/.jdtls-workspaces/ # Defaults to $HOME/workspace

# GPG export for GitHub signing
export GPG_TTY=$(tty)

# Key bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Fish-like syntax highlighting using zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# node version manager (nvm)
source /usr/share/nvm/init-nvm.sh

# glab (GitLab CLI) autocompletion
source <(glab completion -s zsh); compdef _glab glab

# dotnet env vars
export DOTNET_ROOT=$HOME/.dotnet

export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

source /home/bram/.zsh-completion/dotnet.completion

# azure CLI completion
source /opt/azure-cli/az.completion

# opt out of func telemetry 
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=true

# Aliases
alias nv='nvim'
alias dc='docker-compose'
alias syu='paru -Syu'
alias x='exa --icons'
alias tree="exa --icons -a -T -R -I '**/*workspace/\|**/*git'"
alias ap='ansible-playbook'
alias tf='terraform'

# powerlevel10k sourcing
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Autopair completion
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
autopair-init

# cd to nnn directory on quit
n() {
  # Block nesting of nnn in subshells
  if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
  # To cd on quit only on ^G, remove the "export" as in:
  #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  nnn -H "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" >/dev/null
  fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


neofetch neofetch --gtk3 on --disable resolution wm uptime memory --kitty images/wallpapers/groot-i-am-root.jpg --crop_mode fill --gpu_type dedicated --size 300 --colors 11 8 7 11 11 8 --xoffset 1 --yoffset 1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# ENV variables
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg
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
export NNN_TRASH=1  # use trash-cli

# Key bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Fish-like syntax highlighting using zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias nv='nvim'
alias dc='docker-compose'
alias syu='paru -Syyu'
alias x='exa --icons'
alias tree="exa --icons -a -T -R -I '**/*workspace/\|**/*git'"

# powerlevel10k sourcing
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Autopair completion
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
autopair-init

# Easily activate python envs
function activate-venv() {
  source "$HOME/.venvs/$(ls ~/.venvs/ | fzf)/bin/activate"
}

# cd to nnn directory on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
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
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

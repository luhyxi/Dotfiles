#
# ~/.bashrc
#
# Luaninha's best .bashrc
# 
#

# -----------------------------------------------------------------------------
# BASIC SETUP
# -----------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# -----------------------------------------------------------------------------

# Path settings
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin

# Default applications
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export PAGER=less
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export OMNISHARP=$HOME/.local/share/nvim/mason/packages/omnisharp/OmniSharp

# History settings
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups  
export HISTIGNORE="ls:cd:exit:clear:history"

# -----------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# File operations
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias renamefolder='mv -i'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Development
alias v='nvim'
alias n='nvim'
alias vim='nvim'
alias nconf='cd ~/.config/nvim'
alias sn='sudo nvim'
alias sv='sudo nvim'
alias xstart='n ~/.xinitrc'
alias dotnet='$HOME/.dotnet/dotnet'
alias z='zoxide'


# System
alias p='sudo pacman'
alias update='sudo pacman -Syu'
alias meminfo='free -m -l -t'
alias psg='ps aux | grep'

# Clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'

# Database
alias pgs='sudo -u postgres psql'

# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

# Yazi file manager with directory tracking
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Create a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract most known archives
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find text in files
ftext() {
  rg "$1" .
}

# Use bat instead of cat for printing files
catt() {
    bat --style="plain,rule,header" --paging=never --italic-text=always $@
}

# -----------------------------------------------------------------------------
# APPEARANCE
# -----------------------------------------------------------------------------

# Define default prompt if Starship isn't available
PS1='[\u@\h \W]\$ '

# Cute aesthetic stuff
if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune ]; then
  fortune | cowsay | lolcat
fi

# Initialize Starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

# -----------------------------------------------------------------------------
# TOOL INITIALIZATION
# -----------------------------------------------------------------------------

# Initialize Deno (fix for incomplete line in original file)
if [ -f "$HOME/.deno/bin/deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# NVM (Node Version Manager) if installed
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# -----------------------------------------------------------------------------
# LOCAL CONFIGURATIONS
# -----------------------------------------------------------------------------

# Source local configurations (if they exist)
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# zoxide
eval "$(zoxide init bash)"


#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

# Virtualenvwrapper stuff for mac
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# Pass-related aliases
alias pa=pass
alias pc="pass -c"

# Pull everything I need from my reps
alias gp="cd ~/dotfiles; git p; pc rep/bit; cd ~/org; git p; cd ~/latex-docs; git p; cd ~"

# Start emacs faster under Mac OS
alias em="open /Applications/Emacs.app"

# Mapping history auto complete to <C-r>
bindkey '^R' history-incremental-search-backward

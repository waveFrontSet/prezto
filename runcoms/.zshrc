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

# Starting gpg-agent
if [[ -n $GPG_AGENT_INFO ]]; then
    eval $(gpg-agent --daemon --allow-preset-passphrase)
fi

# Pass-related aliases
alias pa=pass
alias pc="pass -c"

# Start emacs faster under Mac OS
alias em="open /Applications/Emacs.app"

# Mapping history auto complete to <C-r>
bindkey '^R' history-incremental-search-backward

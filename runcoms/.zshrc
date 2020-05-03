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

# Pass-related aliases
alias pa=pass
alias pc="pass -c"

# Pull everything I need from my reps
alias gp="cd ~/dotfiles; git p; pc rep/bit; cd ~/org; git p; cd ~/latex-docs; git p; cd ~"

# Start emacs faster under Mac OS
alias em="open /Applications/Emacs.app"

# Mapping history auto complete to <C-r>
bindkey '^R' history-incremental-search-backward
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/paul/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/paul/anaconda/etc/profile.d/conda.sh" ]; then
        . "/Users/paul/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/paul/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(direnv hook zsh)"
show_virtual_env() {
  if [[ -n "$CONDA_DEFAULT_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $CONDA_DEFAULT_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

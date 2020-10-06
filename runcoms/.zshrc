# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Fuzzy-find and open file in vim
alias v="fasd -f -e vim"

# Mapping history auto complete to <C-r>
bindkey '^R' history-incremental-search-backward
# Remap acceptance of autosuggestion
bindkey '^ ' autosuggest-accept

eval "$(direnv hook zsh)"
show_virtual_env() {
  if [[ -n "$CONDA_DEFAULT_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $CONDA_DEFAULT_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/paul/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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


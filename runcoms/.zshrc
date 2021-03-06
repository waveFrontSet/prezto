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
# Check for M1 Arch
BREW_PREFIX="/usr/local"
if [[ $(uname -m) == "arm64" ]]; then
    BREW_PREFIX="/opt/homebrew"
fi

source ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(${BREW_PREFIX}/share/zsh-completions $fpath)

# Pass-related aliases
alias pa=pass
alias pc="pass -c"

# Pull everything I need from my reps
alias gp="cd ~/dotfiles; git p; pc rep/bit; cd ~/org; git p; cd ~/latex-docs; git p; cd ~"

# Start emacs faster under Mac OS
alias em="open /Applications/Emacs.app"

# Fuzzy-find and open file in vim
alias v="fasd -f -t -e vim -b viminfo"

# Jump to folder
alias j="fasd_cd"

# On M1 provide fallback alternative ibrew
alias brew=${BREW_PREFIX}/bin/brew
alias ibrew=arch -x86_64 /usr/local/bin/brew

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


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Created by `userpath` on 2021-01-01 12:17:58
export PATH="$PATH:/Users/paul/.local/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/Library/TeX/texbin/"
[ -f "/Users/paul/.ghcup/env" ] && source "/Users/paul/.ghcup/env" # ghcup-env

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cooper/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-autosuggestions
zinit load zdharma-continuum/fast-syntax-highlighting
#zinit ice depth=1; zinit light romkatv/powerlevel10k
#zinit load marlonrichert/zsh-autocomplete
bindkey '^\t' autosuggest-accept
bindkey '^R' history-incremental-search-backward

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

set ksharrays

export EDITOR="nvim"
export MANPAGER='nvim +Man!'
export PAGER="less"

export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

fuzzy_edit() {
    input=$(fzf --preview="cat {}")
    [ -n "$input" ] && nvim $input
}

alias beats='bluetoothctl connect B8:21:1C:91:9D:51'

alias 'll=eza -lh --icons --total-size --git'
alias 'ls=eza -lh --icons --git'
alias 'la=eza -lha --icons --git'
alias 'l=eza --icons'
alias 'v=fuzzy_edit'
# alias 'nvim=vim .'
alias 'glg=git lg | head'

nvim() {
    if [ -z "$1" ]; then
        command nvim .
    else
        command nvim $1
    fi
}

mkcd(){mkdir -p $1 && cd $1}
killapp(){kill $(pidof "$1")}
export VISUAL=nvim

eval "$(zoxide init zsh --cmd cd)"
eval "$(thefuck --alias wut)"
eval "$(starship init zsh)"
#export XDG_RUNTIME_DIR=/run/user/1000
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ffffff,bg:#161616,hl:#08bdba --color=fg+:#f2f4f8,bg+:#262626,hl+:#3ddbd9 --color=info:#78a9ff,prompt:#33b1ff,pointer:#42be65 --color=marker:#ee5396,spinner:#ff7eb6,header:#be95ff'

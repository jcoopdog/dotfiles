source -- ~/.local/share/blesh/ble.sh


bleopt complete_auto_complete=
bleopt complete_menu_complete=
bleopt complete_auto_history=
bleopt complete_auto_complete_opts=suppress-after-complete
#
set -o vi

shopt -s cdspell
shopt -s checkwinsize
shopt -s globstar
shopt -s dotglob
shopt -s nullglob
# shopt -s extendedglob

export EDITOR="nvim"
export PAGER="less"

# Support colors in less
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


alias 'stow=stow -vt ~'
alias 'll=eza -lh --icons --total-size --git'
alias 'la=eza -lhA --icons --git'
alias 'ls=eza -lh --icons --git'
alias 'l=eza --icons'
mkcd() {
    mkdir -p $1 && cd $1
}
killapp() {
    kill $(pidof "$1")
}

eval "$(thefuck --alias wut)"
eval "$(starship init bash)"

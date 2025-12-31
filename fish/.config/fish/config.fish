if status is-interactive
    # Commands to run in interactive sessions can go here

    set fish_greeting ""

    set -g fish_key_bindings fish_vi_key_bindings
    set -x SHELL /usr/bin/fish
    set -x EDITOR nvim
    set -x MANPAGER "nvim +Man!"

    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external line

    alias cls "clear && ls"
    alias ls "eza -lh --icons --git --group-directories-first"
    alias lf "eza -lh --icons --git --group-directories-first --total-size"
    alias la "eza -lha --icons --git --group-directories-first"
    alias l "eza --icons --git --group-directories-first"

    alias rg "rg --hyperlink-format=kitty"

    alias sudo "doas"
    alias reboot "doas /sbin/reboot"

    alias nivm "nvim"

    alias please="doas (string split ' ' (history --max 1))"

    function mkcd
        mkdir -p $argv[1] && cd $argv[1]
    end

    function emerge-search
        emerge --color=y --search $argv[1] | less -R
    end
    function emerge-searchdesc
        emerge --color=y --searchdesc $argv[1] | less -R
    end

    zoxide init fish --cmd cd | source
    starship init fish | source
end

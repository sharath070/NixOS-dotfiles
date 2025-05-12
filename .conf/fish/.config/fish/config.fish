if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="lsd"
alias la="lsd -la"
alias ll="lsd -l"

bind \cw forward-word
bind \cb backward-word
bind \ca forward-char

set -g fish_greeting ""

starship init fish | source

nerdfetch

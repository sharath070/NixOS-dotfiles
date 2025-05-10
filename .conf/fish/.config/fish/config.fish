
if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="lsd"
alias la="lsd -la"
alias ll="lsd -l"

set -g fish_greeting ""

starship init fish | source

nerdfetch

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/config.fish

# starship config
starship init fish | source

# set the workspace path
set -x GOPATH $HOME/go

# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# direnv config
direnv hook fish | source
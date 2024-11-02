if status is-interactive
    # Commands to run in interactive sessions can go here
end

# `ls` → `ls -lAGuw` abbreviation
abbr -a -g ls ls -lAGuw

function gce -d "Git commit with optional message and push"
    set message (string join " " $argv)
    git commit -a --allow-empty-message -m "$message"
    git push
end

# A way to reload the shell à la "zsh"
function fish
    source ~/.config/fish/config.fish
end



# Disable the fish greeting message
set fish_greeting ""

# Set PATH, MANPATH, etc., for Homebrew.
# Check if this is MacOS

if test (uname) = Darwin
    # Check where Brew is installed on the system.
    # Some systems it is /opt/homebrew, some it is ~/homebrew
    # set local variable BREW_HOME to the correct path
    set BREW_HOME /opt/homebrew
    if test -O ~/homebrew/bin/brew
        set BREW_HOME $(dirname ~/homebrew/bin/brew)
    end

    eval "$($BREW_HOME/brew shellenv)"


    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
        eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" hook $argv | source
    else
        if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
            . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
        else
            set -x PATH /opt/homebrew/Caskroom/miniforge/base/bin $PATH
        end
    end

    ## LLVM Flags
    set -gx LDFLAGS -L$BREW_HOME/opt/llvm/lib
    set -gx CPPFLAGS -L$BREW_HOME/opt/llvm/include

    ## To use the bundled libunwind please use the following LDFLAGS:
    # LDFLAGS="-L$BREW_HOME/opt/llvm/lib/unwind -lunwind"
    #     To use the bundled libc++ please use the following LDFLAGS:
    #   LDFLAGS="-L$BREW_HOME/opt/llvm/lib/c++ -L$BREW_HOME/opt/llvm/lib/unwind -lunwind"

    # fish_add_path 

    # set -gx LDFLAGS "$LDFLAGS -L/opt/homebrew/opt/zlib/lib"
    # set -gx CPPFLAGS "$CPPFLAGS -I/opt/homebrew/opt/zlib/include"
    # fish_add_path /Users/virancheel/.modular/bin
else if test (uname) = Linux
    # fish_add_path /usr/local/cuda-12.6/bin
    # sudo apt-get install -y nvidia-open
    echo "This is Linux"
end

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
    eval "$(/opt/homebrew/bin/brew shellenv)"

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


    set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -gx LDFLAGS "$LDFLAGS -L/opt/homebrew/opt/zlib/lib"

    set -gx CPPFLAGS -L/opt/homebrew/opt/llvm/include
    set -gx CPPFLAGS "$CPPFLAGS -I/opt/homebrew/opt/zlib/include"
else if test (uname) = Linux
    # fish_add_path /usr/local/cuda-12.6/bin
    # sudo apt-get install -y nvidia-open
    echo "This is Linux"
end

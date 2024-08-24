# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish

function fish_prompt
    set_color green
    echo -n (whoami) 
    set_color white
    echo -n "@victus "
    set_color blue
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' >> '
end

# Notifications when a command is done
# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Replace ls with eza
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing

# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'

function hexdec
    printf "%d\n" "0x$argv"
end

function dechex
    printf "%x\n" "$argv"
end

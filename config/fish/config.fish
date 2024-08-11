## Set values
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

# Basically prettier commands
alias dir 'dir --color=auto'
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias ip 'ip -color'
alias vdir 'vdir --color=auto'

# Custom commands (some commands that I use for my own stuff dont worry hehe)
alias setrandmac 'sudo ip link set wlp4s0 down && sudo macchanger -m (python3 ~/Documents/python_scripts/rand_mac.py) wlp4s0 && sudo ip link set wlp4s0 up' # set a random MAC address to wlp4s0 interface (for bypassing mac filter)
alias setrandmacmon 'sudo ip link set wlp4s0mon down && sudo macchanger -m (python3 ~/Documents/python_scripts/rand_mac.py) wlp4s0mon && sudo ip link set wlp4s0mon up' # set a random MAC address to wlp4s0mon interface. This is a variant for the wlp4s0mon interface.
alias randmac 'python3 ~/Documents/python_scripts/rand_mac.py' # generate a random MAC address
alias clai 'shred -u -n 3 -z ~/.ollama/history' # clear ai chat history
alias clcb 'shred -u -n 3 -z ~/.cache/cliphist/db' # clear clipboard history
alias clfish 'shred -u -n 3 -z ~/.local/share/fish_history' # clear fish history

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

function hexdec
    printf "%d\n" "0x$argv"
end

function dechex
    printf "%x\n" "$argv"
end

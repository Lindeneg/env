PS1='\[\033]0;Git | Bash v\v | \W\007\]' # set window title
PS1="$PS1"'\n'                           # new line
#PS1="$PS1"'\e[0;37m\A '                  # white text: current time
PS1="$PS1"'\e[1;32m\u@\h'                # green text: user@host
PS1="$PS1"'\e[0;36m \W'                  # cyan  text: CWD
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\e[0;35m'         # purple text: git branch
        PS1="$PS1"'`__git_ps1`'
    fi
fi
PS1="$PS1"'\[\033[0m\]' # reset color
PS1="$PS1"'\n$ '

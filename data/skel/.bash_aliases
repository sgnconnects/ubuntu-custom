#!/usr/bin/env bash
# shellcheck disable=SC2034

# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------
PROMPT_COMMAND=_prompt_command
_prompt_command() {
    local LAST_EXIT_CODE=$?
    local GIT_BRANCH
    local GIT_STATUS
    local GIT_STATUS_CHAR
    local OTHER_INFORMATION=false

    # Color definitions
    local COLOR_BACKGROUND_BLACK_LIGHT="\[\033[0;100m\]"
    local COLOR_BACKGROUND_BLACK="\[\033[40m\]"
    local COLOR_BACKGROUND_BLUE_LIGHT="\[\033[0;104m\]"
    local COLOR_BACKGROUND_BLUE="\[\033[44m\]"
    local COLOR_BACKGROUND_CYAN_LIGHT="\[\033[0;106m\]"
    local COLOR_BACKGROUND_CYAN="\[\033[46m\]"
    local COLOR_BACKGROUND_GREEN_LIGHT="\[\033[0;102m\]"
    local COLOR_BACKGROUND_GREEN="\[\033[42m\]"
    local COLOR_BACKGROUND_PURPLE_LIGHT="\[\033[10;95m\]"
    local COLOR_BACKGROUND_PURPLE="\[\033[45m\]"
    local COLOR_BACKGROUND_RED_LIGHT="\[\033[0;101m\]"
    local COLOR_BACKGROUND_RED="\[\033[41m\]"
    local COLOR_BACKGROUND_WHITE_LIGHT="\[\033[0;107m\]"
    local COLOR_BACKGROUND_WHITE="\[\033[47m\]"
    local COLOR_BACKGROUND_YELLOW_LIGHT="\[\033[0;103m\]"
    local COLOR_BACKGROUND_YELLOW="\[\033[43m\]"
    local COLOR_BOLD_BLACK_LIGHT="\[\033[1;90m\]"
    local COLOR_BOLD_BLACK="\[\033[1;30m\]"
    local COLOR_BOLD_BLUE_LIGHT="\[\033[1;94m\]"
    local COLOR_BOLD_BLUE="\[\033[1;34m\]"
    local COLOR_BOLD_CYAN_LIGHT="\[\033[1;96m\]"
    local COLOR_BOLD_CYAN="\[\033[1;36m\]"
    local COLOR_BOLD_GREEN_LIGHT="\[\033[1;92m\]"
    local COLOR_BOLD_GREEN="\[\033[1;32m\]"
    local COLOR_BOLD_PURPLE_LIGHT="\[\033[1;95m\]"
    local COLOR_BOLD_PURPLE="\[\033[1;35m\]"
    local COLOR_BOLD_RED_LIGHT="\[\033[1;91m\]"
    local COLOR_BOLD_RED="\[\033[1;31m\]"
    local COLOR_BOLD_WHITE_LIGHT="\[\033[1;97m\]"
    local COLOR_BOLD_WHITE="\[\033[1;37m\]"
    local COLOR_BOLD_YELLOW_LIGHT="\[\033[1;93m\]"
    local COLOR_BOLD_YELLOW="\[\033[1;33m\]"
    local COLOR_REGULAR_BLACK_LIGHT="\[\033[0;90m\]"
    local COLOR_REGULAR_BLACK="\[\033[0;30m\]"
    local COLOR_REGULAR_BLUE_LIGHT="\[\033[0;94m\]"
    local COLOR_REGULAR_BLUE="\[\033[0;34m\]"
    local COLOR_REGULAR_CYAN_LIGHT="\[\033[0;96m\]"
    local COLOR_REGULAR_CYAN="\[\033[0;36m\]"
    local COLOR_REGULAR_GREEN_LIGHT="\[\033[0;92m\]"
    local COLOR_REGULAR_GREEN="\[\033[0;32m\]"
    local COLOR_REGULAR_PURPLE_LIGHT="\[\033[0;95m\]"
    local COLOR_REGULAR_PURPLE="\[\033[0;35m\]"
    local COLOR_REGULAR_RED_LIGHT="\[\033[0;91m\]"
    local COLOR_REGULAR_RED="\[\033[0;31m\]"
    local COLOR_REGULAR_WHITE_LIGHT="\[\033[0;97m\]"
    local COLOR_REGULAR_WHITE="\[\033[0;37m\]"
    local COLOR_REGULAR_YELLOW_LIGHT="\[\033[0;93m\]"
    local COLOR_REGULAR_YELLOW="\[\033[0;33m\]"
    local COLOR_RESET="\[\033[0m\]"

    # Variables you might want for your PS1 prompt instead
    local BASH_DATE="\d"            # The date  in  "Weekday  Month  Date"  format
    local BASH_HOSTNAME_SIMPLE="\h" # The hostname up to the first '.'
    local BASH_HOSTNAME="\H"        # The hostname
    local BASH_JOBS="\j"            # The number of jobs currently managed by the shell
    local BASH_NEW_LINE="\n"        # Newline
    local BASH_PATH_BASENAME="\W"   # The  basename  of the current working directory
    local BASH_PATH_DIR="\w"        # The current working directory
    local BASH_SHELL_BASENAME="\l"  # The basename of the shell's terminal  device name
    local BASH_SHELL_NAME="\s"      # The name  of  the shell, the basename of $0
    local BASH_TIME12A="\@"         # The current time in 12-hour am/pm format
    local BASH_TIME12H="\T"         # The current time in 12-hour HH:MM:SS format
    local BASH_TIME24H="\t"         # The current time in 24-hour HH:MM:SS format
    local BASH_USER="\u"            # The username of the current user

    PS1=""

    # PS1: Time information
    PS1+=$COLOR_BACKGROUND_BLACK_LIGHT
    PS1+=" $BASH_TIME24H "

    # PS1: Last exit code information
    PS1+=$COLOR_BOLD_WHITE_LIGHT
    if [[ $LAST_EXIT_CODE != 0 ]]; then
        PS1+=$COLOR_BACKGROUND_RED
    else
        PS1+=$COLOR_BACKGROUND_GREEN
    fi
    PS1+=" $LAST_EXIT_CODE "

    # PS1: User and hostname information
    PS1+=$COLOR_BACKGROUND_BLUE
    PS1+=" $BASH_USER@$BASH_HOSTNAME_SIMPLE "

    # PS1: Directory information
    PS1+=$COLOR_BACKGROUND_CYAN
    PS1+=" $BASH_PATH_BASENAME "

    # PS1: "Other information" such as: git, conda, etc.

    # PS1: Git information
    if hash git &>/dev/null && [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]; then
        OTHER_INFORMATION=true
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=" git("

        GIT_STATUS_CHAR=""
        GIT_STATUS=$(git status)
        GIT_BRANCH=$(git symbolic-ref HEAD | sed -e "s|refs/heads/||")

        if echo "$GIT_STATUS" | grep --quiet "Your branch is ahead"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_CYAN
            GIT_STATUS_CHAR+="^"
        fi

        if echo "$GIT_STATUS" | grep --quiet "Your branch is behind"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_CYAN
            GIT_STATUS_CHAR+="v"
        fi

        if echo "$GIT_STATUS" | grep --quiet "have diverged"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_CYAN
            GIT_STATUS_CHAR+="!"
        fi

        if echo "$GIT_STATUS" | grep --quiet "Changes to be committed"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_GREEN
            GIT_STATUS_CHAR+="*"
        fi

        if echo "$GIT_STATUS" | grep --quiet "Changes not staged for commit"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_RED
            GIT_STATUS_CHAR+="*"
        fi

        if echo "$GIT_STATUS" | grep --quiet "You have unmerged"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_RED
            GIT_STATUS_CHAR+="x"
        fi

        if echo "$GIT_STATUS" | grep --quiet "Untracked files"; then
            GIT_STATUS_CHAR+=$COLOR_BOLD_RED
            GIT_STATUS_CHAR+="+"
        fi

        # Branch name
        if echo "$GIT_STATUS" | grep --quiet "git rebase"; then
            GIT_BRANCH="rebasing"
        fi

        # Build GIT status
        if [[ -n "$GIT_STATUS_CHAR" ]]; then
            PS1+=$COLOR_BOLD_YELLOW_LIGHT
            PS1+=$GIT_BRANCH
            PS1+=" "
            PS1+=$GIT_STATUS_CHAR
        else
            PS1+=$COLOR_BOLD_GREEN
            PS1+=$GIT_BRANCH
        fi
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=")"
    fi

    # PS1: Conda environment information
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        OTHER_INFORMATION=true
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=" conda("
        PS1+=$COLOR_BOLD_GREEN
        PS1+=$CONDA_DEFAULT_ENV
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=")"
    fi

    # PS1: Python virtual environment information
    if [[ -n "$VIRTUAL_ENV" ]]; then
        OTHER_INFORMATION=true
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=" venv("
        PS1+=$COLOR_BOLD_GREEN
        PS1+=$(basename "$VIRTUAL_ENV")
        PS1+=$COLOR_REGULAR_WHITE_LIGHT
        PS1+=$COLOR_BACKGROUND_BLACK
        PS1+=")"
    fi

    if $OTHER_INFORMATION; then
        PS1+=" "
    fi

    PS1+=$COLOR_RESET
    PS1+=$BASH_NEW_LINE
    PS1+="$ "
}

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
_extract_file() {
    local FILE=$1

    # Extract the archive according the file extension
    case $FILE in
    *.tar.bz2 | *.tbz2 | *.tz2) tar --extract --bzip2 --file="$FILE" ;;
    *.tar.gz | *.taz | *.tgz) tar --extract --gzip --file="$FILE" ;;
    *.tar.lz | *.tlz) tar --extract --lzip --file="$FILE" ;;
    *.tar.lzma | *.tlzma) tar --extract --lzma --file="$FILE" ;;
    *.tar.lzo | *.tlzo) tar --extract --lzop --file="$FILE" ;;
    *.tar.xz | *.txz) tar --extract --xz --file="$FILE" ;;
    *.tar.Z | *.taZ) tar --extract --gzip --file="$FILE" ;;
    *.tar.zst | *.tzst) tar --extract --zstd --file="$FILE" ;;
    *.7z) 7z x -aoa "$FILE" ;;
    *.bz2) bunzip2 "$FILE" ;;
    *.deb) ar x "$FILE" ;;
    *.gz) gunzip "$FILE" ;;
    *.lzma) unlzma "$FILE" ;;
    *.rar) unrar x -ad "$FILE" ;;
    *.tar) tar --extract --file="$FILE" ;;
    *.xz) unxz "$FILE" ;;
    *.Z) uncompress "$FILE" ;;
    *.zip) unzip "$FILE" ;;
    *.zst) zstd --decompress "$FILE" ;;
    *) 7z x -aoa "$FILE" ;;
    esac
}

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
alias ,compress_tgz_current_dir='rm -f "$(pwd | sed "s#.*/##").tar.gz" && tar -czf "$(pwd | sed "s#.*/##").tar.gz" --exclude={".","..",".*/"} * .*'
alias ,compress_zip_current_dir='rm -f "$(pwd | sed "s#.*/##").zip" && zip --recurse-paths "$(pwd | sed "s#.*/##").zip" --exclude={"..*",".*/"} * .*'
alias ,extract_file='_extract_file'

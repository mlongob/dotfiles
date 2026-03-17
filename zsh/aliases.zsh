# ls aliases — use eza if available
if command -v eza &>/dev/null; then
    alias ls='eza --group-directories-first'
    alias ll='eza -lah --group-directories-first --git'
    alias la='eza -a --group-directories-first'
    alias l='eza --group-directories-first'
    alias lt='eza --tree --level=2'
    alias lta='eza --tree --level=2 -a'
else
    alias ls='ls --color'
    alias ll='ls -lah'
    alias la='ls -A'
    alias l='ls'
fi

# bat — better cat
if command -v bat &>/dev/null; then
    alias cat='bat --paging=never'
fi

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gag='git exec ag'

# Update dotfiles
function dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
function mcd() {
    mkdir -p "${1}" && cd "${1}"
}

# Jump to directory containing file
function jump() {
    cd "$(dirname ${1})"
}

# Go up [n] directories
function up() {
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# Docker compose
alias doco="docker-compose"

# lazygit
if command -v lazygit &>/dev/null; then
    alias lg='lazygit'
fi

# Allow sudo to expand aliases
alias sudo='sudo '

# macOS utilities
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'
alias afk='osascript -e "tell application \"System Events\" to keystroke \"q\" using {command down, control down}"'
alias cleanup='find . -type f -name ".DS_Store" -delete && echo "Cleaned .DS_Store files"'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles false && killall Finder'

# Print each PATH entry on its own line
alias path='echo -e ${PATH//:/\\n}'

# Quick local HTTP server (opens browser automatically)
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/" && python3 -m http.server "${port}"
}

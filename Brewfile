# Brewfile — declarative Homebrew dependencies
# Install everything with: brew bundle

# ─── Shell ───────────────────────────────────────────────────────────────────
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "starship"          # cross-shell prompt
brew "zoxide"            # smarter cd
brew "direnv"            # per-project env vars

# ─── Terminal ────────────────────────────────────────────────────────────────
brew "tmux"
cask "ghostty"

# ─── CLI essentials ──────────────────────────────────────────────────────────
brew "fzf"               # fuzzy finder
brew "gh"                # GitHub CLI
brew "glab"              # GitLab CLI
brew "git"               # newer than macOS system git
brew "git-delta"         # better git diffs
brew "lazygit"           # terminal UI for git
brew "gnupg"             # GPG for commit signing
brew "ripgrep"           # fast grep (rg)
brew "fd"                # fast find
brew "bat"               # better cat
brew "eza"               # better ls
brew "htop"              # process viewer
brew "tree"              # directory tree
brew "wget"              # file downloader
brew "jq"                # JSON processor
brew "tldr"              # practical command examples
brew "ncdu"              # interactive disk usage
brew "mkcert"            # local HTTPS certs
brew "coreutils"         # GNU coreutils (replaces BSD versions)
brew "mas"               # Mac App Store CLI
brew "atuin"             # better shell history (searchable, synced, SQLite-backed)
brew "yazi"              # terminal file manager with vim keybindings
brew "lazydocker"        # terminal UI for Docker
brew "btop"              # better htop (prettier system monitor)
brew "trash-cli"         # move files to macOS Trash instead of rm
brew "glow"              # terminal markdown renderer
brew "difftastic"        # structural/AST-aware diffs
brew "tokei"             # fast code statistics / line counter
brew "bandwhich"         # bandwidth usage per process
brew "hyperfine"         # CLI benchmarking tool
brew "chezmoi"           # dotfiles manager

# ─── Development ─────────────────────────────────────────────────────────────
brew "python@3.14"
brew "mise"              # runtime version manager (node, python, go, etc.)
brew "cmake"             # build system generator
brew "ninja"             # fast build system
brew "clang-format"      # C/C++ code formatter
brew "cookiecutter"      # project templates
brew "pandoc"            # document converter
brew "kcat"              # Kafka CLI consumer/producer
brew "netcat"            # TCP/UDP networking utility

# ─── Java / JVM ──────────────────────────────────────────────────────────────
cask "temurin@8"         # Eclipse Temurin JDK 8 (Intel/Rosetta) — legacy Java tooling

# ─── Fonts ───────────────────────────────────────────────────────────────────
cask "font-fira-code-nerd-font"
cask "font-symbols-only-nerd-font"

# ─── AI / ML ─────────────────────────────────────────────────────────────────
cask "ollama-app"        # local LLM inference (renamed upstream from "ollama"; includes precompiled Metal library)
cask "lm-studio"         # GUI for local LLM experimentation

# ─── Editors ─────────────────────────────────────────────────────────────────
cask "visual-studio-code"
cask "zed"               # fast Rust-native editor with first-class vim mode

# ─── GUI Apps ────────────────────────────────────────────────────────────────
cask "raycast"           # Spotlight replacement + productivity launcher
cask "rectangle"         # Window manager
cask "docker-desktop"    # Docker Desktop (renamed upstream from "docker") — requires: sudo mkdir -p /usr/local/cli-plugins
cask "gimp"              # raster image editor

# ─── CTF / Security ────────────────────────────────────────────────────────
cask "wireshark-app"     # network protocol analyzer (renamed upstream from "wireshark"; system-path pkg needs sudo: brew install --cask wireshark-app)
# Ghidra: download manually from https://ghidra-sre.org/ (not in Homebrew)
brew "nmap"              # network scanner
brew "john-jumbo"        # John the Ripper password cracker
brew "hashcat"           # GPU-accelerated password cracker
brew "binwalk"           # firmware/binary analysis & extraction
brew "radare2"           # reverse engineering framework (CLI)
brew "pwntools"          # CTF exploit development library (Python)
brew "gobuster"          # directory/DNS brute-forcer
brew "sqlmap"            # SQL injection automation
brew "hydra"             # network login brute-forcer
brew "aircrack-ng"       # wireless security tools
brew "exiftool"          # image/file metadata reader (stego challenges)
brew "foremost"          # file carving / recovery
brew "hexedit"           # hex editor
brew "socat"             # advanced netcat (relay, proxy, etc.)
brew "gdb"               # GNU debugger
brew "upx"               # binary packer/unpacker

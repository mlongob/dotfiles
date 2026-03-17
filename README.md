# dotfiles

Mario Longobardi's personal development environment — macOS, zsh, tmux, vim, and friends.

## Stack

| Tool | Purpose |
|------|---------|
| [Ghostty](https://ghostty.org) | Terminal emulator |
| [zsh](https://zsh.org) + [oh-my-zsh](https://ohmyz.sh) | Shell |
| [Starship](https://starship.rs) | Prompt (Catppuccin Powerline preset) |
| [tmux](https://github.com/tmux/tmux) + [catppuccin/tmux](https://github.com/catppuccin/tmux) | Terminal multiplexer |
| [vim](https://www.vim.org) + [vim-plug](https://github.com/junegunn/vim-plug) | Editor |
| [Dotbot](https://github.com/anishathalye/dotbot) | Dotfile installation |
| [TPM](https://github.com/tmux-plugins/tpm) | tmux plugin manager |
| [Homebrew](https://brew.sh) + Brewfile | Package management |
| [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) | Theme (everywhere) |

## Setup

```bash
# 1. Install Xcode Command Line Tools
xcode-select --install

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Set up GitHub SSH auth
brew install gh && gh auth login

# 4. Clone and install
gh repo clone mlongob/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install
```

The install script will:
- Symlink all dotfiles to `$HOME`
- Install all Homebrew packages, casks, and fonts via `Brewfile`
- Install vim-plug and vim plugins
- Install tmux plugins via TPM
- Apply sensible macOS system defaults

## Structure

```
~/.dotfiles/
├── Brewfile                    # All Homebrew dependencies
├── install                     # Bootstrap entry point
├── install.conf.yaml           # Dotbot configuration
├── bin/                        # Personal scripts (on $PATH)
├── config/
│   ├── ghostty/config          # Ghostty terminal config
│   └── starship/starship.toml  # Starship prompt config
├── macos/
│   └── defaults.sh             # macOS system preferences
├── tmux.conf                   # tmux config + catppuccin theme
├── vim/                        # vim runtime directory
├── vimrc                       # vim config (vim-plug)
├── zsh/
│   ├── aliases.zsh             # Aliases and functions
│   ├── plugins.zsh             # oh-my-zsh + external plugins
│   └── settings.zsh            # zsh settings and keybindings
├── zprofile                    # Login shell config (PATH)
├── zshrc                       # Interactive shell entry point
└── gitconfig                   # Git configuration and aliases
```

## Local Customizations

Personal or machine-specific settings that shouldn't be version-controlled go in local override files:

| File | Purpose |
|------|---------|
| `~/.zshrc_local_before` | Sourced before dotfiles zsh config |
| `~/.zshrc_local_after` | Sourced after dotfiles zsh config |
| `~/.gitconfig_local` | Git identity, work-specific config |
| `~/.vimrc_local` | Machine-specific vim settings |
| `~/.tmux_local.conf` | Machine-specific tmux settings |

Example `~/.gitconfig_local`:
```ini
[user]
    name = Mario Longobardi
    email = mario@work.com

[url "git@github.work.com:"]
    insteadOf = https://github.work.com/
```

## Updating

```bash
dfu   # Pull latest and re-run install
```

## License

MIT © Mario Longobardi

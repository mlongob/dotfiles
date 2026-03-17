# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Install / Update

```bash
./install          # Full install: symlinks, Homebrew, vim plugins, tmux plugins, macOS defaults, VS Code extensions
dfu                # Pull latest from git and re-run install
```

`install` is idempotent and safe to re-run. It uses Dotbot (`install.conf.yaml`) to orchestrate everything.

## Architecture

**Dotbot** (`install.conf.yaml`) is the single source of truth for what gets symlinked and what shell commands run during setup. Adding a new config file means: (1) place it under `~/.dotfiles/`, (2) add a symlink entry to `install.conf.yaml`.

**Shell startup chain:**
- `zprofile` → sets PATH (login shells)
- `zshrc` → sources `zsh/plugins.zsh`, `zsh/settings.zsh`, `zsh/aliases.zsh`, then initializes starship, homebrew, VS Code PATH
- Local overrides: `~/.zshrc_local_before` (before) and `~/.zshrc_local_after` (after) for machine-specific settings that shouldn't be committed

**Theme:** Catppuccin Mocha throughout — Ghostty palette, starship preset, tmux plugin, vim colorscheme, VS Code extension, git-delta syntax theme. When adding new tools, prefer their Catppuccin Mocha integration.

**Key config locations:**
- `config/vscode/settings.json` → symlinked to `~/Library/Application Support/Code/User/settings.json`
- `config/vscode/extensions.txt` → declarative extension list (comments with `#`, one extension ID per line)
- `config/starship/starship.toml` → symlinked to `~/.config/starship.toml` (not `~/.config/starship/starship.toml`)
- `config/ghostty/config` → symlinked to `~/.config/ghostty/config`

**Local customization files** (not committed, for machine/work-specific config):
- `~/.zshrc_local_before` / `~/.zshrc_local_after`
- `~/.gitconfig_local` (included via `[include]` in `gitconfig`)
- `~/.vimrc_local` / `~/.tmux_local.conf`

**Plugin managers:**
- vim: vim-plug (`~/.vim/autoload/plug.vim`), plugins defined in `vimrc`
- tmux: TPM (`~/.tmux/plugins/tpm`), plugins defined in `tmux.conf`; catppuccin plugin path is `~/.tmux/plugins/tmux/catppuccin.tmux`
- zsh: oh-my-zsh for built-in plugins; external plugins (autosuggestions, syntax-highlighting) installed via Homebrew and sourced directly in `zsh/plugins.zsh`
- VS Code: extension list in `config/vscode/extensions.txt`, installed by dotbot shell step

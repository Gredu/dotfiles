# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for a keyboard-driven desktop. There is no application code, build, or
test suite — every tracked file is a configuration file that runs on the live machine.

These configs are deployed across three machines the owner currently uses (more may be
added over time):

- **This computer** — Arch Linux (primary target)
- **Work laptop** — Fedora Linux
- **Personal MacBook Pro** — macOS (secondary target)

When adding or changing a config that could behave differently across these machines,
call it out and remind the owner which machine(s) it might break on — don't assume the
current machine is the only target. Common divergence points: package/binary names
(pacman vs. dnf vs. Homebrew), paths, systemd vs. launchd, GNU vs. BSD coreutils flags,
Wayland vs. X11, font availability, and the `uname` branch in the shell config.

## Layout and deployment

- Configs are split into stow-style packages at the repo top level, each mirroring `$HOME`:
  - `root/` — shared by every machine (`root/.zshrc` → `~/.zshrc`,
    `root/.config/nvim/` → `~/.config/nvim/`, etc.).
  - `root-mac/` — macOS-only files (e.g. `root-mac/Library/LaunchAgents/`). Never put
    macOS-only paths like `Library/` under `root/`, or they get linked on Linux too.
- **Deployment:** the owner `cd`s into a package folder and runs `stove` (a stow-style
  symlinker) to link its contents into `$HOME`; on the Mac this is done for both `root/`
  and `root-mac/`. Editing a file here changes the running system immediately through
  the existing symlink.
- To add a new config: place it under the right package at its `$HOME`-relative path and
  re-run the symlinker (or `ln -s` it by hand). Keep generated files (`lazy-lock.json`,
  `.stack-work/`, etc.) out of the repo; `.gitignore` covers the xmonad build artifacts.
- Some tools present in the working tree are intentionally **not** tracked / are
  local-only, e.g. `root/.config/neomutt/`. Check `git ls-files` before assuming a file is
  version-controlled.

## Secrets: git-crypt

Three paths are transparently encrypted in git via git-crypt (see `.gitattributes`):
`root/.mbsyncrc`, `root/.config/goimapnotify/goimapnotify.yaml`,
`root/.config/aerc/accounts.conf`. On a fresh clone run `git-crypt unlock`; verify state
with `git-crypt status`. When adding a file that contains credentials, add a matching
`filter=git-crypt diff=git-crypt` line to `.gitattributes` **before** committing it.
`root/.zshrc` sources `~/.env` (not in the repo) for machine-local secrets.

Never write email addresses or mail domains into tracked, unencrypted files (this file
included) — the repo is public. Name mail identities by organization only. The current
set is Mahti, SaaShop, Comets (plus a personal Gmail); it is not fixed and will grow
(e.g. Pilvi), so treat any such list here as examples, not an exhaustive enumeration.

## Common commands

This repo has no lint/test/build. The relevant commands operate on the tools it configures:

| Task | Command |
| --- | --- |
| Reload zsh after editing shell config | `exec zsh` (or `source ~/.zshrc`) |
| Rebuild xmonad after editing `xmonad.hs`/`xmobar.hs` | `mod-q` inside xmonad, or `xmonad --recompile && xmonad --restart` |
| Sync Neovim plugins after editing specs | `:Lazy sync` |
| Install/update LSP servers & linters | `:Mason` |
| Unlock encrypted files on a new machine | `git-crypt unlock` |

## Shell (zsh)

- `root/.zshrc` is the shared entry point. It branches on `uname` and sources
  `~/.zshrc-linux` or `~/.zshrc-macos` **first** — those two files only differ in how they
  locate zplug (`$HOME/.zplug/init.zsh` on Linux, Homebrew's `zplug` on macOS) plus a few
  OS-specific helpers/PATH entries. Put OS-specific logic in those files, shared logic in
  `.zshrc`.
- Plugin manager is **zplug**; prompt is **pure**. PATH is assembled across `.zshrc` and
  `.zshrc-linux` and pulls in pyenv, nvm, bun, cargo, go, and `~/.npm-global`.
- `.bashrc` is a minimal fallback only (login shells use zsh).

## Neovim (`root/.config/nvim`)

- `init.lua` bootstraps **lazy.nvim** and imports every spec file in
  `lua/custom/plugins/`. One file per plugin.
- Config is split by convention: the lazy **spec** lives in `lua/custom/plugins/<name>.lua`
  and, when setup is non-trivial, it `require`s a sibling implementation module
  `lua/custom/<name>.lua` (e.g. `plugins/lsp.lua` → `custom/lsp.lua`,
  `plugins/completion.lua` → `custom/completion.lua`). Keep this two-file pattern.
- Editor options and keymaps that are not plugin-specific live in `plugin/options.lua` and
  `plugin/keymaps.lua` (auto-sourced by Neovim, not by lazy). Leader is `<Space>`.
- LSP: `custom/lsp.lua` uses **mason** + the Neovim 0.11+ `vim.lsp.config()` /
  `vim.lsp.enable()` API (not `lspconfig` setup calls) for `vtsls`, `vue_ls`,
  `tailwindcss`, `lua_ls`, `eslint`. `vtsls` is wired for Vue via the `@vue/typescript-plugin`.
- Linting is separate, via **nvim-lint** (`plugins/nvim-lint.lua`): `eslint_d` for JS/TS/
  Svelte, `pylint` for Python, triggered on save/insert-leave and `<leader>l`.
- Completion is **nvim-cmp** (LuaSnip is intentionally disabled).
- `after/ftplugin/mail.lua` and friends tune buffers for the mail-composing workflow below.

## Desktop / window manager

- **xmonad** (`root/.xmonad/xmonad.hs`) + **xmobar** (`root/.xmonad/xmobar.hs`), started
  from `root/.xinitrc` via `exec xmonad`. Mod key is Super (`mod4`). Terminal is `wezterm`.
- `xmonad.hs` contains a hand-rolled `dmenuLaunch` (a history-ranked `$PATH` launcher that
  persists pick counts to `~/.cache/dmenu-history`, replacing yeganesh) bound to `mod-p`,
  plus named scratchpads for a floating terminal and floating neovide.
- `root/.xinitrc` sets the custom `fiWithProgrammer` XKB layout (via the `setkb` alias),
  swaps Caps/Escape, disables mouse acceleration and DPMS, and configures a two-monitor
  `xrandr` setup.

## Mail stack

A notmuch-centric CLI mail setup, wired together as:

- **mbsync** (`.mbsyncrc`, encrypted) pulls IMAP → local Maildir at `~/.mail`.
- **notmuch** (`.notmuch-config`) indexes `~/.mail`; new mail tagged `unread;inbox`.
  Several identities, keyed by organization: Mahti (primary), a personal Gmail account,
  SaaShop, Comets — and the set grows over time (e.g. Pilvi may be added later).
  `.notmuch-config` is the authoritative list.
- **goimapnotify** (`.config/goimapnotify/goimapnotify.yaml`, encrypted) provides IMAP IDLE
  push, run as a systemd user service (`.config/systemd/user/goimapnotify.service`) on
  Linux and a LaunchAgent (`root-mac/Library/LaunchAgents/org.goimapnotify.plist`) on macOS.
- Clients: **aerc** (`.config/aerc/`) and **neomutt** (local-only, untracked).

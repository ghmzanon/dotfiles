# tmux.conf — Design Decisions

Inspired by [Omarchy's tmux config](https://github.com/basecamp/omarchy/blob/dev/config/tmux/tmux.conf).

## Goal
A cross-platform tmux configuration for **GNOME Linux** and **macOS** that avoids
shortcut conflicts and leverages existing muscle memory on both systems.

## Philosophy: prefix-less first
Frequent actions are bound to `Alt` (no prefix) — fewer keystrokes than
`C-Space` sequences. The `C-Space` prefix is reserved for session-level
actions (`k` kill-window, `r` reload config).

## Prefix: `C-Space` (fallback `C-b`)
`C-Space` is easier on the hands than `C-b`. `bind C-Space send-prefix` so that
double-tap passes a literal space through.

## Navigation: vi keys (`h/j/k/l`)
Pane navigation with `Alt+h/j/k/l`, resize with `Alt+H/J/K/L` (uppercase =
Alt+Shift). Window navigation with `Alt+n` / `Alt+N` — both use vim-directional
muscle memory.

## Window swap: `Alt+Shift+Left/Right`
Ideally this would be `Alt+S-h` / `Alt+S-l` to stay vi-consistent, but terminals
cannot distinguish `Alt+Shift+h` from `Alt+H` — both send `\x1bH`. Since
`Alt+H`/`Alt+L` are already used for horizontal resize, arrow keys are the only
reliable escape sequence for swap.

## Splits: `Alt+v` (vertical), `Alt+s` (side/horizontal)
Both open in `#{pane_current_path}` to avoid retyping paths. Mirrors the common
vim/screen convention.

## Clipboard
`set-clipboard on` + `allow-passthrough on` enables OSC 52 for copy from remote
sessions. The `copy-mode-vi y` binding pipes directly to the system clipboard as
a fallback (`wl-copy` on Linux, `pbcopy` on macOS — swap comments as needed).

## Status bar
Minimal, text-only indicators (`COPY`, `PREFIX`, `ZOOM`) — no Nerd Font icons
for cross-platform compatibility. Window activity shown as yellow number.
No distracting icons or messages.

## Border style
`pane-border-status top` with an empty format gives a thin colored line above
each pane. On vertical splits this line clearly marks where one pane ends and
the next begins, eliminating guesswork.

## macOS key handling
On macOS, left `Option` must send Esc prefix for Alt bindings to work — set
`option_as_alt = "OnlyLeft"` in your terminal config (Alacritty, iTerm2, etc.).
Right `Option` remains free for typing special characters on Mac keyboard
layouts.

On GNOME Linux, `altwin:swap_alt_win` is applied so the **outer** key
(Super → Alt) becomes Meta for tmux, matching the physical position of Mac's
Option key. Finger memory stays consistent between machines.

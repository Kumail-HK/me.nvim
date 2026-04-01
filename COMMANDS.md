# Neovim Keymaps

> `<leader>` is set to `Space`

## Find (Telescope)

| Key          | Action                                    |
| ------------ | ----------------------------------------- |
| `<leader>ff` | Find files                                |
| `<leader>fg` | Live grep (search strings across project) |
| `<leader>fw` | Grep word under cursor                    |
| `<leader>fr` | Recent files                              |
| `<leader>fb` | Open buffers (currently open files)       |

## File Tree (Neo-tree)

| Key         | Action           |
| ----------- | ---------------- |
| `<leader>e` | Toggle file tree |
| `<leader>o` | Focus file tree  |

## Git (Gitsigns)

| Key          | Action        |
| ------------ | ------------- |
| `]h`         | Next hunk     |
| `[h`         | Previous hunk |
| `<leader>hs` | Stage hunk    |
| `<leader>hr` | Reset hunk    |
| `<leader>hp` | Preview hunk  |
| `<leader>hb` | Blame line    |
| `<leader>hd` | Diff this     |

## Git (Neogit + Diffview)

| Key          | Action         |
| ------------ | -------------- |
| `<leader>hg` | Open Neogit UI |
| `<leader>hd` | Open Diffview  |
| `<leader>hl` | Open Lazygit   |

## Terminal (Toggleterm)

| Key          | Action                           |
| ------------ | -------------------------------- |
| `Ctrl+\`     | Toggle floating terminal         |
| `<leader>th` | Toggle horizontal split terminal |
| `<leader>tv` | Toggle vertical split terminal   |

## AI (OpenCode)

| Key          | Action                           |
| ------------ | -------------------------------- |
| `<leader>ac` | Toggle OpenCode (vertical split) |

## LSP

| Key          | Action           |
| ------------ | ---------------- |
| `gd`         | Go to definition |
| `gr`         | Find references  |
| `K`          | Hover docs       |
| `<leader>ca` | Code action      |
| `<leader>rn` | Rename symbol    |

## Formatting

| Key          | Action                                      |
| ------------ | ------------------------------------------- |
| `<leader>lf` | Format current file (conform, LSP fallback) |

## Diagnostics (Trouble)

| Key         | Action                                    |
| ----------- | ----------------------------------------- |
| `<leader>q` | Toggle diagnostics panel for current file |

## Markdown

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>mp` | Toggle markdown preview |

# Neovim External Requirements

These tools must be installed on your system separately — they cannot be managed by lazy.nvim or Mason.

## Required

| Tool                                             | Purpose                                                    | Install                                                               |
| ------------------------------------------------ | ---------------------------------------------------------- | --------------------------------------------------------------------- |
| [Node.js 18+](https://nodejs.org)                | Required for Claude Code and `ts_ls` LSP                   | `sudo apt install nodejs` or via [nvm](https://github.com/nvm-sh/nvm) |
| [Git](https://git-scm.com)                       | Required for lazy.nvim bootstrap and all git plugins       | `sudo apt install git`                                                |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Required for Telescope live grep search                    | `sudo apt install ripgrep`                                            |
| [fzf](https://github.com/junegunn/fzf)           | Required for Telescope fzf native extension                | `sudo apt install fzf`                                                |
| [A Nerd Font](https://www.nerdfonts.com)         | Required for icons in Neo-tree, which-key, render-markdown | Download from nerdfonts.com and set in terminal                       |

## Recommended

| Tool                                                | Purpose                                  | Install                                    |
| --------------------------------------------------- | ---------------------------------------- | ------------------------------------------ |
| [OpenCode](https://opencode.ai) | AI coding agent (`<leader>ac`) | `npm install -g opencode-ai` |
| [Lazygit](https://github.com/jesseduffield/lazygit) | Git TUI (`<leader>gl`)                   | See install steps below                    |
| [luarocks](https://luarocks.org)                    | Required for Mason to install `luacheck` | `sudo apt install luarocks`                |

## Mason-managed (installed via `:MasonInstall`)

These are managed inside Neovim via Mason but listed here for reference. Run `:MasonInstall <name>` for each.

| Tool       | Purpose                                             |
| ---------- | --------------------------------------------------- |
| `ts_ls`    | TypeScript / JavaScript LSP                         |
| `pyright`  | Python LSP                                          |
| `lua_ls`   | Lua LSP                                             |
| `bashls`   | Bash LSP                                            |
| `prettier` | TypeScript / JavaScript / JSON / Markdown formatter |
| `stylua`   | Lua formatter                                       |
| `black`    | Python formatter                                    |
| `eslint_d` | JavaScript / TypeScript linter                      |
| `ruff`     | Python linter                                       |
| `luacheck` | Lua linter (requires luarocks)                      |

## Installing Lazygit

Run the provided install script:

```bash
chmod +x lazygit-install.sh
./lazygit-install.sh
```

## Installing Lazygit (macOS)

```bash
brew install lazygit
```

## Installing Node.js via nvm (recommended)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 20
nvm use 20
```

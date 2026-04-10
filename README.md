# Dotfiles

Terminal-based development setup for macOS, focused on web development (React, TypeScript, Tailwind, Python).

## What's Included

- **Neovim** - LSP, autocompletion, telescope, treesitter, formatting, git integration
- **tmux** - terminal multiplexer with session persistence
- **Ghostty** - terminal emulator config
- **lazygit** - TUI git client with delta diffs

## Setup from Scratch

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After install, follow the instructions to add Homebrew to your PATH:

```bash
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 2. Install Ghostty

Download from [ghostty.org](https://ghostty.org) or:

```bash
brew install --cask ghostty
```

### 3. Install Nerd Font

Required for icons in neovim, lualine, nvim-tree, and lazygit:

```bash
brew install --cask font-hack-nerd-font
```

### 4. Install CLI Tools

```bash
brew install neovim lazygit ripgrep fd bat delta tmux eza fzf git
```

| Tool | Purpose |
|------|---------|
| `neovim` | Text editor |
| `lazygit` | Git TUI |
| `ripgrep` | Fast grep (used by telescope) |
| `fd` | Fast find (used by telescope) |
| `bat` | Better `cat` with syntax highlighting |
| `delta` | Better git diffs |
| `tmux` | Terminal multiplexer |
| `eza` | Better `ls` with icons |
| `fzf` | Fuzzy finder |

### 5. Install Node.js (via nvm)

```bash
brew install nvm
mkdir ~/.nvm
```

Add to your `~/.zshrc`:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
```

Then install Node:

```bash
source ~/.zshrc
nvm install --lts
```

### 6. Clone and Link Dotfiles

```bash
git clone https://github.com/renemichel/dotfiles.git ~/dotfiles
cd ~/dotfiles
mkdir -p ~/.config
./install.sh
```

This symlinks all configs to their correct locations.

### 7. Install Tmux Plugin Manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 8. Set Up Shell

Add these to your `~/.zshrc`:

```bash
export EDITOR="nvim"

# Aliases
alias ll="eza -l -g --icons"
alias la="eza -la -g --icons"
alias lt="eza --tree --level=2 --icons"
alias lg="lazygit"
alias vim="nvim"
alias v="nvim"
```

### 9. First Launch

**Neovim:**

```bash
nvim
```

Wait for Lazy to install all plugins. Then run `:Mason` and wait for LSP servers and formatters to install automatically:

- `ts_ls` (TypeScript/JavaScript)
- `pyright` (Python)
- `tailwindcss` (Tailwind CSS)
- `cssls` (CSS)
- `html` (HTML)
- `emmet_ls` (Emmet)
- `eslint` (Linting)
- `jsonls` (JSON)
- `lua_ls` (Lua)
- `prettierd` (Formatting)
- `stylua` (Lua formatting)
- `black` (Python formatting)

**tmux:**

```bash
tmux
```

Press `Ctrl+a I` (capital I) to install tmux plugins (resurrect + continuum).

## Keybindings

Leader key is `Space`.

### Neovim

| Key | Action |
|-----|--------|
| `Space f f` | Find files |
| `Space f s` | Search text in project |
| `Space f r` | Recent files |
| `Space f t` | Search TODOs |
| `g d` | Go to definition |
| `g R` | Find references |
| `K` | Hover documentation |
| `Space c a` | Code actions |
| `Space r n` | Rename symbol |
| `Space d` | Line diagnostics |
| `Space D` | Buffer diagnostics |
| `Space x x` | Diagnostics panel (Trouble) |
| `Space l g` | Open LazyGit |
| `Space m p` | Format file |
| `g c c` | Toggle line comment |
| `] h` / `[ h` | Next/prev git hunk |
| `Space h b` | Git blame line |
| `Space t b` | Toggle inline blame |
| `Space s v` | Split vertical |
| `Space s h` | Split horizontal |
| `Ctrl+h/j/k/l` | Navigate between splits (works across tmux panes) |

### tmux

Prefix is `Ctrl+a`.

| Key | Action |
|-----|--------|
| `Ctrl+a \|` | Split pane vertically |
| `Ctrl+a -` | Split pane horizontally |
| `Ctrl+h/j/k/l` | Navigate panes (no prefix needed) |
| `Ctrl+a c` | New window |
| `Ctrl+a n` / `Ctrl+a p` | Next/previous window |
| `Ctrl+a 1-9` | Jump to window |
| `Ctrl+a d` | Detach session |
| `Ctrl+a s` | Switch sessions |
| `Ctrl+a z` | Zoom pane (fullscreen toggle) |
| `Ctrl+a r` | Reload config |
| `Ctrl+a [` | Enter copy mode (vi keys) |
| `Ctrl+a I` | Install TPM plugins |

### lazygit

Open with `lg` in terminal or `Space l g` in neovim.

Navigate with `h/j/k/l` between panels. Press `?` for help in any panel.

## Theme

Everything uses **Tokyo Night** color scheme:

- Neovim: `tokyonight.nvim`
- Ghostty: `tokyonight`
- tmux: custom Tokyo Night status bar

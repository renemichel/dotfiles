#!/bin/bash
# Symlink dotfiles to their correct locations

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create symlinks
ln -sfn "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES_DIR/ghostty/.config/ghostty" "$HOME/.config/ghostty"
ln -sfn "$DOTFILES_DIR/lazygit/.config/lazygit" "$HOME/.config/lazygit"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "Dotfiles linked!"
echo ""
echo "Next steps:"
echo "  1. Install CLI tools: brew install neovim lazygit ripgrep fd bat delta tmux eza"
echo "  2. Install TPM: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo "  3. Open nvim and wait for plugins to install"
echo "  4. In tmux, press Ctrl+a I to install tmux plugins"

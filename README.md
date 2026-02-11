# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

---

## ⌨️ Custom Keymaps

All custom keybindings configured for this Neovim setup.

### 💬 Comments

| Shortcut   | Mode   | Description                 |
| ---------- | ------ | --------------------------- |
| `Ctrl + /` | Normal | Toggle comment on line      |
| `Ctrl + /` | Visual | Toggle comment on selection |

### 🖥️ Terminal

| Shortcut       | Mode     | Description     |
| -------------- | -------- | --------------- |
| `` Ctrl + ` `` | Normal   | Toggle terminal |
| `` Ctrl + ` `` | Terminal | Hide terminal   |

### 📄 Buffer Management

| Shortcut   | Mode   | Description     |
| ---------- | ------ | --------------- |
| `Ctrl + W` | Normal | Close buffer    |
| `Ctrl + L` | Normal | Next buffer     |
| `Ctrl + H` | Normal | Previous buffer |

### 📝 Line Operations

| Shortcut         | Mode   | Description              |
| ---------------- | ------ | ------------------------ |
| `Ctrl + Alt + D` | Normal | Duplicate line down      |
| `Ctrl + Alt + D` | Visual | Duplicate selection down |
| `Alt + ↓`        | Normal | Move line down           |
| `Alt + ↑`        | Normal | Move line up             |
| `Alt + ↓`        | Visual | Move selection down      |
| `Alt + ↑`        | Visual | Move selection up        |

### ✏️ Insert Mode Enhancements

| Shortcut           | Mode   | Description                 |
| ------------------ | ------ | --------------------------- |
| `Ctrl + Backspace` | Insert | Delete word backward        |
| `Ctrl + U`         | Insert | Undo                        |
| `Ctrl + R`         | Insert | Redo                        |
| `jj`               | Insert | Quick escape to normal mode |
| `jk`               | Insert | Quick escape to normal mode |

### 🚀 Productivity

| Shortcut   | Mode   | Description               |
| ---------- | ------ | ------------------------- |
| `Ctrl + S` | All    | Save file                 |
| `Ctrl + A` | Normal | Select all                |
| `Esc`      | Normal | Clear search highlighting |

### 📜 Scrolling & Navigation

| Shortcut   | Mode          | Description                       |
| ---------- | ------------- | --------------------------------- |
| `Ctrl + D` | Normal        | Scroll down (cursor centered)     |
| `Ctrl + U` | Normal        | Scroll up (cursor centered)       |
| `n`        | Normal        | Next search result (centered)     |
| `N`        | Normal        | Previous search result (centered) |
| `H`        | Normal/Visual | Jump to start of line             |
| `L`        | Normal/Visual | Jump to end of line               |

### 🎨 Editing Enhancements

| Shortcut | Mode          | Description                    |
| -------- | ------------- | ------------------------------ |
| `<`      | Visual        | Indent left (stay in visual)   |
| `>`      | Visual        | Indent right (stay in visual)  |
| `p`      | Visual        | Paste without losing clipboard |
| `x`      | Normal/Visual | Delete char without yanking    |
| `J`      | Normal        | Join lines (cursor stays put)  |

### 🪟 Window & Split Management

| Shortcut     | Mode   | Description            |
| ------------ | ------ | ---------------------- |
| `<leader>sv` | Normal | Split vertical         |
| `<leader>sh` | Normal | Split horizontal       |
| `<leader>sx` | Normal | Close split            |
| `Alt + H`    | Normal | Move to left split     |
| `Alt + J`    | Normal | Move to bottom split   |
| `Alt + K`    | Normal | Move to top split      |
| `Alt + L`    | Normal | Move to right split    |
| `Ctrl + ↑`   | Normal | Increase window height |
| `Ctrl + ↓`   | Normal | Decrease window height |
| `Ctrl + ←`   | Normal | Decrease window width  |
| `Ctrl + →`   | Normal | Increase window width  |

### 📋 Clipboard

| Shortcut    | Mode          | Description                 |
| ----------- | ------------- | --------------------------- |
| `<leader>y` | Normal/Visual | Yank to system clipboard    |
| `<leader>p` | Normal/Visual | Paste from system clipboard |

### 🔧 Utilities

| Shortcut     | Mode   | Description                      |
| ------------ | ------ | -------------------------------- |
| `<leader>rw` | Normal | Find & replace word under cursor |
| `<leader>o`  | Normal | Add blank line below             |
| `<leader>O`  | Normal | Add blank line above             |
| `<leader>fn` | Normal | New file                         |
| `<leader>uw` | Normal | Toggle word wrap                 |
| `<leader>so` | Normal | Source current file              |

---

> **Note:** `<leader>` is typically set to `Space` in LazyVim.

## 🎯 Quick Tips

- **Escape insert mode fast:** Use `jj` or `jk` instead of reaching for `Esc`
- **Stay centered:** Scrolling with `Ctrl+D/U` keeps your cursor in the middle
- **Smart paste:** Paste over text in visual mode without losing what you copied
- **System clipboard:** Use `<leader>y` and `<leader>p` to copy/paste outside Neovim

# 🌌 demm05's Neovim Configuration

A high-performance, category-driven Neovim configuration optimized for C++, Python, and Rust, built for Neovim 0.11+.

## 🚀 Key Features

- **⚡ Blazing Fast**: Powered by `blink.cmp` for near-instant completion and `lazy.nvim` for optimized plugin loading.
- **🎨 Premium UI**: Rich aesthetics using `snacks.nvim` for dashboards, pickers, and smooth notifications.
- **📐 Categorized Keymaps**: Mnemonic, standardized keybindings that make the configuration highly discoverable.
- **🤖 AI Integrated**: Native support for `OpenCode.nvim` for advanced AI-assisted coding.
- **🦀 First-Class Language Support**:
  - **C/C++**: Optimized `clangd` with background indexing and header/source switching.
  - **Rust**: `rust-analyzer` with automatic Clippy lints and proc-macro support.
  - **Python**: Robust type checking with `basedpyright` and fast linting via `ruff`.
- **📟 Terminal Pro**: Enhanced terminal buffers with auto-insert and immediate closure support.

---

## ⌨️ Standardized Keymap Categories

This configuration uses a category-based leader system. Press `<leader>` to see the full menu via `which-key`.

| Prefix | Category | Actions |
| :--- | :--- | :--- |
| **`<leader>l`** | **LSP / Code** | Definition, References, Rename, Format, Diagnostics |
| **`<leader>f`** | **File / Find** | Find Files, Recent Files, Snacks Explorer |
| **`<leader>s`** | **Search** | Grep, Project-wide Search/Replace, TODOs |
| **`<leader>u`** | **UI / Toggle** | Zen Mode, Toggles (Hints, Diagnostics, Terminal) |
| **`<leader>g`** | **Git** | Lazygit, Blame, Status, Branch history |
| **`<leader>b`** | **Buffer** | Switching, Deleting, Pinning |
| **`<leader>a`** | **AI** | Ask, AI Actions, Toggle AI Chat |
| **`<leader>e`** | **Explorer** | Fast access to `mini.files` |
| **`<leader>o`** | **Zoom** | Toggle window focus/zoom |

---

## 🛠 Prerequisites

Ensure you have the following installed on your system:

- **Neovim 0.11.0+**
- **Git**
- **A Nerd Font** (e.g., JetBrainsMono Nerd Font)
- **Node.js & Python** (for some LSPs)
- **Compilers**: `clang`, `gcc`, or `rustc` depending on your work.

## 📦 Installation

1. **Clone the repository:**
   ```bash
   git clone git@github.com:demm05/nvim.git ~/.config/nvim
   ```

2. **Open Neovim:**
   ```bash
   nvim
   ```
   *Lazy.nvim will automatically begin installing all plugins.*

3. **Install LSPs & Tools:**
   Press `:Mason` inside Neovim to manage, install, and update your language servers and debuggers.

---

## 🔧 Project Specifics: `compile_commands.json`
For the best C++ experience, ensure your project has a `compile_commands.json` in the root. If your build system (like CMake) puts it in a `build/` folder, link it to the root:
```bash
ln -s build/compile_commands.json .
```

---

## 🤝 Acknowledgements
Built on the shoulders of giants: `LazyVim` inspiration, `folke`'s amazing plugins, and the Neovim community.

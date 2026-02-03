# demm05/nvim

A performance-oriented Neovim configuration for C++, Rust, and Python development. Optimized for Neovim 0.11+ and built around a discovery-first keymap architecture.

## Core Environment
- **Completion**: `blink.cmp` for low-latency snippets and LSP suggestions.
- **UI Framework**: `snacks.nvim` for pickers, notifications, and dashboard.
- **Package Management**: `lazy.nvim` with `mason` for automated tool installation.
- **Assistant**: Integrated AI coding support via `opencode.nvim`.

## Keymap Strategy (Leader)
Mapped prefixes are categorized by function to ensure discoverability via `which-key`.

| Prefix | Category | Actions |
| :--- | :--- | :--- |
| `l` | LSP/Code | Definition, References, Rename, Format, Diagnostics (`le`), Logs (`ll`) |
| `f` | Files | Find (`ff`), Recent (`fr`), Config (`fc`), Snacks Explorer (`fe`) |
| `s` | Search | Grep (`sg`), Global Replace (`sr`), Todo Search (`st`) |
| `u` | UI/Toggle | Zen Mode (`uz`), Inlay Hints (`uh`), Terminal (`ut`), Line Numbers |
| `g` | Git | Lazygit (`gg`), Blame (`gb`), Status (`gs`), Log (`gl`) |
| `b` | Buffers | Navigation (`S-h`/`S-l`), Deleting (`bd`/`bo`), Pinning |
| `a` | AI | Ask (`aa`), Actions (`ax`), Toggle Chat (`at`), AI Operator (`ao`) |
| `o` | Zoom | Toggle current window focus (Zoom) |
| `e` | Explorer | Direct access to `mini.files` |

## Language-Specific Implementation

### C/C++ (clangd)
- Persistent background indexing enabled.
- Automatic symbol extraction from non-standard system headers via `--query-driver`.
- Functional placeholders for argument completion.
- `<leader>lh` to instantly switch between `.cpp` and `.h` files.

### Rust (rust-analyzer)
- Automatic `clippy` linting on save.
- Comprehensive proc-macro and cargo feature analysis.

### Python (basedpyright & ruff)
- Fast linting and formatting via `ruff`.
- `basedpyright` configured for optimized diagnostic noise.

### Terminal
- Automatic insert mode upon entry.
- Mapped `:q` to exit terminal buffers immediately.
- Excluded from buffer lists to keep navigation clean.

## System Dependencies
- **Neovim 0.11.0+**
- **Nerd Font**: Required for icons (e.g., JetBrainsMono).
- **Tools**: `git`, `curl`, `ripgrep`, `fd`, `fzf`.
- **Compilers**: `clang` (C/C++), `rustc`/`cargo` (Rust), `python3`/`pip` (Python).

## Installation

1. **Clone**:
   ```bash
   git clone git@github.com:demm05/nvim.git ~/.config/nvim
   ```
2. **Sync**:
   Open Neovim and run `:Lazy sync`.
3. **LSP Management**: 
   All language servers, debuggers, and linters are managed via **Mason**. Run `:Mason` to install or update tools (e.g., `clangd`, `rust-analyzer`, `basedpyright`).

*Note: For C++ projects, ensure a `compile_commands.json` exists in the project root.*

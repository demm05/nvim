# AI Agent Instructions

This document defines technical standards and communication protocols for agents working on this Neovim configuration.

## Project Architecture

1. Standardized Keymaps: Use the category-based leader system. All custom mappings must reside under these prefixes to maintain which-key organization:
   - leader + l: LSP / Code (Definition, Rename, Format, Diagnostics, Logs)
   - leader + f: Files / Find (Find, Recent, Config, Snacks Explorer)
   - leader + s: Search (Grep, Global Replace, Todos)
   - leader + u: UI / Toggle (Zen, Hints, Terminal, Numbers)
   - leader + g: Git (Lazygit, Blame, Status, Log)
   - leader + b: Buffers (Switching, Deleting, Pinning)
   - leader + a: AI (Ask, Actions, Toggle Chat, Context Operator)
   - leader + e: Explorer (Direct mini.files access)
   - leader + o: Zoom (Toggle current window focus)

2. C++ Configuration:
   - Use clangd with --query-driver=** to enable header discovery in managed environments (Pixi, Nix).
   - Use vim.fs.root for project detection, prioritizing compile_commands.json.
   - Use direct Lua lsp_request for switchSourceHeader instead of relying on legacy commands.

3. Python/Rust Configuration:
   - Rust: Enable clippy on save and proc-macro analysis in rust-analyzer.
   - Python: Use basedpyright for analysis and ruff for fast linting/formatting.

4. Neovim 0.11+ Stability:
   - Utilize mason-lspconfig handlers for server setup.
   - Avoid deprecated lspconfig patterns that cause startup exceptions in 0.11 builds.

5. Terminal behavior:
   - Terminals must auto-enter insert mode on open/enter.
   - Map :q in terminal mode to close the terminal window immediately.

## Interaction Rules

1. Verification Protocol: After any modification, ask: "Does everything work as expected?" or "Could you verify if this fixes the issue?"
2. Commit Protocol: Never execute git commit or git push without explicit user approval.
3. Submodule Maintenance: This repository is a separate project but is often included as a submodule in dotfiles. Only update the parent submodule pointer if the current workspace includes the parent dotfiles repository.
4. Technical Precision: Follow clean Lua patterns. When editing README.md, keep it concise, documentation-heavy, and icon-free.
5. Automated Validation: Before finalizing changes, verify that the configuration launches without errors by running:
   `nvim --headless -c "qa" 2>&1`
   Ensure the output is empty (no Lua errors or deprecation warnings).

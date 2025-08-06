local opt = vim.opt

-- Appearance
opt.relativenumber = true -- Show relative line numbers
opt.number = true         -- Shows the current line number
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.title = true          -- Set the title of the window
opt.wrap = false          -- Disable line wrapping

-- Behavior
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- But not if the query has uppercase letters
opt.mouse = 'a'             -- Enable mouse support

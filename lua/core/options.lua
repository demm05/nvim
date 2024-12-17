vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true
vim.opt.expandtab = false -- Use real tabs, not spaces
vim.opt.copyindent = true -- Copy indent from previous line
vim.opt.preserveindent = true -- Preserve indent structure
vim.opt.softtabstop = 0 -- Disable soft tabstops
vim.opt.shiftwidth = 4 -- Indentation width (number of spaces)
vim.opt.tabstop = 4 -- Width of a tab character

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

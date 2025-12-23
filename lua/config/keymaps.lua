-- Generic keymaps
local map = vim.keymap.set

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>== ", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>== ", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-b>", "<cmd>e #<cr>", { desc = "Cycle Current and Previous Buffer" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Window Management
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>wh", "<C-W>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>wj", "<C-W>j", { desc = "Go to Down Window", remap = true })
map("n", "<leader>wk", "<C-W>k", { desc = "Go to Up Window", remap = true })
map("n", "<leader>wl", "<C-W>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>wo", "<C-W>o", { desc = "Close Other Windows", remap = true })
map("n", "<leader>ws", "<C-W>s", { desc = "Split Window", remap = true })
map("n", "<leader>wv", "<C-W>v", { desc = "Split Window Vertically", remap = true })
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Split Vertically" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Split Horizontally" })
map("n", "<leader>w+", "<C-W>+", { desc = "Increase Height" })
map("n", "<leader>w-", "<C-W>-", { desc = "Decrease Height" })
map("n", "<leader>w<", "<C-W><", { desc = "Decrease Width" })
map("n", "<leader>w>", "<C-W>>", { desc = "Increase Width" })
map("n", "<leader>w=", "<C-W>=", { desc = "Equally High and Wide" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = false },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false }, -- animations are built into scroll, so disable it or its animations
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = { enabled = true },
		scratch = { enabled = true },
		toggle = { enabled = true },
		explorer = { enabled = true },
	},
	keys = {
		-- Top level
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep (Root Dir)",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>E",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer Snacks",
		},

		-- buffer
		{
			"<leader>bb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Switch to Other Buffer",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>bD",
			function()
				Snacks.bufdelete({ force = true })
			end,
			desc = "Delete Buffer and Window",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		{
			"<leader>bp",
			function()
				Snacks.toggle.pin()
			end,
			desc = "Toggle Pin",
		},
		{
			"<leader>bP",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "Delete Non-Pinned Buffers",
		},

		-- file/find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fB",
			function()
				Snacks.picker.buffers({ all = true })
			end,
			desc = "Buffers (all)",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.files({ cwd = vim.fn.getcwd() })
			end,
			desc = "Find Files (cwd)",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Files (git-files)",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.recent({ filter = { cwd = true } })
			end,
			desc = "Recent (cwd)",
		},
		{
			"<leader>ft",
			function()
				Snacks.terminal()
			end,
			desc = "Terminal (Root Dir)",
		},
		{
			"<leader>fT",
			function()
				Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
			end,
			desc = "Terminal (cwd)",
		},

		-- git
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse (open)",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log({ cwd = vim.fn.getcwd() })
			end,
			desc = "Git Log (cwd)",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},

		-- search
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep (Root Dir)",
		},
		{
			"<leader>sG",
			function()
				Snacks.picker.grep({ cwd = vim.fn.getcwd() })
			end,
			desc = "Grep (cwd)",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Recent Projects",
		},

		-- ui
		{
			"<leader>ua",
			function()
				Snacks.toggle.animate():toggle()
			end,
			desc = "Toggle Animations",
		},
		{ "<leader>ub", "<cmd>TransparentToggle<cr>", desc = "Toggle Background Transparency" },
		{
			"<leader>uc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>ud",
			function()
				Snacks.toggle.diagnostics():toggle()
			end,
			desc = "Toggle Diagnostics",
		},
		{
			"<leader>uf",
			function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				Snacks.notify.info("Autoformat " .. (vim.g.disable_autoformat and "Disabled" or "Enabled"))
			end,
			desc = "Toggle Auto Format (Global)",
		},
		{
			"<leader>ug",
			function()
				Snacks.toggle.indent():toggle()
			end,
			desc = "Toggle Indent Guides",
		},
		{
			"<leader>uh",
			function()
				Snacks.toggle.inlay_hints():toggle()
			end,
			desc = "Toggle Inlay Hints",
		},
		{
			"<leader>ul",
			function()
				Snacks.toggle.line_number():toggle()
			end,
			desc = "Toggle Line Numbers",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>ur",
			function()
				Snacks.toggle.relativenumber():toggle()
			end,
			desc = "Toggle Relative Number",
		},
		{
			"<leader>uu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History (Snacks)",
		},
		{
			"<leader>uw",
			function()
				Snacks.toggle.option("wrap"):toggle()
			end,
			desc = "Toggle Wrap",
		},
		{
			"<leader>uz",
			function()
				Snacks.zen()
			end,
			desc = "Enable Zen Mode",
		},
		{
			"<leader>uZ",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Enable Zoom Mode",
		},

		-- quit/session
		{ "<leader>qq", "<cmd>qa<cr>", desc = "Quit All" },
		{
			"<leader>qs",
			function()
				Snacks.picker.projects()
			end,
			desc = "Restore Session",
		}, -- Placeholder for session picker if needed

		-- misc
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
	},
}

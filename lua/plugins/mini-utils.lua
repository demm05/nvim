return {
	-- Auto-pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	-- Commenting
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<C-/>", "gcc", mode = "n", remap = true, desc = "Toggle Comment" },
			{ "<C-/>", "gc", mode = "v", remap = true, desc = "Toggle Comment" },
			{ "<C-_>", "gcc", mode = "n", remap = true, desc = "Toggle Comment" },
			{ "<C-_>", "gc", mode = "v", remap = true, desc = "Toggle Comment" },
		},
	},

	-- Statusline
	{
		"echasnovski/mini.statusline",
		opts = {
			set_vim_settings = false,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = mode_hl, strings = { location } },
					})
				end,
			},
		},
	},
}

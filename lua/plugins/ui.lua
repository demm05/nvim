return {
	-- Transparency
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {
			extra_groups = {
				"NormalFloat",
				"FloatBorder",
				"FloatTitle",
				"TabLine",
				"TabLineFill",
				"WinBarNC",
				"WinBar",
				"MiniFilesTitleFocused",
			},
			exclude_groups = {},
		},
	},

	-- Theme Persistence
	{
		"catppuccin",
		lazy = false,
		priority = 1001,
		config = function()
			local theme_file = vim.fn.stdpath("data") .. "/last_theme.txt"

			-- Load theme
			local f = io.open(theme_file, "r")
			if f then
				local theme = f:read("*l")
				f:close()
				if theme then
					local ok = pcall(vim.cmd, "colorscheme " .. theme)
					if not ok then
						vim.cmd("colorscheme catppuccin-mocha")
					end
				end
			else
				-- Default
				vim.cmd("colorscheme catppuccin-mocha")
			end

			-- Save theme
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					local theme = vim.g.colors_name
					if theme then
						local f = io.open(theme_file, "w")
						if f then
							f:write(theme)
							f:close()
						end
					end
				end,
			})
		end,
	},
}

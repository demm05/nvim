return {

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
	},

	-- Oasis
	{
		"uhs-robert/oasis.nvim",
		priority = 1000,
	},

	-- Everforest
	{
		"sainnhe/everforest",
		priority = 1000,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_better_performance = 1
		end,
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = false,
		},
	},

	-- Cyberdream
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			italic_comments = true,
			hide_fillchars = false,
			borderless_pickers = false,
			terminal_colors = true,
		},
	},

	-- Monokai Pro
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true,
				filter = "pro", -- classic, octagon, pro, machine, ristretto, spectrum
			})
		end,
	},

	-- Srcery
	{
		"srcery-colors/srcery-vim",
		priority = 1000,
	},
}

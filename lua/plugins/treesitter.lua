return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	branch = "master",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early if opening a file
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"dockerfile",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"python",
			"rust",
			"typescript",
			"vim",
			"yaml",
			"make",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return {
	"echasnovski/mini.files",
	version = false,
	keys = {
		{
			"<leader>e",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = "Explorer Mini (directory of current file)",
		},
		{
			"<leader>fE",
			function()
				require("mini.files").open(vim.uv.cwd(), true)
			end,
			desc = "Explorer Mini (cwd)",
		},
	},
	opts = {
		windows = {
			preview = true,
			width_focus = 30,
			width_preview = 30,
		},
		options = {
			use_as_default_explorer = true,
		},
	},
}

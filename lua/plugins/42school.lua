return {
	{
		"vim-syntastic/syntastic",
		syntastic_c_checkers = { "norminette", "gcc" },
		syntastic_aggregate_errors = 1,
		syntastic_c_norminette_exec = "norminette",
		c_syntax_for_h = 1,
		syntastic_c_include_dirs = {
			"include",
			"../include",
			"../../include",
			"libft",
			"../libft/include",
			"../../libft/include",
		},
		syntastic_c_norminette_args = "-R CheckTopCommentHeader",
		syntastic_check_on_open = 1,
		syntastic_always_populate_loc_list = 1,
		syntastic_auto_loc_list = 1,
		syntastic_check_on_wq = 1,
	},
	"alexandregv/norminette-vim",
	{
		"Diogo-ss/42-header.nvim",
		cmd = { "Stdheader" },
		keys = { "<F1>" },
		opts = {
			default_map = true, -- Default mapping <F1> in normal mode.
			auto_update = true, -- Update header when saving.
			user = "dmelnyk", -- Your usker.
			mail = "dmelnyk@student.42.fr", -- Your mail.
			-- add other options.
		},
		config = function(_, opts)
			require("42header").setup(opts)
		end,
	},
}

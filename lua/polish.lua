return {
	-- This function is run last and is a good place for final adjustments
	polish = function()
		-- Create an autocommand to set indentation for specific filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp", "python" }, -- Add any other filetypes you want
			callback = function()
				vim.bo.shiftwidth = 4
				vim.bo.tabstop = 4
				vim.bo.softtabstop = 4 -- Set softtabstop to 4 as well
				vim.bo.expandtab = true
			end,
		})
	end,
}

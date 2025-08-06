return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'gruvbox'
    vim.g.gruvbox_contrast_dark = 'medium' -- or 'soft', 'hard'
  end,
}

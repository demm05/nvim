return {
  "nickjvandyke/opencode.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim",
    "saghen/blink.cmp",
  },
  ---@type opencode.Opts
  opts = {
    -- You can add custom prompts or contexts here if needed
  },
  config = function(_, opts)
    -- Global options for fast startup / lazy loading support
    vim.g.opencode_opts = opts
    
    -- Essential for auto-reloading file edits made by the AI
    vim.o.autoread = true
  end,
  keys = {
    {
      "<leader>aa",
      function() require("opencode").ask() end,
      desc = "AI Ask",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function() require("opencode").select() end,
      desc = "AI Actions",
      mode = { "n", "v" },
    },
    {
      "<leader>at",
      function() require("opencode").toggle() end,
      desc = "AI Toggle Chat",
      mode = { "n", "v", "t" },
    },
    {
      "<leader>ao",
      function()
        return require("opencode").operator("@this")
      end,
      desc = "AI Add Context (Operator)",
      expr = true,
    },
  },
}

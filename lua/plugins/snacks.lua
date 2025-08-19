return {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>fe",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
    },
}

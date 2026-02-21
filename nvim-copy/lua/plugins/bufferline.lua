return  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup {
            -- highlights = require("catppuccin.special.bufferline").get_theme(),
            options = {
                mode = "tabs",
            }
        }
    end,
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>"},
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>"},
    },
}

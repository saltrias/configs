local colors = require("al.colors")
local lualineAutoPalette = colors.lualineAutoPalette
local colorPaletteList = colors.colorPaletteList

return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local C = require("catppuccin.palettes").get_palette("mocha")
        require("lualine").setup {
            options = {
                -- change theme
                theme = lualineAutoPalette(colorPaletteList, 3, 1), 
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },

                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode", },
                lualine_b = { "branch"},
                lualine_c = { "filename" },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        } 
    end,
}

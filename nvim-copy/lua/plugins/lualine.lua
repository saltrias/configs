local M = {}

M.colorPaletteList = {
    rosewater = "#F5E0DC",
    flamingo = "#F2CDCD",
    pink = "#F5C2E7",
    mauve = "#CBA6F7",
    red = "#F38BA8",
    maroon = "#EBA0AC",
    peach = "#FAB387",
    yellow = "#F9E2AF",
    green = "#A6E3A1",
    teal = "#94E2D5",
    sky = "#89DCEB",
    sapphire = "#74C7EC",
    blue = "#89B4FA",
    lavender = "#B4BEFE",
    text = "#CDD6F4",
    subtext1 = "#BAC2DE",
    subtext0 = "#A6ADC8",
    overlay2 = "#9399B2",
    overlay1 = "#7F849C",
    overlay0 = "#6C7086",
    surface2 = "#585B70",
    surface1 = "#45475A",
    surface0 = "#313244",
    base = "#1E1E2E",
    mantle = "#181825",
    crust = "#11111B",
}

local colorPaletteList = {
    M.colorPaletteList.red,
    M.colorPaletteList.peach,
    M.colorPaletteList.yellow,
    M.colorPaletteList.green,
    M.colorPaletteList.blue,
    M.colorPaletteList.mauve,
}

function M.lualineAutoPalette(colorPallete, colorOffset, colorStep)
    local colorOffset = colorOffset or 0
    local colorStep = colorStep or 1

    local config = {}
    local modes = { "normal", "insert", "visual", "replace", "command" } 
    local n = #colorPaletteList
    local C = M.colorPaletteList

    for i, mode in ipairs(modes) do
        local a = { bg = colorPaletteList[((colorOffset + (i - 1) * colorStep) % n) + 1], fg = C.mantle, gui="bold" }
        local b = { bg = colorPaletteList[((colorOffset + (i - 0) * colorStep) % n) + 1], fg = C.mantle }
        local c = { bg = C.mantle, fg = C.text }
        local x = { bg = C.mantle, fg = C.text }
        local y = { bg = colorPaletteList[((colorOffset + (i + 1) * colorStep) % n) + 1], fg = C.mantle }
        local z = { bg = colorPaletteList[((colorOffset + (i + 2) * colorStep) % n) + 1], fg = C.mantle }

        local modeConfig = {a=a, b=b, c=c, x=x, y=y, z=z}
        config[mode] = modeConfig
    end
    return config
end

return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local C = require("catppuccin.palettes").get_palette("mocha")
        require("lualine").setup {
            options = {
                theme = M.lualineAutoPalette(colorPaletteList, 3, 1), 
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

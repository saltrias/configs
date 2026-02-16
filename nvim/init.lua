-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--- set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" 
if not vim.loop.fs_stat(lazypath) then 
    print("lazyvim not installed??") 
    return end 
vim.opt.rtp:prepend(lazypath)

local map = vim.keymap.set
local setColor = vim.api.nvim_set_hl

function lualineAutoPalette(colorPallete, colorOffset, colorStep)
    colorOffset = colorOffset or 0
    colorStep = colorStep or 1

    local config = {}
    local modes = { "normal", "insert", "visual", "replace", "command" } 
    local n = #colorPaletteList

    for i, mode in ipairs(modes) do
        a = { bg = colorPaletteList[((colorOffset + (i - 1) * colorStep) % n) + 1], fg = C.mantle, gui="bold" }
        b = { bg = colorPaletteList[((colorOffset + (i - 0) * colorStep) % n) + 1], fg = C.mantle }
        c = { bg = C.mantle, fg = C.text }
        x = { bg = C.mantle, fg = C.text }
        y = { bg = colorPaletteList[((colorOffset + (i + 1) * colorStep) % n) + 1], fg = C.mantle }
        z = { bg = colorPaletteList[((colorOffset + (i + 2) * colorStep) % n) + 1], fg = C.mantle }

        modeConfig = {a=a, b=b, c=c, x=x, y=y, z=z}
        config[mode] = modeConfig
    end
    return config
end

C = {
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

colorPaletteList = {
    C.red,
    C.peach,
    C.yellow,
    C.green,
    C.blue,
    C.mauve,
}

-- colorPaletteList = {
    -- C.red,
    -- C.maroon,
    -- C.peach,
    -- C.yellow,
    -- C.yellow,
    -- C.green,
    -- C.green,
    -- C.teal,
    -- C.blue,
    -- C.sapphire,
    -- C.mauve,
    -- C.pink,
-- }



-- load za plugins
require("lazy").setup({

    -- the theme 
    { 
        "catppuccin/nvim",
        name = "catppuccin", 
        priority = 1000,
        
        config = function()

            require("catppuccin").setup {
                integrations = {
                    lualine = true,
                    indent_blankline = { enabled = true },
                    dashboard = true,
                    telescope = {
                        enabled = true
                    },
                }, 
            }
        end,
    }, 
     
    -- COOL THINGYS
    {
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
    },
    
    {
        "nvim-telescope/telescope.nvim", version="*",
        name="telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup()
        end,
    },

    {
        'nvimdev/dashboard-nvim',
        opts = function()
            local logo = [[
    _    _       _           
   / \  | |_   _(_)_ __ ___  
 / _ \ | \ \ / / | '_ ` _ \
 / ___ \| |\ V /| | | | | | |
/_/   \_\_| \_/ |_|_| |_| |_|
]]
            logo = string.rep("\n", 4) .. logo .. "\n\n"
            
            local opts = {
                theme = "doom",

                config = {
                    header = vim.split(logo, "\n"),

                    center = {
                        { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
                        { action = "ene", desc = " New File", icon = " ", key = "n" },
                        { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
                    },

                    footer = function()
                        return { "Neovim, very nice!" }
                    end,
                }
            }
        return opts
	end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    
})

vim.cmd.colorscheme "catppuccin-mocha"


-- make sure neovim is using the system clipboard
vim.opt.clipboard = "unnamedplus"

-- general options
vim.opt.virtualedit = "onemore"
vim.opt.number = true
vim.opt.relativenumber = true

-- disable arrow keys
-- trust me, i will become good i think
map({"n", "v", "i", "c"}, "<Up>", "<NOP>")
map({"n", "v", "i", "c"}, "<Down>", "<NOP>")
map({"n", "v", "i", "c"}, "<Left>", "<NOP>")
map({"n", "v", "i", "c"}, "<Right>", "<NOP>")

-- soft tab setup
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.scrolloff = 5

setColor(0, 'LineNrAbove', { fg=C.red })
setColor(0, 'LineNr', { fg=C.mauve })
setColor(0, 'LineNrBelow', { fg=C.sapphire })

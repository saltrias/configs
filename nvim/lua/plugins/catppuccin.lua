return { 
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

        vim.cmd.colorscheme "catppuccin-mocha"

        local colors = require("al.colors")
        local C = colors.palette
        local setColor = vim.api.nvim_set_hl 

        setColor(0, 'LineNrAbove', { fg=C.red })
        setColor(0, 'LineNr', { fg=C.mauve })
        setColor(0, 'LineNrBelow', { fg=C.sapphire })

    end,
} 

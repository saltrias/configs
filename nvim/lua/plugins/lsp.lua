return {
    {
        "williamboman/mason.nvim",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" }
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                }, 

                mapping = cmp.mapping.preset.insert({
                    ["<cr>"] = cmp.mapping.confirm( { select = true } ),

                    ["<S-j>"] = cmp.mapping.select_next_item(),
                    ["<S-k>"] = cmp.mapping.select_prev_item(),
                    
                }),

                sources = {
                  { name = "nvim_lsp" },
                  { name = "buffer" },
                  { name = "path" },
                  { name = "luasnip" },
                },

            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local servers = {
                "clangd",
                "cssls",
                "html",
                "rust-analyzer",
                "typescript-language-server"
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities
                })
                
                vim.lsp.enable(server)
            end

            vim.lsp.config("clangd", {
                capabilities = capabilities 
            })

            vim.lsp.enable("clangd")

            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
            })
        end
	}
}


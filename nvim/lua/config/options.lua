local opt = vim.opt
local alias = vim.api.nvim_create_user_command

-- neovide needs this.
opt.termguicolors = true

opt.clipboard = "unnamedplus"
opt.virtualedit = "onemore"
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.scrolloff = 7

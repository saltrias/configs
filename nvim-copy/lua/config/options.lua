local opt = vim.opt
local alias = vim.api.nvim_create_user_command

-- neovide needs this.
opt.termguicolors = true

opt.clipboard = "unnamedplus"
opt.virtualedit = "onemore"
opt.number = true
opt.relativenumber = true

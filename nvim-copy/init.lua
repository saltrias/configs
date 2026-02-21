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

require("config.options")
require("config.keybinds")

-- load za plugins
require("lazy").setup("plugins")

-- You can change the appearance of the bufferline separators by setting the
-- `separator_style`. The available options are:
-- * `slant` - Use slanted/triangular separators
-- * `padded_slant` - Same as `slant` but with extra padding which some terminals require.
  -- If `slant` does not render correctly for you try padded this instead.
-- * `slope` - Use slanted/triangular separators but slopped to the right
-- * `padded_slope` - Same as `slope` but with extra padding which some terminals require.
  -- If `slope` does not render correctly for you try padded this instead.
-- * `thick` - Increase the thickness of the separator characters
-- * `thin` - (default) Use thin separator characters
-- * finally you can pass in a custom list containing 2 characters which will be
  -- used as the separators e.g. `{"|", "|"}`, the first is the left and the
  -- second is the right separator


-- make sure neovim is using the system clipboard

-- soft tab setup
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.scrolloff = 7


-- neovide config
if vim.g.neovide then
    vim.o.guifont="JetBrainsMono NFM"
end

vim.api.nvim_create_user_command('Teff', function()
  require('telescope.builtin').find_files()
end, {})

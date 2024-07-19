local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('config.core.keymaps')
require('config.plugins-setup')
require('config.core.options')
require('config.core.colorscheme')
require('config.plugins.catpuccin')
require('config.plugins.conform')
require('config.plugins.neo-tree')
require('config.plugins.nvim-cmp')
require('config.plugins.nvim-lspconfig')
require('config.plugins.telescope')
require('config.plugins.treesitter')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

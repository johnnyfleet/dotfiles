--- Initial vim config
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = fale
vim.opt.autoindent = true
vim.opt.colorcolumn = '88'

--- Key mappings
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})

--- Setup package manager
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

--- Install packages. Place more in the loop here as needed. 
require('packer').startup(function(use)
  --- Package manager
  use 'wbthomason/packer.nvim'

  --- Theme inspired by Atom
  use 'joshdick/onedark.vim'

	---Good looking status line
	use 'nvim-lualine/lualine.nvim'

	--Goyo, distraction free editing and paragraph highlighting
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'

	--- Todo comment highlighting
	use "folke/todo-comments.nvim"	

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

-- Set additional options post install
vim.opt.termguicolors = true
-- Set colourscheme
vim.cmd('colorscheme onedark')

require('lualine').setup({
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
	}
})

require('todo-comments').setup()

-- Preamble
--
-- References: 
-- https://github.com/glepnir/nvim

-- Helpers
local home = os.getenv("HOME")

-- Plugin Config
require("plugins")

vim.opt.termguicolors = true
require("feline").setup()

vim.g.vimwiki_list = {
	{
		name = 'Personal Wiki',
		path = '~/wiki/personalwiki',
		syntax = 'markdown',
		ext = '.wiki',
	},
	{
		name = 'Cat Wiki',
		path = '~/wiki/cat-wiki.wiki',
		syntax = 'media',
		ext = '.md',
	}
}


-- General Settings

-- Start with all folds open and default to a sane fold method.  Filetypes
-- should override the fold method.
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.showcmd = true -- Show what's been typed so far in command pending mode

-- Good default tab settings. 
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true

vim.opt.number = true  -- Line Numbers!

vim.opt.fileformats="unix" -- Show those ^M's when editing a windows file

vim.opt.backup = false
vim.opt.writebackup = true

-- This used to be where I set my backup, swap, and undo directories, but the defaults are sensible now.
vim.opt.undofile = true -- Persistent Undo History


-- Mappings
vim.api.nvim_set_keymap('n', '<Space>', 'za', {noremap = true})
vim.api.nvim_set_keymap('v', '<Space>', 'za', {noremap = true})

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<esc>', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-u>', 'gUiwe', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-u>', '<esc>gUiwea', {noremap = true})


-- Generic Config
vim.opt.termguicolors = true

-- Plugin Config
require("plugins")

require("feline").setup()

vim.g.vimwiki_list = {
	{
		name = 'Personal Wiki',
		path = '~/personalwiki',
		syntax = 'markdown',
		ext = '.wiki',
	}
}


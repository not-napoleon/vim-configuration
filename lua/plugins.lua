return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Status line
  use 'feline-nvim/feline.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'vimwiki/vimwiki'
end)

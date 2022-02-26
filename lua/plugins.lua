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


-- Movements, gestures, and commands{{{2
  use 'easymotion/vim-easymotion'                -- Fast in document movement
  use 'AndrewRadev/sideways.vim'                 -- Move items around in lists
  use 'tomtom/tcomment_vim'                      -- Block commenting
  use 'tpope/vim-surround'                       -- Handle paired markers
  use 'tpope/vim-unimpaired'                     -- Paired short-cuts with braces

-- Interface Mods {{{2
  use 'godlygeek/tabular'                        -- Align text as needed
  use 'haya14busa/incsearch.vim'                 -- Better incremental search
  use 'lfv89/vim-interestingwords'               -- Arbitrary highlights

-- Colorschemes {{{2
  use 'altercation/vim-colors-solarized'         -- Solarized color scheme
  use 'blueshirts/darcula'
  use 'freeo/vim-kalisi'
  use 'jscappini/material.vim'
  use 'michalbachowski/vim-wombat256mod'
  use 'romainl/Apprentice'
  use 'vim-scripts/Perfect-Dark'
  use 'vim-scripts/moria'
  use 'xero/blaquemagick.vim'
  use 'xero/sourcerer.vim'

-- External Systems {{{2

-- Wiki Tools {{{2
  use 'vimwiki/vimwiki'


-- Completion {{{2
  use 'not-napoleon/vim-byline'                  -- Sign your work
  use 'tpope/vim-abolish'                        -- Better abbreviations

-- Meta {{{2
  use 'tpope/vim-repeat'                         -- Enable dot repeat for plugins

-- Other {{{2

end)

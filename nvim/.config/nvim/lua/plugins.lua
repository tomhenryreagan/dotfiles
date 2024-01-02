return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        -- VimWiki
        use 'vimwiki/vimwiki'
        -- Vim Airline
        use 'vim-airline/vim-airline'
        -- Vim Pencil
        use 'preservim/vim-pencil'
        -- Orgmode (I no longer use this as of 03-23-2023)
        -- use {'nvim-orgmode/orgmode', config = function()
        --  require('orgmode').setup({})
        -- end
        -- }
end)

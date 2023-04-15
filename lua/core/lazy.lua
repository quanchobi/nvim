--[[       __            _
    ____  / /_  ______ _(_)___  _____
   / __ \/ / / / / __ `/ / __ \/ ___/
  / /_/ / / /_/ / /_/ / / / / (__  )
 / .___/_/\__,_/\__, /_/_/ /_/____/
/_/            /____/            --]]

-- Install lazy if it doesn't already exist
local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('core.plugins')

--[[
-- Automagically regenerate plugins on write (not working?)
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerCompile
    augroup end
]]--)

--[[
-- Now featuring packer!
return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Visual plugins
  use({
       "catppuccin/nvim",
       as = "catppuccin",
  })
  use({
       'nvim-lualine/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons'},
       })
  use('nvim-tree/nvim-tree.lua') -- file explorer

  -- Telescope search
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-lua/popup.nvim'},
          {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
          {'nvim-telescope/telescope-dap.nvim'}
        }
  }

  -- Treesitter syntax integration
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Auto closing and commenting
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  -- Git integration
  use('tpope/vim-fugitive')

  -- Language Server Protocol integration
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp-signature-help'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

          -- LaTeX
          {'lervag/vimtex'},
          {'iurimateus/luasnip-latex-snippets.nvim'},
	  }
  }

  -- Debugging
  use {
      'rcarriga/nvim-dap-ui', -- VS Code like debugging
      requires = {
          {'mfussenegger/nvim-dap'},
      }
  }
  use('dense-analysis/ale') -- Linting

  -- Floaterm
  use 'voldikss/vim-floaterm'

end)
--]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use {'junegunn/seoul256.vim'}

  -- vim-fugitive
  use {'tpope/vim-fugitive'}

  -- nvim-autopairs
  use {'windwp/nvim-autopairs'}
  require('nvim-autopairs').setup{}

  -- fzf-lua
  use {'ibhagwan/fzf-lua'}
  require'fzf-lua'.setup {
    winopts = {
      height = 0.90,
      width  = 0.99,
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --hidden --color=always --smart-case --max-columns=512",
    },
  }

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
    }
  }
  require('telescope').load_extension('fzf')
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  require('telescope').setup{
    defaults = {
      layout_config = { width = 0.96 },
    }
  }
  use {'nvim-telescope/telescope-dap.nvim'}

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end
  }

  -- lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'seoul256'
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1
            }
          }
        }
      })
    end
  }

  -- vim-signify
  use {'mhinz/vim-signify'}

  -- emmet-vim
  use {'mattn/emmet-vim'}

  -- tagbar
  use {'preservim/tagbar'}
  vim.g.tagbar_ctags_bin = '/usr/local/bin/ctags'

  -- vim-illuminate
  use {'RRethy/vim-illuminate'}
  vim.cmd([[
  augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
  augroup END
  ]])

  -- comment
  use({
    "winston0410/commented.nvim",
    config = function()
      require("commented").setup({
        keybindings = {n = "gc", v = "gc", nl = "gcc"}
      })
    end,
  })

  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true,              -- false will disable the whole extension
        }
      })
    end,
  }

  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  -- nvim-jdtls
  use {'mfussenegger/nvim-jdtls'}

  -- debugger
  use {'mfussenegger/nvim-dap'}
  use {'leoluz/nvim-dap-go'}
  require('dap-go').setup{}

  -- LSP, Cmp
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'rafamadriz/friendly-snippets'}
  use {'onsails/lspkind-nvim'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

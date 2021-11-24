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

  -- fzf
  use {'junegunn/fzf', run = ":call fzf#install()" }
  use {'junegunn/fzf.vim'}

  vim.g.fzf_nvim_statusline = 0 -- disable statusline overwriting
  vim.g.fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-s'] = 'split',
    ['ctrl-v'] = 'vsplit'
  }

  -- ripgrep with fzf:
  vim.cmd [[
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --hidden --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)
  ]]

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
      {'nvim-telescope/telescope-fzf-writer.nvim'}
    },
    config = function() require'telescope'.setup {
      extensions = {
        fzf_writer = {
          minimum_grep_characters = 2,
          minimum_files_characters = 2,
          use_highlighter = true,
        }
      }
    }
    end
  }
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('fzf_writer')
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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

  -- any-jump
  use {'pechorin/any-jump.vim'}
  vim.g.any_jump_disable_default_keybindings = 1
  vim.g.any_jump_window_width_ratio  = 0.8
  vim.g.any_jump_window_height_ratio = 0.9

  -- vim-illuminate
  use {'RRethy/vim-illuminate'}
  vim.cmd('hi illuminatedWord cterm=undercurl gui=undercurl')

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

  -- LSP, Cmp
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
  use {'L3MON4D3/LuaSnip'}         -- Snippets plugin
  use {'onsails/lspkind-nvim'}

  -- -- coq_nvim
  -- use {
    -- 'ms-jpq/coq_nvim',
    -- branch = 'coq',
  -- }
  -- use {
    -- 'ms-jpq/coq.artifacts',
    -- branch = 'artifacts',
  -- }
  -- use {
    -- 'ms-jpq/coq.thirdparty',
    -- branch = '3p',
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

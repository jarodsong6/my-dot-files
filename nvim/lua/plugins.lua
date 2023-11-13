local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

return require('lazy').setup({

  'tpope/vim-fugitive',
  'mhinz/vim-signify',
  'mattn/emmet-vim',
  'mfussenegger/nvim-jdtls',
  'RRethy/vim-illuminate',
  'Exafunction/codeium.vim',

  -- LSP, Cmp
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'rafamadriz/friendly-snippets',
  'onsails/lspkind-nvim',

  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "gopls", "groovyls", "jdtls", "jedi_language_server", "tsserver" , "lua_ls" },
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
      })
    end,
  },

  -- comment
  {
    "winston0410/commented.nvim",
    config = function()
      require("commented").setup({
        keybindings = {n = "gc", v = "gc", nl = "gcc"}
      })
    end,
  },

  -- debugger
  'mfussenegger/nvim-dap',
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup({})
    end,
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
      })
    end,
  },

  -- fzf-lua
  {
    'ibhagwan/fzf-lua',
    config = function()
      require('fzf-lua').setup({
        winopts = {
          height = 0.90,
          width  = 0.99,
        },
        grep = {
          rg_opts = "--column --line-number --no-heading --hidden --color=always --smart-case --max-columns=512",
        },
      })
    end,
  },

  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup({
        history = 16,
      })
    end,
  },

  -- Telescope
  {'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = { width = 0.96 },
        }
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('neoclip')
    end,
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-dap.nvim',

  -- hop
  {
    'phaazon/hop.nvim',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end
  },

  -- lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', lazy = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin'
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1
            }
          },
        },
      })
    end
  },

  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {"bash", "cmake", "comment", "css", "dockerfile", "dot", "fish", "go", "html", "http", "java", "javascript", "jsdoc", "json", "json5", "lua", "make", "markdown", "python", "regex", "scss", "tsx", "typescript", "vim", "yaml"},
        highlight = {
          enable = true,              -- false will disable the whole extension
        }
      })
    end,
  },

  -- file-explore
  {
    "nvim-neo-tree/neo-tree.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
      },
      config = function ()
        -- See ":help neo-tree-highlights" for a list of available highlight groups
        vim.cmd([[
          hi link NeoTreeDirectoryName Directory
          hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
        ]])

        require("neo-tree").setup({
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          default_component_configs = {
            git_status = {
              highlight = "NeoTreeDimText", -- if you remove this the status will be colorful
            },
          },
          filesystem = {
            filtered_items = { --These filters are applied to both browsing and searching
              hide_dotfiles = false,
              hide_gitignored = false,
            },
            window = {
              width = 40,
              mappings = {
                ["<c-s>"] = "open_split",
                ["<c-v>"] = "open_vsplit",
              }
            }
          },
          buffers = {
            show_unloaded = true,
            window = {
              mappings = {
                ["<c-s>"] = "open_split",
                ["<c-v>"] = "open_vsplit",
              }
            },
          }
        })
        vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
      end
  },

  -- trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
      })
    end,
  },

  -- tagbar
  'preservim/tagbar',
})

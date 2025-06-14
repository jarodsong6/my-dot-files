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
  'RRethy/vim-illuminate',
  --  'Exafunction/codeium.vim',
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestions = { enable = false },
        panels = { enable = false },
        server_opts_overrides = {
          trace = 'verbose',
          cmd = {
            vim.fn.expand("~/.local/share/nvim/mason/bin/copilot-language-server"),
            "--stdio"
          },
        },
        filetypes = { ["*"] = true },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              name = "copilot",
              schema = {
                model = {
                  default = "claude-sonnet-4"
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "copilot",
            slash_commands = {
              ["buffer"] = {
                callback = "strategies.chat.slash_commands.buffer",
                description = "Insert open buffers",
                opts = {
                  contains_code = true,
                  provider = "telescope",
                },
              },
            },
          },
          inline = {
            adapter = "copilot",
          },
          agent = {
            adapter = "copilot",
          },
        },
        display = {
          action_palette = {
            provider = "telescope",
          },
        },
      })
    end,
  },


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
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "copilot-language-server",
          { 'golangci-lint', version = 'v1.54.2' },
          "gopls",
          "pyright",
          "ts_ls",
          "lua_ls",
          "delve",
        },
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
      })
    end,
  },

  {
    "winston0410/commented.nvim",
    config = function()
      require("commented").setup({
        keybindings = { n = "gc", v = "gc", nl = "gcc" }
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "delve"
          },
        },
      },
    },
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
      })
    end,
  },

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

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = { width = 0.96 },
        }
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('neoclip')
      require("telescope").load_extension("aerial")
    end,
  },
  'nvim-telescope/telescope-dap.nvim',

  {
    'phaazon/hop.nvim',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
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

  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
      require('tiny-devicons-auto-colors').setup({
        colors = require("catppuccin.palettes").get_palette("frappe"),
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "cmake",
          "comment",
          "css",
          "dockerfile",
          "dot",
          "fish",
          "go",
          "html",
          "http",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "lua",
          "make",
          "markdown",
          "python",
          "regex",
          "scss",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "cue",
          "terraform",
        },
        highlight = {
          enable = true, -- false will disable the whole extension
        }
      })
    end,
  },

  -- file-explore
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = function()
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
            auto_expand_width = true,
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

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
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

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require('notify').setup({
        background_colour = "#000000",
      })
    end,
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup({
        layout = {
          max_width = { 200, 0.5 },
          resize_to_content = true,
        },
      })
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    },
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
  },

  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'golangcilint' },
      }
    end,
  },
})

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#783a3f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#886e3f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#4e683b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#416c71 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#2c618c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#6d427b gui=nocombine]]
vim.o.spell = true

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- markdown
        "marksman",
        "misspell",

        -- lua
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",
        "tailwindcss-language-server",

        -- docker
        "dockerfile-language-server",
        "docker-compose-language-service",

        -- go
        "gopls",
        "glint",
        "go-debug-adapter",
        "goimports",
        "goimports-reviser",
        "golangci-lint",
        "golangci-lint-langserver",
        "golines",
        "gotests",
        "gotestsum",
        "gomodifytags",
        "gofmt",

        -- python
        "pyright",
        "flake8",
        "black",
        "mypy",
        "pydocstyle",
        "pylint",
        "pyre",
        "autoflake",
        "autopep8",
        "python-lsp-server",

        -- yaml
        "terraform-ls",
        "tflint",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",

        -- sql
        "sqlfluff",
        "sqls",

        -- java
        "jdtls",

        -- json
        "json-lsp",
      },
    },
  },

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local null_ls = require "null-ls"

        local formatting = null_ls.builtins.formatting
        -- local lint = null_ls.builtins.diagnostics
        -- local code_actions = null_ls.builtins.code_actions

        local sources = {
          formatting.prettier,
          formatting.stylua,
          formatting.gofmt,
        }

        null_ls.setup {
          debug = true,
          sources = sources,
        }
      end,
    },
    config = function()
      local configs = require "plugins.configs.lspconfig"
      local on_attach = configs.on_attach
      local capabilities = configs.capabilities

      local lspconfig = require "lspconfig"

      local servers = {
        "html",
        "cssls",
        "clangd",
        "vimls",
        "gopls",
        "pyright",
        "yamlls",
        "cmake",
        "terraformls",
        "tsserver",
        "jdtls",
        "tailwindcss",
        "jsonls",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- low level
        "c",

        -- rest
        "go",
        "java",
        "python",
        "markdown",
        "markdown_inline",
        "terraform",
        "csv",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "center",
        layout_config = {
          preview_cutoff = 0,
          anchor = "S",
          height = 0.5,
          width = 0.99,
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "•",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "⭑",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Rainbow brackets plugin
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        use_treesitter = true,
        space_char_blankline = " ",
        show_current_context_start = true,
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
        show_current_context = true,
        filetype_exclude = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover" },
        buftype_exclude = { "terminal", "nofile" },
        context_patterns = {
          "class",
          "function",
          "method",
          "block",
          "list_literal",
          "selector",
          "^if",
          "^table",
          "if_statement",
          "while",
          "for",
          "loop",
          "fn",
          "func",
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function(_, opts)
          local dap = require "dap"
          local dapui = require "dapui"
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open {}
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close {}
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close {}
          end
          -- require("custom.configs.dap")
          local dap_breakpoint = {
            error = {
              text = "🛑",
              texthl = "LspDiagnosticsSignError",
              linehl = "",
              numhl = "",
            },
            rejected = {
              text = "",
              texthl = "LspDiagnosticsSignHint",
              linehl = "",
              numhl = "",
            },
            stopped = {
              text = "⭐️",
              texthl = "LspDiagnosticsSignInformation",
              linehl = "DiagnosticUnderlineInfo",
              numhl = "LspDiagnosticsSignInformation",
            },
          }

          vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
          vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
          vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
        end,
      },

      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          -- Makes a best effort to setup the various debuggers with
          -- reasonable debug configurations
          automatic_installation = true,

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},

          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
            "python",
            "delve",
          },
        },
      },
    },

    -- config = function()
    --   local Config = require("lazyvim.config")
    --   vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    --
    --   for name, sign in pairs(Config.icons.dap) do
    --     sign = type(sign) == "table" and sign or { sign }
    --     vim.fn.sign_define(
    --       "Dap" .. name,
    --       { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
    --     )
    --   end
    -- end,
  },

  -- Add temp solution to fix context commenting for tsx files 
  -- Keep eye on this PR https://github.com/numToStr/Comment.nvim/pull/133
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}

return plugins

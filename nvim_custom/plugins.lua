local plugins = {
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "custom.configs.null-ls"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",

        -- web
        "css-lsp",
        "html-lsp",
        "tailwindcss-language-server",

        -- misc
        "yaml-language-server",

        -- rails
        "solargraph",
      }
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "lua",
        "ruby",
        "dockerfile",
        "typescript",
        "tsx",
        "yaml",
      }
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      diagnostics = {
        enable = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false
          }
        }
      }
    }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "norg",
        "",
      },
    }
  }
}

return plugins

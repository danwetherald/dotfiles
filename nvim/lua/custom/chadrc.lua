local M = {}

-- Custom plugins
local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

M.plugins = {

  status = {
    colorizer = true
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },

    statusline = {
      separator_style = "round",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  },

  user = userPlugins,

  remove = {
    "akinsho/bufferline.nvim"
  }
}

-- Custom UI / Theme
M.ui = {
   theme = "nightowl",
}

-- Custom mappings
M.mappings = require "custom.mappings"

return M

return {
  ["nkrkv/nvim-treesitter-rescript"] = {},
  ["rescript-lang/vim-rescript"] = {ft = "rescript"},

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
    end,
  },

  ["glepnir/dashboard-nvim"] = {
    config = function()
      require("custom.plugins.dashboard-nvim").setup()
    end,
  }
}

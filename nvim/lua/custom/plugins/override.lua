local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "lua",
    "ruby",
    "tsx",
    "prisma",
    "graphql",
    "dockerfile",
    "rescript"
  },
}

M.nvimtree = {
  diagnostics = {
    enable = true
  },
  git = {
    enable = true
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = { "<CR>"}, action = "edit_no_picker" },
        { key = { "v"}, action = "vsplit" },
        { key = { "s"}, action = "split" },
      }
    }
  }
}

return M

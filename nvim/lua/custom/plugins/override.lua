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
  }
}

M.nvimtree = {
  diagnostics = {
    enable = true
  },
  git = {
    enable = true
  },
  view = {
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { "<CR>"}, action = "edit_no_picker" },
        { key = { "v"}, action = "vsplit" },
        { key = { "s"}, action = "split" },
        { key = { "<C-e>"}, action = "" },
      }
    }
  }
}

return M

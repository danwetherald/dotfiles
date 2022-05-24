local M = {}

M.custom = {
   n = {
      ["<leader>,"] = { "<cmd> w <CR>", "﬚  save file" },
      ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
      ["<space>"] = { "<cmd> set hlsearch! hlsearch? <CR>", "toggle highlighted search" },
      ["<leader>t"] = { "<cmd> Telescope find_files <CR>", "  find files" },
      ["<leader>r"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
   },

   i = {
      ["jj"] = { "<ESC>", "escape" },
   }
}

return M

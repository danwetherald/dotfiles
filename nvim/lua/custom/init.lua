-- Close if only tree is open
vim.api.nvim_create_autocmd('BufEnter', {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})

vim.g.mapleader = ","

vim.wo.wrap = false

vim.opt.relativenumber = true

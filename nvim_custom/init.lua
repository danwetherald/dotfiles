-- Close if only tree is open
vim.api.nvim_create_autocmd("BufEnter", {
	command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
	nested = true,
})

vim.g.mapleader = ","

vim.wo.wrap = false

vim.opt.relativenumber = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backspace = { "indent", "eol,start" }

-- Enable true colors
if vim.opt.termguicolors then
	vim.opt.termguicolors = true
end

vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/json"

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local parsers = {
				"ruby",
				"embedded_template",
				"html",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"json",
				"yaml",
				"bash",
				"lua",
			}

			-- Install missing parsers asynchronously
			require("nvim-treesitter").install(parsers)

			-- Enable highlighting (and tree-sitter indent) per filetype
			local filetypes = {
				"ruby",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"json",
				"yaml",
				"sh",
				"bash",
				"lua",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					local buf = args.buf
					pcall(vim.treesitter.start, buf)
					-- Tree-sitter indent (skip ruby, matching previous config)
					if vim.bo[buf].filetype ~= "ruby" then
						vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}

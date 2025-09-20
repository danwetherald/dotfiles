return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"ruby",
					"embedded_template",
					"html",
					"javascript",
					"typescript",
					"css",
					"json",
					"yaml",
					"bash",
					"lua",
				},
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true, disable = { "ruby" } },
			})
		end,
	},
}

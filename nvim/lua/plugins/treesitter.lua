return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
				indent = { enable = false },
			})

			vim.treesitter.language.register("html", { "eruby" })
		end,
	},
}

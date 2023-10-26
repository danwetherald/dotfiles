local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"lua-language-server",
				"stylua",

				-- web
				"css-lsp",
				"html-lsp",
				"tailwindcss-language-server",

				-- misc
				"yaml-language-server",

				-- rails
				"ruby-lsp",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"html",
				"css",
				"javascript",
				"json",
				"toml",
				"lua",
				"ruby",
				"dockerfile",
				"typescript",
				"tsx",
				"yaml",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			diagnostics = {
				enable = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				local ls = require("luasnip")

				ls.filetype_extend("ruby", { "rails" })
				ls.filetype_extend("eruby", { "html", "rails", "ruby" })
			end,
		},
		opts = {
			filetype_extend = {
				"eruby",
				"ruby",
			},
		},
	},
}

return plugins

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			html = { "prettier" },
			eruby = { "erb_format" },
			ruby = { "rubocop" },
		},
	},
}

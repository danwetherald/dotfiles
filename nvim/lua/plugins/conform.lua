return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if ft == "ruby" or ft == "eruby" then
				return { lsp_fallback = true, timeout_ms = 2000 }
			end
			return { lsp_fallback = true }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			html = { "prettier" },
			eruby = { "erb_format" },
		},
	},
}

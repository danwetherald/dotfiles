return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure servers via the new vim.lsp.config API (nvim 0.11+)
			-- Lua (for editing your Neovim config)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							-- Prevent underline for global `vim`
							globals = { "vim" },
						},
						workspace = {
							-- Make server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})
			vim.lsp.config("ruby_lsp", {
				capabilities = capabilities,
				cmd = (function()
					if vim.fn.filereadable("bin/ruby-lsp") == 1 then
						return { "bin/ruby-lsp" }
					end
					if vim.fn.executable("bundle") == 1 and vim.uv.fs_stat("Gemfile") then
						return { "bundle", "exec", "ruby-lsp" }
					end
					return { "ruby-lsp" }
				end)(),
				init_options = {
					formatter = "syntax_tree",
					addonSettings = {
						["Ruby LSP Rails"] = {
							enablePendingMigrationsPrompt = false,
						},
					},
				},
			})
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})

			-- Enable filetype-based activation for configured servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ruby_lsp")
			vim.lsp.enable("tailwindcss")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}

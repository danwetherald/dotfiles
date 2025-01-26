return {
	"nvim-tree/nvim-tree.lua",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			diagnostics = {
				enable = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>n", "<cmd> NvimTreeToggle <CR>", { desc = "   toggle nvimtree" })
	end,
}

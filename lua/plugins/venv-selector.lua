return {
	{
		"venv-selector.nvim",
		auto_enable = true,
		event = "FileType",
		ft = { "python" },
		after = function(_)
			require("venv-selector").setup({
				options = {
					override_notify = false,
				},
			})
			vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Select venv" })
		end,
	},
}

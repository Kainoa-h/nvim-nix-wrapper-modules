return {
	{
		"no-neck-pain.nvim",
		auto_enable = true,
		event = "DeferredUIEnter",
		after = function(plugin)
			require("no-neck-pain").setup({
				width = 100,
				buffers = {
					right = { enabled = false },
					scratchPad = {
						enabled = true,
						location = "~/no-neck-pain.nvim/",
					},
					bo = {
						filetype = "md",
					},
				}
			})
			vim.keymap.set("n", "<leader>bg", "<CMD>NoNeckPain<CR>")
		end
	}
}

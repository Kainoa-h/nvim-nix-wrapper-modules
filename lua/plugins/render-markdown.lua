return {
	{
		"mini.icons",
		dep_of = { "render-markdown.nvim" },
	},
	{
		"render-markdown.nvim",
		auto_enable = true,
		event = "FileType",
		ft = { "markdown" },
		after = function(plugin)
			local md = require("render-markdown")
			md.setup({})
			vim.keymap.set("n", "<leader>um",function() md.toggle() end, { desc = "Toggle Markdown" })
			vim.keymap.set("n", "<leader>up",function() md.preview() end, { desc = "Preview Markdown" })
		end,
	},
}

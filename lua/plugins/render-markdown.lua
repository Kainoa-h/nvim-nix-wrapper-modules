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
			Snacks.toggle
				.new({
					name = "Toggle Markdown",
					get = md.get,
					set = md.set,
				})
				:map("<leader>um")
			vim.keymap.set("n", "<leader>up", function()
				md.preview()
			end, { desc = "Preview Markdown" })
		end,
	},
}

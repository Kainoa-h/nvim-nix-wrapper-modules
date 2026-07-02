return {
	{
		"nui.nvim",
		dep_of = { "noice.nvim" },
	},
	{
		"nvim-notify",
		dep_of = { "noice.nvim" },
		after = function(_)
			require("notify").setup({ stages = "fade", timeout = 2000 })
			vim.notify = require("notify")
		end,
	},
	{
		"noice.nvim",
		event = "DeferredUIEnter",
		after = function(_)
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
					},
				},
				routes = {
					{
						filter = { event = "msg_show", any = { { find = "written" }, { find = "bytes" } } },
						view = "mini",
					},
				},
				presets = { bottom_search = true, command_palette = true },
			})
		end,
	},
}

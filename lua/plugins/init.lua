vim.g.firenvim_config = {
	localSettings = {
			['.*'] = {
					takeover = "never",
					selector = "",
			}
	}
}

local specs = {
	{ import = "plugins.colorschemes" },
	{ import = "plugins.flash" },
	{ import = "plugins.firenvim" },
	{
		"nvim-surround",
		auto_enable = true,
		event = "DeferredUIEnter",
		after = function(plugin)
			require("nvim-surround").setup()
		end,
	},
}

if not vim.g.started_by_firenvim then
	vim.list_extend(specs, {
		{ import = "plugins.snacks" },
		{ import = "plugins.lsp" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.conform" },
		{ import = "plugins.lint" },
		{ import = "plugins.blink" },
		{ import = "plugins.lualine" },
		{ import = "plugins.noice" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.bufferline" },
		{ import = "plugins.no-neck-pain" },
		{
			"colorful-menu.nvim",
			auto_enable = true,
			on_plugin = { "blink.cmp" },
		},
		{
			"vim-startuptime",
			auto_enable = true,
			cmd = { "StartupTime" },
			before = function(_)
				vim.g.startuptime_event_width = 0
				vim.g.startuptime_tries = 10
				vim.g.startuptime_exe_path = nixInfo(vim.v.progpath, "progpath")
			end,
		},
		{
			"fidget.nvim",
			auto_enable = true,
			event = "DeferredUIEnter",
			after = function(plugin)
				require("fidget").setup({})
			end,
		},
		{
			"mini.files",
			auto_enable = true,
			event = "DeferredUIEnter",
			after = function(plugin)
				require("mini.files").setup({})
				vim.keymap.set("n", "<leader>fm", "<cmd>lua MiniFiles.open()<CR>", { desc = "Mini Files" })
				vim.keymap.set("n", "<leader>fd", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "Mini Files in dir" })
			end,
		},
		{
			"which-key.nvim",
			auto_enable = true,
			event = "DeferredUIEnter",
			after = function(plugin)
				require("which-key").setup({})
				require("which-key").add({
					{ "<leader><leader>", group = "buffer commands" },
					{ "<leader><leader>_", hidden = true },
					{ "<leader>c", group = "[c]ode" },
					{ "<leader>c_", hidden = true },
					{ "<leader>d", group = "[d]ocument" },
					{ "<leader>d_", hidden = true },
					{ "<leader>g", group = "[g]it" },
					{ "<leader>g_", hidden = true },
					{ "<leader>m", group = "[m]arkdown" },
					{ "<leader>m_", hidden = true },
					{ "<leader>r", group = "[r]ename" },
					{ "<leader>r_", hidden = true },
					{ "<leader>s", group = "[s]earch" },
					{ "<leader>s_", hidden = true },
					{ "<leader>t", group = "[t]oggles" },
					{ "<leader>t_", hidden = true },
					{ "<leader>w", group = "[w]orkspace" },
					{ "<leader>w_", hidden = true },
				})
			end,
		},
	})
end

return specs

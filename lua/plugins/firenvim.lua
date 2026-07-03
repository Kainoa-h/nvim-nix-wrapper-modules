return {
	"firenvim",
	auto_enable = true,
	lazy = not vim.g.started_by_firenvim,
	before = function(_)
		vim.g.firenvim_config = {
			globalSettings = {
				takeover = "never",
			},
		}
	end,
	after = function(_)
		if not vim.g.firenvim_install_done then
			vim.fn["firenvim#install"](0)
			vim.g.firenvim_install_done = true
		end
	end,
}

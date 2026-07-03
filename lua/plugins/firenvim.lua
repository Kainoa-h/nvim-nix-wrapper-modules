return {
	"firenvim",
	auto_enable = true,
	lazy = false,
	after = function(_)
		if not vim.g.firenvim_install_done then
			vim.fn["firenvim#install"](0)
			vim.g.firenvim_install_done = true
		end
	end,
}

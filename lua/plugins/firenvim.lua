return {
	"firenvim",
	auto_enable = true,
	event = "DeferredUIEnter",
	after = function(_)
		if not vim.g.firenvim_install_done then
			vim.fn["firenvim#install"](0)
			vim.g.firenvim_install_done = true
		end
	end,
}

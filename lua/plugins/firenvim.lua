return {
    "firenvim",
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end,
    init = function()
        vim.g.firenvim_config = {
            globalSettings = {
                takeover = "never",
            },
        }
    end,
}

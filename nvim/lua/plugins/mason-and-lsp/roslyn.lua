return {
    {
        "seblyng/roslyn.nvim",
        ---@module 'roslyn.config'
        ---@type roslynnvimconfig


        opts = {
            filewatching = "auto",
            choose_target = nil,
            ignore_target = nil,
            broad_search = true,
            lock_target = true,
            silent = false,
        },
    },
}

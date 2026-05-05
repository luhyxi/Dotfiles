return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs",

        ---@type roslynnvim.config
        opts = {
            filewatching = "auto",
            broad_search = true,
            lock_target = true,
            config = {
                capabilities = require('blink.cmp').get_lsp_capabilities(),
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "fullSolution",
                        dotnet_show_diagnostics_online_help = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            },
        },
    },
}

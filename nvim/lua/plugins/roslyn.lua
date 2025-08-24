return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig

    opts = {
        filewatching = "auto",
        choose_target = nil,
        ignore_target = nil,
        broad_search = false,
        lock_target = false,
        silent = false,
    },

    vim.lsp.config("roslyn", {
        on_attach = function()
            print("This will run when the server attaches!")
        end,
        settings = {
            ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = true,
                csharp_enable_inlay_hints_for_implicit_variable_types = true,
                csharp_enable_inlay_hints_for_types = true,
                csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                dotnet_enable_inlay_hints_for_object_creation_parameters = true
            },
            ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = true,
            },
            ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution",
            },
            ["csharp|symbol_search"] = {
                dotnet_search_reference_assemblies = true
            },
            ["csharp|formatting"] = {
                dotnet_organize_imports_on_format = true
            },
        },
    })
}

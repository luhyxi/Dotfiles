return {
	{
		"cdelledonne/vim-cmake",
		init = function()
			vim.g.cmake_link_compile_commands = 1
			vim.g.cmake_root_markers = { "CMakeLists.txt" }
            vim.g.cmake_default_config = { "build" }
		end,
	},
}

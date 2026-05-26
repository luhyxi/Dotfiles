local M = {}

-- used to setup package opts in vim.pack
function M.setup(mod, opts)
    return function()
        require(mod).setup(opts or {})
    end
end

-- doubt
function M.load(dirs)
    for _, dir in ipairs(dirs) do
        local path = vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/")
        local files = vim.fn.glob(path .. "/*.lua", false, true)
        for _, file in ipairs(files) do
            local mod = dir .. "." .. vim.fn.fnamemodify(file, ":t:r")
            require(mod)
        end
    end
end
return M

require("lindeneg.utils")

local path_map = {
    [OS_NAME.WINDOWS] = "D:/dev/",
    [OS_NAME.UNIX] = "/Users/cl/dev",
}

local base_path = path_map[GetOS()]

-- create header guard for c/cpp
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = "*.h",
    callback = function()
        if base_path == nil then
            return
        end
        local name = string.gsub(vim.api.nvim_buf_get_name(0), "\\", "/")
        name = string.gsub(name, base_path, "")
        name = string.gsub(name, 'src/', '')
        name = string.gsub(name, '/', '_')
        name = string.gsub(name, '-', '_')
        name = string.gsub(name, '%.h', '_h_')
        name = string.upper(name)
        local lines = {}
        table.insert(lines, string.format("#ifndef %s", name))
        table.insert(lines, string.format("#define %s", name))
        table.insert(lines, "")
        table.insert(lines, string.format("#endif // %s", name))
        vim.api.nvim_buf_set_lines(0, 0, 4, false, lines)
    end
})

-- TODO make a new function that abstracts the logic
-- and just takes the extension as argument
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = "*.hpp",
    callback = function()
        if base_path == nil then
            return
        end
        local name = string.gsub(vim.api.nvim_buf_get_name(0), "\\", "/")
        name = string.gsub(name, base_path, "")
        name = string.gsub(name, 'src/', '')
        name = string.gsub(name, '/', '_')
        name = string.gsub(name, '-', '_')
        name = string.gsub(name, '%.hpp', '_hpp_')
        name = string.upper(name)
        local lines = {}
        table.insert(lines, string.format("#ifndef %s", name))
        table.insert(lines, string.format("#define %s", name))
        table.insert(lines, "")
        table.insert(lines, string.format("#endif // %s", name))
        vim.api.nvim_buf_set_lines(0, 0, 4, false, lines)
    end
})

-- auto format for clang
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = "*.{c,h,cpp,hpp}",
    command = "ClangFormat"
})

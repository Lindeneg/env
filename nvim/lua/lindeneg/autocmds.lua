require("lindeneg.utils")

local path_map = {
    [OS_NAME.WINDOWS] = "D:/dev/",
    [OS_NAME.UNIX] = "/Users/cl/dev",
}

local base_path = path_map[GetOS()]

if base_path == nil then
    return
end

-- create header guard for c/cpp
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = "*.{h,hpp}",
    callback = function()
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


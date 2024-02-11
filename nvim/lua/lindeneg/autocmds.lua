local format_ignore_map = {
    c=1, cpp=1,h=1,hpp=1,json=1,
    go=1,javascript=1,js=1,css=1,
    ts=1,typescript=1,html=1,gdscript=1,
    gd=1
}

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        if format_ignore_map[vim.bo.filetype] ~= 1 then
            vim.cmd([[%s/\s\+$//e]])
        end
    end,
    group = format_sync_grp
})

-- format go files on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.go",
    callback = function()
        vim.cmd("GoFmt")
    end,
    group = format_sync_grp
})

-- format with prettier on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.{js,ts,html,css,json}",
    callback = function()
        vim.cmd("Prettier")
    end,
    group = format_sync_grp
})

-- format c/cpp files on save via clang
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.{c,cpp,h,hpp}",
    callback = function()
        vim.cmd("ClangFormat")
    end,
    group = format_sync_grp
})

-- create header guard for c/cpp
BASE_PATH = "D:/dev/"
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = "*.{h,hpp}",
    callback = function()
        local name = string.gsub(vim.api.nvim_buf_get_name(0), "\\", "/")
        name = string.gsub(name, BASE_PATH, "")
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

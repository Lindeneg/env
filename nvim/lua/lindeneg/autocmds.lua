local auto_fmt_ext_ignore = {"c", "cpp", "h", "hpp", "go"}

-- whateverworks man
local function should_fmt_ignore(val)
    for _, value in pairs(auto_fmt_ext_ignore) do
        if value == val then
            return true
        end
    end
    return false
end

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        -- apparantly lua does not have regex support
        -- there's still probably a better way to do this
        if should_fmt_ignore(vim.bo.filetype) then
            return
        end
        vim.cmd([[%s/\s\+$//e]])
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

-- format c/cpp files on save via clang
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.{c,cpp,h,hpp}",
    callback = function()
        vim.cmd("ClangFormat")
    end,
    group = format_sync_grp
})

-- runs single cmd in windows git bash
-- default sh is ps and changing it manually
-- in vim.opt.shell gives undesireable behavior
-- this seems to work great, at least for my needs
vim.api.nvim_create_user_command(
"Run",
function(opts)
    local args = opts["args"]

    vim.cmd("below split")
    vim.cmd("term " .. "bash")

    vim.fn.feedkeys("a")

    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("clear" .. enter)
    vim.fn.feedkeys(args .. enter)
end,
{ nargs = 1 }
)

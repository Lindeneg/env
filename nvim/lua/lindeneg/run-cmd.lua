vim.api.nvim_create_user_command(
"Compile",
function()
    vim.cmd("below split")
    vim.cmd("term " .. "C:\\Users\\chris\\clvs.bat")

    vim.fn.feedkeys("a")

    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("clear" .. enter)
    vim.fn.feedkeys("b" .. enter)
end,
{ nargs = 0 }
)

vim.api.nvim_create_user_command(
"Compile",
function()
    vim.cmd("below split")
    vim.cmd("term")

    vim.fn.feedkeys("a")

    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("cls" .. enter)
    vim.fn.feedkeys(".\\misc\\build.bat" .. enter)
end,
{ nargs = 0 }
)

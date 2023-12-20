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

local comment_map = {
    c="//", cpp="//", h="//", hpp="//", go="//",
    lua="--", python="#", bash="#", js="//", javascript="//",
    ts="//", typescript="//"
}

-- comment out selected lines
-- TODO: make two commands instead of one that
-- (tries) to deduce correct action based on the first
-- two chars on each line. It works 98% but the remaning 2%
-- is annoyning as hell, so just make two seperate commands..
vim.api.nvim_create_user_command(
"Comment",
function()
    -- extension target
    local commentToken = comment_map[vim.bo.filetype]
    if commentToken == nil then
        print(vim.bo.filetype .. " is not supported")
        return
    end

    local commentTokenWithSpace = commentToken .. " "

    -- get selected lines
    local selected_lines = vim.fn.getline("'<", "'>")
    -- map to contain new lines
    local new_lines = {}

    for _, line in ipairs(selected_lines) do
        local first_words = line:match("%S%S?") -- Extract the first two words
        if first_words ~= commentToken then
            table.insert(new_lines, commentTokenWithSpace .. line)
        else
            local l = line.gsub(line, commentTokenWithSpace, "")
            table.insert(new_lines, l)
        end
    end
    vim.api.nvim_buf_set_lines(0, vim.fn.line("'<") - 1, vim.fn.line("'>"), false, new_lines)
end,
{ nargs = 0,
  range = 1
}
)


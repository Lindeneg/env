local COMMENT_MODE = "c"

local comment_map = {
    c="//", cpp="//", h="//", hpp="//", go="//",
    lua="--", python="#", sh="#", js="//", javascript="//",
    ts="//", typescript="//", gdscript="#"
}

vim.api.nvim_create_user_command(
"Comment",
function(opts)
    local is_comment_mode = opts["args"] == COMMENT_MODE
    local commentToken = comment_map[vim.bo.filetype]
    if commentToken == nil then
        print(vim.bo.filetype .. " is not supported")
        return
    end
    local selected_lines = vim.fn.getline("'<", "'>")
    local new_lines = {}
    for _, line in ipairs(selected_lines) do
        --asfasf
        local first_words = line:match("%S%S?")
        if is_comment_mode then
            table.insert(new_lines, commentToken .. line)
        elseif first_words == commentToken then
            local l = line.gsub(line, first_words, "", 1)
            table.insert(new_lines, l);
        else
            table.insert(new_lines, line)
        end
    end
    vim.api.nvim_buf_set_lines(0, vim.fn.line("'<") - 1, vim.fn.line("'>"), false, new_lines)
end,
{ nargs = 1,
range = 1
}
)


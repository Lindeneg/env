require("lindeneg.utils")

local os_map = {
    [OS_NAME.WINDOWS] = {
        build=".\\misc\\build.bat",
        run=".\\/misc\\run.bat"
    },
    [OS_NAME.UNIX] = {
        build="./misc/build.sh",
        run="./misc/run.sh"
    }
}

local os_cmds = os_map[GetOS()]

if os_cmds == nil then
    return
end

local RUN_MODE = "r"

local build_map = {
    typescript="yarn build",
    javascript="yarn build",
    cs="dotnet build",
    rust="cargo check"
}

local run_map = {
    rust="cargo run",
    typescript="yarn start",
    javascript="yarn start",
    cs="dotnet run"
}

local clang = "ClangFormat"
local prettier = "Prettier"
local fmt_map = {
    --go="GoFmt",
    rust="Rustfmt",
    c=clang,
    cpp=clang,
    h=clang,
    hpp=clang,
    typescript=prettier,
    typescriptreact=prettier,
    javascript=prettier,
    html=prettier,
    css=prettier,
    json=prettier
}

vim.api.nvim_create_user_command(
"GenericFormat",
function()
    if vim.bo.filetype == "go" then
        return
    end
    local cmd = fmt_map[vim.bo.filetype]
    if cmd == nil then
        -- just remove trailing whitespaces
        vim.cmd([[%s/\s\+$//e]])
        return
    end
    -- else use the actual formatter
    vim.cmd(cmd)
end,
{ nargs = 0 }
)

local function file_exists(name)
   local f = io.open(name, "r")
   if f ~= nil then
       io.close(f)
       return true
   else
       return false
   end
end

local function get_cmd(is_run_mode, ft)
    if is_run_mode then return run_map[ft] else return build_map[ft] end
end

vim.api.nvim_create_user_command(
"Compile",
function(opts)
    local is_run_mode = opts["args"] == RUN_MODE
    local ft = vim.bo.filetype
    local cmd = get_cmd(is_run_mode, ft)

    if cmd == nil then
        if is_run_mode and file_exists(os_cmds.run) then
            cmd = os_cmds.run
        elseif not is_run_mode and file_exists(os_cmds.build) then
            cmd = os_cmds.build
        else
            return
        end
    end

    vim.cmd("below split")
    vim.cmd("term")

    vim.fn.feedkeys("a")

    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("cls" .. enter)
    vim.fn.feedkeys(cmd .. enter)
end,
{ nargs = 1 }
)

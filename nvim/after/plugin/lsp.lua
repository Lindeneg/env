local lsp = require("lsp-zero")
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ["<Enter>"] = cmp.mapping.confirm({select = false})
    }
})

--require('lspconfig').gdscript.setup({
--  cmd = {'ncat', 'localhost', '6005'},
--})

lsp.preset("recommended")

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup_servers({"lua_ls", "pylsp", "tsserver", "rust_analyzer", "html", "cssls", "csharp_ls", "cmake", "clangd", "gopls", "gdscript"})

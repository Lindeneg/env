local function setup_gruvbox()
    -- https://github.com/morhetz/gruvbox/wiki/Configuration
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_number_column = "bg0"
    vim.g.gruvbox_sign_column = "bg0"

    vim.cmd.colorscheme('gruvbox')
end

setup_gruvbox()


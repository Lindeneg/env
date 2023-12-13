function SetupRosePine()
    -- https://github.com/rose-pine/neovim#options
    require('rose-pine').setup({
        dark_variant = 'main',
        disable_italics = true,
    })

    vim.cmd.colorscheme('rose-pine')

end

function SetupGruvbox()
    -- https://github.com/morhetz/gruvbox/wiki/Configuration
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_number_column = "bg0"
    vim.g.gruvbox_sign_column = "bg0"

    vim.cmd.colorscheme('gruvbox')
end

-- setup gruvbox as default
SetupGruvbox()

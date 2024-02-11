local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",

        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "rose-pine/neovim", name = "rose-pine" },
    'morhetz/gruvbox',
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    'HiPhish/rainbow-delimiters.nvim',
    'fatih/vim-go',
    'rhysd/vim-clang-format',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    "MunifTanjim/prettier.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "habamax/vim-godot"
})

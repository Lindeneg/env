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
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",

        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "Lindeneg/gruvbox",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'darrikonn/vim-gofmt',
    'rhysd/vim-clang-format',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    "MunifTanjim/prettier.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "alx741/vim-rustfmt",
    "Hoffs/omnisharp-extended-lsp.nvim"
    --"github/copilot.vim"
})


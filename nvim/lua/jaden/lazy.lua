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

local plugins = {
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	
	{"mbbill/undotree"},
	
	{"tpope/vim-fugitive"},

	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
    	{"neovim/nvim-lspconfig"},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},


    { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },


    {
        "cpea2506/one_monokai.nvim",
    },

    { 'APZelos/blamer.nvim' },

    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        opts = { useDefaultKeymaps = true }
    },

}
local opts = {}

require("lazy").setup(plugins, opts)

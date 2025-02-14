local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Alpha
Plug('goolord/alpha-nvim')
Plug('nvim-tree/nvim-web-devicons')

-- vscode Theme
Plug('lunarvim/darkplus.nvim')

-- TreeSitter
Plug('nvim-treesitter/nvim-treesitter')

-- Mason
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- LspConfig
Plug('neovim/nvim-lspconfig')

-- Aavic
Plug('SmiteshP/nvim-navic')
Plug('LunarVim/breadcrumbs.nvim')

-- None-ls
Plug('nvimtools/none-ls.nvim')
Plug('nvim-lua/plenary.nvim')

-- Illuminate
Plug('RRethy/vim-illuminate')

-- Telescope
Plug('nvim-telescope/telescope.nvim')

-- NeoTree
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('MunifTanjim/nui.nvim')

-- LuaLine
Plug('nvim-lualine/lualine.nvim')

-- CMP
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-emoji')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('saadparwaiz1/cmp_luasnip')
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')
Plug('hrsh7th/cmp-nvim-lua')
Plug('roobert/tailwindcss-colorizer-cmp.nvim')

-- AutoPairs
Plug('windwp/nvim-autopairs')

-- GitSigns
Plug('lewis6991/gitsigns.nvim')

-- NeoGit
Plug('neogitorg/neogit')

-- IndentLine
Plug('lukas-reineke/indent-blankline.nvim')

-- ToggleTerm
Plug('akinsho/toggleterm.nvim')

-- Notify
Plug('rcarriga/nvim-notify')
Plug('folke/noice.nvim')

-- Colorizer
Plug('ChristianChiarulli/nvim-colorizer.lua')

-- Modicator
Plug('mawkler/modicator.nvim')

-- Matchup
Plug('andymass/vim-matchup')

-- Harpoon
Plug('ThePrimeagen/harpoon')

-- Codeium
-- Plug('Exafunction/codeium.vim')

-- WhichKey
Plug('folke/which-key.nvim')

vim.call('plug#end')

vim.cmd([[colorscheme darkplus]])

require("config.options")
require("plugins.alpha")
require("plugins.treesitter")
require("plugins.mason")
require("plugins.lspconfig")
require("plugins.navic")
require("plugins.none-ls")
require("plugins.illuminate")
require("plugins.telescope")
require("plugins.neotree")
require("plugins.lualine")
require("plugins.cmp")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.neogit")
require("plugins.indentline")
require("plugins.toggleterm")
require("plugins.notify")
require("plugins.colorizer")
require("plugins.modicator")
require("plugins.matchup")
require("plugins.harpoon")
-- require("plugins.codeium")
require("plugins.whichkey")

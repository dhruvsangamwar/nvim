local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
return require("lazy").setup({
    -- undotree
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
    
    -- harpoon
	
    {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	
    -- init.lua:
	
    {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
    
    -- autopairs
	
    {
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
    
    {'williamboman/mason.nvim',},
    
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
      },
    },
	
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, 
	
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	
    {'neovim/nvim-lspconfig'},
	
    {'hrsh7th/cmp-nvim-lsp'},
	
    {'hrsh7th/nvim-cmp'},
	
    {'L3MON4D3/LuaSnip'},
    
    -- tabs
    
    {'romgrk/barbar.nvim',
        dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
          -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
          animation = true,
          insert_at_start = true,
          -- …etc.
        },
    },
})


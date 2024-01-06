local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").reset()
require("packer").init({
	compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
})

local use = require("packer").use

use("wbthomason/packer.nvim")

-- Theme
use({
	"jessarcher/onedark.nvim",
	config = function()
		vim.cmd("colorscheme onedark")
		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background,
			bg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background,
		})

		-- Make the cursor line background invisible
		vim.api.nvim_set_hl(0, "CursorLineBg", {
			fg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
			bg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
		})

		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#30323E" })
	end,
})
use({
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup()
	end,
})
use({ "tpope/vim-surround" })
use({ "tpope/vim-commentary" })
use({ "tpope/vim-sleuth" })
use({ "tpope/vim-repeat" })
use({ "wellle/targets.vim" })
use({
	"nvim-tree/nvim-tree.lua",
	requires = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("prabs/plugins/nvim-tree")
	end,
})
use({ "jessarcher/vim-heritage" })
use({ "tpope/vim-fugitive", dependencies = "tpope/vim-rhubarb" })
use({
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({})
	end,
})
use({
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end,
})
use({
	"goolord/alpha-nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
	end,
})
-- Telescope
use({
	"nvim-telescope/telescope.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	},
	config = function()
		require("prabs/plugins/telescope")
	end,
})
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
	require("packer").sync()
end

-- Syntax
use({
	"nvim-treesitter/nvim-treesitter",
	run = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	requires = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("prabs/plugins/treesitter")
	end,
})

-- Language Server Protocol.
use({
	"neovim/nvim-lspconfig",
	requires = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("prabs/plugins/lspconfig")
	end,
})

-- Completion
use({
	"hrsh7th/nvim-cmp",
	requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
	},
	config = function()
		require("prabs/plugins/cmp")
	end,
})

-- Formatting & linting
use({
	"nvimtools/none-ls.nvim",
	config = function()
		require("prabs/plugins/null-ls")
	end,
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found, cloning...")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			--vim.cmd("colorscheme rose-pine")
		end
	},
	{
		'bluz71/vim-moonfly-colors',
		name = "moonfly",
		config = function()
			--vim.cmd("colorscheme moonfly")
		end
	},
	{
		'sainnhe/sonokai'
	},
	{
		'luisiacc/gruvbox-baby'
	},
	{
		'rebelot/kanagawa.nvim',
		name = "kanagawa",
		config = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end
	},
	{
		{ "savq/melange-nvim" }
	},
	{
		{ "EdenEast/nightfox.nvim" }
	},
	{
		"nvim-telescope/telescope.nvim", 
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'auto',
					section_separators = '',
					component_separators = '',
					disabled_filetypes = {
						statusline = {'NvimTree'}
					}
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch'},
					lualine_c = {'filename'},
					lualine_x = {},
					lualine_y = {'filetype'},
					lualine_z = {'location'}
				},
			})
		end
	},

	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup({
				hijack_cursor = false,
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
				view = { 
					width = 25,
					side = "right",
				},
			})
		end
	},

	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({
				event = "InsertEnter",
				config = true,
			})
		end
	},

 	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {'c', 'javascript', 'typescript'},
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
			require('lspconfig').clangd.setup {capabilities = capabilities}
		end,
	},

	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			keymap = { preset = 'super-tab' },

			appearance = {
				nerd_font_variant = 'mono'
			},

			completion = { documentation = { auto_show = false } },
		},

	},
})

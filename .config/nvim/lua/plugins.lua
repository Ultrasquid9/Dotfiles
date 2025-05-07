function plugins()
	-- Appearance 
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "frappe"
			})
		end
	}
	which = {
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern"
		}
	}

	-- Functionality
	autopairs = {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	}
	cmp = {
		'saghen/blink.cmp',
		version = "*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = { preset = "super-tab" },
			completion = { documentation = { auto_show = true } },
			fuzzy = { prebuilt_binaries = { download = true } },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" }
			}
		}
	}
	snacks = {
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
		}
	}
	telescope = {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	}
	tree = {
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					float = { 
						enable = true
					}
				}
			})
		end
	}
	gitsigns = {
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end
	}
	minimap = {
		"Isrothy/neominimap.nvim",
		init = function()
			vim.g.neominimap = {
				auto_enable = true,
				layout = "split",
				split = {
					minimap_width = 16,
					close_if_last_window = true,
				}
			}
		end
	}

	-- Language support
	treesitter = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	}
	rustaceanvim = {
		"mrcjkb/rustaceanvim"
	}

	-- Because selection->action is objectively better
	animotion = {
		"luiscassih/AniMotion.nvim",
		event = "VeryLazy",
		config = true
	}

	return {
		catppuccin,
		which,

		autopairs,
		cmp,
		snacks,
		telescope,
		tree,
		gitsigns,
		minimap,

		treesitter,
		rustaceanvim,

		animotion
	}
end


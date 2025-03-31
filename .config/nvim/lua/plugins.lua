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
	snacks = {
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
			input = { enabled = true }
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
		snacks,
		telescope,
		tree,

		animotion
	}
end


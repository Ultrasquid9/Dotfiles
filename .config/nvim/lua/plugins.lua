function plugins()
	-- Themes
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function() 
			flavour = "frappe"
		end
	}

	-- Functionality
	autopairs = {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	}
	indent_blankline = {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	}

	-- Multiple files
	telescope = {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	}
	tree = {
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup {}
		end
	}

	return {
		catppuccin,

		autopairs,
		indent_blankline,

		telescope,
		tree
	}
end


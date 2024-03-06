return {
	{
		-- "catppuccin/nvim",
		-- name = "catppuccin",
		-- flavour = "mocha",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("catppuccin")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = { options = { theme = "tokyonight" } },
	},
}

return {
	"everviolet/nvim",
	name = "evergarden",
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	config = function()
		vim.cmd.colorscheme("evergarden")
	end,
	opts = {
		theme = {
			accent = "green",
			variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
		},
		editor = {
			transparent_background = false,
			sign = { color = "none" },
			float = {
				color = "mantle",
				invert_border = false,
			},
			completion = {
				color = "surface0",
			},
		},
	},
}

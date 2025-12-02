-- return {
-- 	"maxmx03/fluoromachine.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local fm = require("fluoromachine")
--
-- 		fm.setup({
-- 			theme = "fluoromachine",
-- 			brightness = 0.05,
-- 			glow = true,
-- 			transparent = false,
-- 			styles = {
-- 				comments = {},
-- 				functions = {},
-- 				variables = {},
-- 				numbers = {},
-- 				constants = {},
-- 				parameters = {},
-- 				keywords = {},
-- 				types = {},
-- 			},
-- 			colors = {},
-- 			overrides = {},
-- 			plugins = {
-- 				bufferline = true,
-- 				cmp = true,
-- 				dashboard = true,
-- 				editor = true,
-- 				gitsign = true,
-- 				hop = true,
-- 				ibl = true,
-- 				illuminate = true,
-- 				lazy = true,
-- 				minicursor = true,
-- 				ministarter = true,
-- 				minitabline = true,
-- 				ministatusline = true,
-- 				navic = true,
-- 				neogit = true,
-- 				neotree = true,
-- 				noice = true,
-- 				notify = true,
-- 				lspconfig = true,
-- 				syntax = true,
-- 				telescope = true,
-- 				treesitter = true,
-- 				tree = true,
-- 				wk = true,
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("fluoromachine")
-- 	end,
-- }
-- return {
-- 	"0xstepit/flow.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	tag = "v2.0.1",
-- 	opts = {
-- 		theme = {
-- 			style = "dark", --  "dark" | "light"
-- 			contrast = "default", -- "default" | "high"
-- 			transparent = true, -- true | false
-- 		},
-- 		colors = {
-- 			mode = "default", -- "default" | "dark" | "light"
-- 			fluo = "orange", -- "pink" | "cyan" | "yellow" | "orange" | "green"
-- 			custom = {
-- 				saturation = "", -- "" | string representing an integer between 0 and 100
-- 				light = "", -- "" | string representing an integer between 0 and 100
-- 			},
-- 		},
-- 		ui = {
-- 			borders = "fluo", -- "theme" | "inverse" | "fluo" | "none"
-- 			aggressive_spell = true, -- true | false
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("flow").setup(opts)
-- 		vim.cmd("colorscheme flow")
-- 	end,
-- }

return {
	"everviolet/nvim",
	name = "evergarden",
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	config = function()
		-- vim.cmd.colorscheme("evergarden")
	end,
	opts = {
		theme = {
			variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
			accent = "crust",
		},
		editor = {
			transparent_background = false,
			override_terminal = true,
			sign = { color = "none" },
			float = {
				color = "mantle",
				solid_border = false,
			},
			completion = {
				color = "crust",
			},
		},
		style = {
			tabline = { "reverse" },
			search = { "italic", "reverse" },
			incsearch = { "italic", "reverse" },
			types = { "italic" },
			keyword = { "italic" },
			comment = { "italic" },
		},
		overrides = {},
		color_overrides = {},
	},
}
-- return {
-- 	"sainnhe/sonokai",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.sonokai_enable_italic = true
-- 		vim.g.sonokai_style = "shusia"
-- 		vim.g.sonokai_cursor = "purple"
-- 		vim.g.diagnostic_line_highlight = 1
-- 		vim.g.sonokai_current_word = "high contrast background"
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }
-- return {
-- 	"embark-theme/vim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	name = "embark",
-- 	config = function()
-- 		vim.cmd.colorscheme("embark")
-- 	end,
-- }

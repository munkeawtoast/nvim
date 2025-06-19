return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		commands = {
			system_open = function(state)
				vim.ui.open(state.tree:get_node():get_id())
			end,
			parent_or_close = function(state)
				local node = state.tree:get_node()
				if node:has_children() and node:is_expanded() then
					state.commands.toggle_node(state)
				else
					require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
				end
			end,
			child_or_open = function(state)
				local node = state.tree:get_node()
				if node:has_children() then
					if not node:is_expanded() then -- if unexpanded, expand
						state.commands.toggle_node(state)
					else -- if expanded and has children, seleect the next child
						if node.type == "file" then
							state.commands.open(state)
						else
							require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
						end
					end
				else -- if has no children
					state.commands.open(state)
				end
			end,
		},
		filesystem = {
			follow_current_file = { enabled = true },
		},
		window = {
			mappings = {
				O = "system_open",
				-- Y = "copy_selector",
				h = "parent_or_close",
				l = "child_or_open",
			},
		},
	},
}

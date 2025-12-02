-- using spacebar as a leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- make cursor move along the page when scrolling
keymap.set("n", "<C-y>", "k<C-y>")
keymap.set("n", "<C-e>", "j<C-e>")

-- moving line
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "j", "gj", { noremap = true })
keymap.set("n", "k", "gk", { noremap = true })

-- highlight
keymap.set("n", "<leader>h", ":nohl<CR>") -- clear highlight

-- window management
-- local window_opts = { noremap = true, silent = true }
keymap.set("n", "<leader>wv", "<C-w>v") -- split window verticle
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horizontal
keymap.set("n", "<leader>we", "<C-w>=") -- make window equal
keymap.set("n", "<leader>wq", "<cmd>close<CR>") -- close the current split (I think I dont' need this shit)
keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

-- tab managemet
keymap.set("n", "[t", "<cmd>tabp<CR>") -- go to previous tab
keymap.set("n", "]t", "<cmd>tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>") -- open new tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- open current file in new tab

-- custom key behavior
keymap.set("n", "x", '"_x') -- remove char won't change register

-- stay in visual mode after indent
-- vnoremap > >gv
-- vnoremap < <gv
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- nvim-tree
keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>") -- open nvim-tree file explorer
keymap.set("n", "<leader>ef", "<cmd>Neotree reveal<CR>") -- open nvim-tree on current file
-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- refresh nvim-tree
-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- collapse

-- dbui
keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>") -- open nvim-tree on current file

-- fuzzy-finder
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")

keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<cr>")

-- oil
keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { silent = true })
keymap.set("n", "<leader>ol", "<CMD>AerialToggle right<CR>")
-- keys = { -- Example mapping to toggle outline
--   { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
-- },

-- map go to next and prev buffer
keymap.set("n", "[b", ":bprev<CR>", { silent = true })
keymap.set("n", "]b", ":bnext<CR>", { silent = true })
-- emacs like find files
keymap.set("n", "<leader>fd", "", {
	noremap = true,
	callback = function()
		local current_file = vim.fn.expand("%:p")
		vim.fn.inputsave()
		local new_file = vim.fn.input("Find File: ", current_file, "file")
		vim.fn.inputrestore()

		if new_file and new_file ~= "" then
			vim.cmd("edit " .. new_file)
		end
	end,
})

-- treesitter node path
local utils = require("user.core.utils")
keymap.set("n", "<leader>np", utils.get_node_path)
keymap.set("n", "<leader>ni", utils.i18n_helper)

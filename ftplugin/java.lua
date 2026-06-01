local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local os_config = "config_mac"
if vim.fn.has("linux") == 1 then
	os_config = "config_linux"
elseif vim.fn.has("win32") == 1 then
	os_config = "config_win"
end

-- Mason path finding
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

if #launcher_jar == 0 then
	return
end

local lombok_path = jdtls_path .. "/lombok.jar"

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,
		"-jar",
		launcher_jar,
		"-configuration",
		jdtls_path .. "/" .. os_config,
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
		},
	},
}

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>jo", "<cmd>lua require'jdtls'.organize_imports()<CR>", opts)
vim.keymap.set("n", "<leader>jv", "<cmd>lua require('jdtls').extract_variable()<CR>", opts)
vim.keymap.set("v", "<leader>jv", "<esc><cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
vim.keymap.set("n", "<leader>jc", "<cmd>lua require('jdtls').extract_constant()<CR>", opts)
vim.keymap.set("v", "<leader>jc", "<esc><cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
vim.keymap.set("n", "<leader>jt", "<cmd>lua require('jdtls').test_nearest_method()<CR>", opts)
vim.keymap.set("n", "<leader>jT", "<cmd>lua require('jdtls').test_class()<CR>", opts)
vim.keymap.set("n", "<leader>jj", "<cmd>lua require('jdtls').javadoc()<CR>", opts)
vim.keymap.set("n", "<leader>ju", "<cmd>JdtUpdateConfig<CR>", opts)

jdtls.start_or_attach(config)

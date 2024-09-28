require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "tsserver", "gopls" },
})

local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local keymap = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ========================= Configure lua_ls (Lua language server) =============

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
-- ========================= Configure ts_server (Ts/Js language server) =============

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = false,
		},
	},
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"ts",
		"js",
		"vue",
	},
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
})
lspconfig.shopify_theme_ls.setup({})

-- ========================= Configure gopls (Goland language server) =============

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
})

-- ========================= Configure clangd (C/C++ language server) =============

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
	keys = {
		{ "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
	},
	cmd = { "clangd", "--background-index" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
	settings = {
		clangd = {
			fallbackFlags = { "-std=c++17" },
		},
	},
})

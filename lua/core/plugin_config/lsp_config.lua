require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "biome","clangd", "tsserver"}
})


local lspconfig = require("lspconfig")



local on_attach = function(client, bufnr)
  -- Keybindings, etc.
     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

     local keymap = vim.api.nvim_buf_set_keymap
     local opts = { noremap=true, silent=true }

     keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
     keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure lua_ls (Lua language server)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
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
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
}

-- Configure biome (example configuration, adjust as needed)
lspconfig.biome.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    -- Add biome specific settings here if needed
  },
}

-- Configure clangd (C/C++ language server)
lspconfig.clangd.setup {
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
}

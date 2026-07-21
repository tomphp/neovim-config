local function on_attach(_client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = bufnr, desc = "Format buffer" })
end

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "bicep", "lua_ls", "powershell_es" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("*", {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        vim.api.nvim_create_autocmd("LspAttach", {
          desc = "Set up LSP keymaps on attach",
          callback = function(args)
            on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
          end,
        })

        local install_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"

        vim.lsp.config("powershell_es", {
          shell = "powershell",
          bundle_path = install_path,
          settings = {
            powershell = {
              enableProfileLoading = true,
              scriptAnalysis = { enable = true },
            },
          },
        })
      end,
    },
    { "Saghen/blink.cmp" },
  },
}

local platform = require("tomoram.platform")

-- Language servers to set up. `runtime` lists executables of which at least one
-- must be on PATH for the server to work (e.g. bicep-lsp runs on dotnet).
local servers = {
  lua_ls = {},
  bicep = { runtime = { "dotnet" } },
  powershell_es = { runtime = { "pwsh", "powershell" } },
}

local function runtime_available(server)
  return server.runtime == nil or platform.has(unpack(server.runtime))
end

local ensure_installed = {}
local unavailable = {}
for name, server in pairs(servers) do
  if not runtime_available(server) then
    table.insert(unavailable, name)
  elseif not platform.is_nixos then
    table.insert(ensure_installed, name)
  end
end

-- On NixOS Mason's binaries can't run, so enable servers found on PATH instead.
local function enable_servers_from_path()
  for name, server in pairs(servers) do
    local cmd = vim.lsp.config[name] and vim.lsp.config[name].cmd
    local cmd_found = type(cmd) == "function" or (type(cmd) == "table" and platform.has(cmd[1]))
    if runtime_available(server) and cmd_found then
      vim.lsp.enable(name)
    end
  end
end

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
    ensure_installed = ensure_installed,
    automatic_enable = not platform.is_nixos and { exclude = unavailable } or false,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = { PATH = platform.is_nixos and "skip" or "prepend" } },
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

        local powershell = platform.find("pwsh", "powershell")
        if powershell then
          local install_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
          vim.lsp.config("powershell_es", {
            shell = powershell,
            -- Outside Mason, let the shell locate the module via PSModulePath
            bundle_path = (vim.uv or vim.loop).fs_stat(install_path) and install_path or nil,
            settings = {
              powershell = {
                enableProfileLoading = true,
                scriptAnalysis = { enable = true },
              },
            },
          })
        end

        if platform.is_nixos then
          enable_servers_from_path()
        end
      end,
    },
    { "Saghen/blink.cmp" },
  },
}

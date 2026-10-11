local platform = require("tomoram.platform")

-- Parsers are downloaded and built locally (needs tree-sitter CLI, a C compiler,
-- tar and curl), so only install them where that's possible. Without them,
-- Neovim's bundled parsers (lua, vim, vimdoc, c, markdown, query) still work.
local can_build = platform.can_build_treesitter_parsers()

local ensure_installed = {
  "bicep",
  "c_sharp",
  "c",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "haskell",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  -- "swift",
  "typescript",
  "vim",
  "vimdoc",
}

-- Starts highlighting and indentation if a parser for the buffer is present.
local function attach(bufnr)
  if not pcall(vim.treesitter.start, bufnr) then
    return false
  end
  local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
  if lang and vim.treesitter.query.get(lang, "indents") then
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
  return true
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = can_build and ":TSUpdate" or nil,
  config = function()
    local ts = require("nvim-treesitter")

    if can_build then
      ts.install(ensure_installed)
    end

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Start treesitter, installing the parser if needed",
      callback = function(args)
        if attach(args.buf) or not can_build then
          return
        end
        -- Equivalent of the old auto_install option
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.list_contains(ts.get_available(), lang) then
          ts.install(lang):await(function()
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(args.buf) then
                attach(args.buf)
              end
            end)
          end)
        end
      end,
    })
  end,
}

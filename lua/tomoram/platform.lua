-- Helpers for detecting what the current machine supports, so the config can
-- enable optional tooling only where it will actually work.
local M = {}

M.is_windows = vim.fn.has("win32") == 1
M.is_mac = vim.fn.has("mac") == 1
-- NixOS can't run the generic Linux binaries Mason downloads, so tools there
-- must come from PATH (e.g. installed via Nix) instead.
M.is_nixos = (vim.uv or vim.loop).fs_stat("/etc/NIXOS") ~= nil

--- Returns the first of the given executables found on PATH, or nil.
---@param ... string
---@return string|nil
function M.find(...)
  for _, cmd in ipairs({ ... }) do
    if vim.fn.executable(cmd) == 1 then
      return cmd
    end
  end
  return nil
end

--- Returns true if any of the given executables is on PATH.
---@param ... string
---@return boolean
function M.has(...)
  return M.find(...) ~= nil
end

--- Returns true if a C compiler is available.
---@return boolean
function M.has_c_compiler()
  return M.has(vim.env.CC or "cc", "cc", "gcc", "clang", "cl", "zig")
end

--- Returns true if nvim-treesitter can download and build parsers.
---@return boolean
function M.can_build_treesitter_parsers()
  return M.has("tree-sitter", "tree-sitter.exe") and M.has("tar") and M.has("curl") and M.has_c_compiler()
end

return M

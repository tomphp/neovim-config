return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,
      }
    }
    local treeapi = require("nvim-tree.api")
    vim.keymap.set("n", "<leader>b", treeapi.tree.toggle, { desc = "Toggle Tree Browser" })
  end
}

return {
  'ShinKage/idris2-nvim',
  enabled = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    'MunifTanjim/nui.nvim'
  },
  config = function ()
    require('idris2').setup({})
  end
}

return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = {
      preset = 'enter'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    signature = { enabled = true }
  },
  opts_extend = { "sources.default" }
}

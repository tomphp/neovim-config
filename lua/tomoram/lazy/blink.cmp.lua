return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}

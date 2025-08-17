return {
  'ja-ford/delaytrain.nvim',
  config = function ()
    require('delaytrain').setup {
      delay_ms = 2000,
      grace_period = 3
    }
  end
}

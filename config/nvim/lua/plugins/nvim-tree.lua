return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<C-b>', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree' },
  },
  config = function()
    require('nvim-tree').setup()
  end,
}

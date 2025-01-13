local M = {
  'folke/which-key.nvim',


  init = function() 
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,

  -- config = function() 
  --   local wk = require('which-key')
  --
  --   wk.add({
  --     { "<leader>f", group = "Telescope" }, -- group
  --     { "<leader>h", group = "Harpoon" },   -- group
  --   })
  -- end,

  opts = {
    preset = 'helix',
    triggers = {
      { "<auto>", mode = "nxsot" },
    },
  }
}

return M

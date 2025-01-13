local M = {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    -- TODO move this to keys
    local Tbuiltin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', Tbuiltin.find_files, {desc='Find files'})
    vim.keymap.set('n', '<leader>fb', Tbuiltin.buffers, {desc='Find buffers'})
    vim.keymap.set('n', '<leader>fs', Tbuiltin.live_grep, {desc='Find buffers'})
  end
}

return M

local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function() 
    local harpoon = require("harpoon")

    -- -- REQUIRED
    -- harpoon:setup()
    -- -- REQUIRED

    vim.keymap.set("n", "<leader>hh", function() harpoon:list():add() end, {desc='Add to harpoon'})
    vim.keymap.set("n", "<C-b>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, {desc='Select 1st harpoon'})
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, {desc='Select 2nd harpoon'})
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, {desc='Select 3th harpoon'})
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, {desc='Select 4th harpoon'})
  end
}

return M

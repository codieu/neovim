local M = {
  'mbbill/undotree',

  keys = {
    {'<leader>u', function()
      vim.cmd.UndotreeShow()
      vim.cmd.UndotreeFocus()
    end, {desc='Focus undotree'}},

    {'<C-h>', vim.cmd.UndotreeToggle, {desc='Toggle undotree'}}
  },

  init = function() 
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    vim.opt.undofile = true
  end,
}

return M

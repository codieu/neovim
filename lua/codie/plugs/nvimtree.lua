local M = {
  'nvim-tree/nvim-tree.lua',

  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      side = "right",
      width = 30,
    },
    filters = {
      dotfiles = false,
    },
  },

  keys = {
    { "<leader>e", vim.cmd.NvimTreeFocus, desc = "Focus on nvimtree" },
    { "<C-n>", vim.cmd.NvimTreeToggle },
  },

}

return M

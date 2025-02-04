-- just steal these from prev setup

-- vim.keymap.set('n', '<leader>t', vim.cmd.Ex)

vim.keymap.set({"n", "v"}, '<Left>', '')
vim.keymap.set({"n", "v"}, '<Right>', '')
vim.keymap.set({"n", "v"}, '<Up>', '')
vim.keymap.set({"n", "v"}, '<Down>', '')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Seperate vim and system yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- pane navigation
vim.keymap.set("n", '<M-h>', '<C-w>h')
vim.keymap.set("n", '<M-j>', '<C-w>j')
vim.keymap.set("n", '<M-k>', '<C-w>k')
vim.keymap.set("n", '<M-l>', '<C-w>l')

vim.keymap.set("t", '<M-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set("t", '<M-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set("t", '<M-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set("t", '<M-l>', '<C-\\><C-n><C-w>l')

-- terminal mode
vim.keymap.set("t", '<C-w>', '<C-\\><C-n>')

-- what has java forced me to do
vim.keymap.set("n", '<leader>;', 'A;')

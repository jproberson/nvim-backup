vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>", {silent = true, desc = "Exit insert"})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Ex mode" })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text block up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line and keep position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { desc = "Move to window above" })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { desc = "Move to window below" })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { desc = "Move to window left" })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { desc = "Move to window right" })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear search highlight" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

vim.api.nvim_set_keymap('i', '<C-j>', [[pumvisible() ? "\<C-n>" : "\<C-j>"]], {expr = true, noremap = true, desc = "Next item in popup menu"})
vim.api.nvim_set_keymap('i', '<C-k>', [[pumvisible() ? "\<C-p>" : "\<C-k>"]], {expr = true, noremap = true, desc = "Previous item in popup menu"})

-- Key mappings for obsidian.nvim
vim.api.nvim_set_keymap('n', '<leader>oo', ':ObsidianOpen<CR>', { noremap = true, silent = true, desc = "Open Obsidian Note" })
vim.api.nvim_set_keymap('n', '<leader>on', ':ObsidianNew<CR>', { noremap = true, silent = true, desc = "Create New Obsidian Note" })
vim.api.nvim_set_keymap('n', '<leader>oq', ':ObsidianQuickSwitch<CR>', { noremap = true, silent = true, desc = "Quick Switch Obsidian Note" })
vim.api.nvim_set_keymap('n', '<leader>of', ':ObsidianFollowLink<CR>', { noremap = true, silent = true, desc = "Follow Link in Obsidian Note" })
vim.api.nvim_set_keymap('n', '<leader>os', ':ObsidianSearch<CR>', { noremap = true, silent = true, desc = "Search Obsidian Notes" })
vim.api.nvim_set_keymap('n', '<leader>ot', ':ObsidianToday<CR>', { noremap = true, silent = true, desc = "Open Today's Obsidian Note" })
vim.api.nvim_set_keymap('n', '<leader>oi', ':ObsidianTemplate<CR>', { noremap = true, silent = true, desc = "Insert Obsidian Template" })

vim.api.nvim_set_keymap('n', '<leader>pb', ':b#<CR>', { noremap = true, silent = true, desc = "Prev Buffer" })



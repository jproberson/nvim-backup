vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set conceallevel=2")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")
vim.cmd("set clipboard=unnamedplus")

vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set scrolloff=8")
vim.cmd("set sidescrolloff=8")
vim.cmd("set laststatus=2")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("syntax enable")
vim.cmd("set timeoutlen=10")
vim.cmd("set termguicolors")

local set_transparent_background = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" , ctermbg = "none"})
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" , ctermbg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none"})
    vim.api.nvim_set_hl(0, "NeoTreeNormal", {bg = "none", ctermbg = "none"})
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {bg = "none", ctermbg = "none"})
    vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = "none", ctermbg = "none"})

    vim.cmd("highlight TelescopeBorder guibg=none")
    vim.cmd("highlight TelescopeTitle guibg=none")
end

set_transparent_background()

-- Reapply settings after colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_transparent_background,
})

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- local vim = vim
-- local api = vim.api
-- local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         api.nvim_command('augroup '..group_name)
--         api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             api.nvim_command(command)
--         end
--         api.nvim_command('augroup END')
--     end
-- end
--
--
-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }
--
-- M.nvim_create_augroups(autoCommands)

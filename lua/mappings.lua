require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({"n","i"}, "<A-cr>", function () vim.lsp.buf.code_action() end, {desc="Code actions"})
map("n", "<leader>ca", function () vim.lsp.buf.code_action() end, {desc="Code actions"})
map("i", "<C-c>a", function () vim.lsp.buf.code_action() end, {desc="Code actions"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local km = vim.keymap

-- Here is a utility function that closes any floating windows when you press escape
local function close_floating()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- Easy add date/time
function date()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. "# " .. os.date("%d.%m.%y") .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
  vim.api.nvim_feedkeys("o", "n", true)
end

km.set("n", "<Leader>n", "<cmd>enew<CR>", { desc = "New File" })

km.set("n", "<Leader>a", "ggVG<c-$>", { desc = "Select All" })

km.set("n", "<Leader>xd", "<cmd>lua date()<cr>", { desc = "Insert Date" })

km.set("n", "<esc>", function()
  close_floating()
  vim.cmd(":noh")
end, { silent = true, desc = "Remove Search Highlighting, Dismiss Popups" })

-- Diagnostic keymaps
km.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
km.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
km.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
km.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
km.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- km.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- km.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- km.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- km.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
km.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
km.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
km.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
km.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

km.set("n", "<leader>p", require("fzf-lua").files, { desc = "FZF Files" })

km.set("n", "<leader><leader>", require("fzf-lua").resume, { desc = "FZF Resume" })

km.set("n", "<leader>r", require("fzf-lua").registers, { desc = "Registers" })

km.set("n", "<leader>m", require("fzf-lua").marks, { desc = "Marks" })

km.set("n", "<leader>k", require("fzf-lua").keymaps, { desc = "Keymaps" })

km.set("n", "<leader>f", require("fzf-lua").live_grep, { desc = "FZF Grep" })

km.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "FZF Buffers" })

km.set("v", "<leader>8", require("fzf-lua").grep_visual, { desc = "FZF Selection" })

km.set("n", "<leader>7", require("fzf-lua").grep_cword, { desc = "FZF Word" })

km.set("n", "<leader>j", require("fzf-lua").helptags, { desc = "Help Tags" })

km.set("n", "<leader>gc", require("fzf-lua").git_bcommits, { desc = "Browse File Commits" })

km.set("n", "<leader>gs", require("fzf-lua").git_status, { desc = "Git Status" })

km.set("n", "<leader>s", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })

km.set("n", "<leader>cj", require("fzf-lua").lsp_definitions, { desc = "Jump to Definition" })

km.set(
  "n",
  "<leader>cs",
  ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
  { desc = "Document Symbols" }
)

km.set("n", "<leader>cr", require("fzf-lua").lsp_references, { desc = "LSP References" })

km.set("n", "<leader>ch", function()
  vim.lsp.buf.hover()
end, { desc = "Code Hover" })

km.set("n", "<leader>cl", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Line Diagnostics" })

km.set({ "v", "n" }, "<leader>cn", function()
  vim.lsp.buf.rename()
end, { noremap = true, silent = true, desc = "Code Rename" })

km.set(
  "n",
  "<leader>cs",
  ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
  { desc = "Document Symbols" }
)

km.set("n", "<leader>cr", require("fzf-lua").lsp_references, { desc = "LSP References" })

km.set(
  "n",
  "<leader>cd",
  ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
  { desc = "Document Diagnostics" }
)

km.set(
  "n",
  "<leader>ca",
  ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
  { desc = "Code Actions" }
)

km.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--  ┌                                                                              ┐
--  │ These define common comment styles like this                                 │
--  └                                                                              ┘
km.set({ "n", "v" }, "<leader>x1", ":CBllbox12<cr>", { desc = "Comment - single side" })
km.set({ "n", "v" }, "<leader>x2", ":CBllbox18<cr>", { desc = "Comment - both sides" })
km.set("n", "<leader>x3", "CBllline3<cr>", { desc = "Centered Line" })
km.set("n", "<leader>x4", "CBllline5<cr>", { desc = "Centered Line Weighted" })

-- Gitsigns specific for file specific git info/tools
km.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Git toggle line blame" })
km.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", { desc = "Git preview hunk" })
km.set("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Get reset hunk" })

-- Toggle Terminal, thanks https://www.reddit.com/r/neovim/comments/1bjhadj/efficiently_switching_between_neovim_and_terminal/
exitTerm = function()
  vim.cmd(":lua Snacks.terminal.toggle()")
end
km.set({ "n" }, "<C-t>", ":lua Snacks.terminal.toggle()<cr>", { desc = "Toggle Terminal" })
km.set({ "t" }, "<C-t>", exitTerm)

-- km.set("n", "<leader>l", ":LazyGit<cr>", { silent = true, desc = "Lazygit" })
km.set("n", "<leader>l", ":lua Snacks.lazygit.open()<cr>", { silent = true, desc = "Lazygit" })

-- Easy delete buffer without losing window split
km.set("n", "<leader>d", ":lua Snacks.bufdelete.delete()<cr>", { silent = true, desc = "Buffer Delete" })

-- Zen Mode
Snacks.toggle.zen():map("<leader>z")

-- Show Notifier history
km.set("n", "<leader>xh", ":lua Snacks.notifier.show_history()<cr>", { silent = true, desc = "Notifier history" })

km.set("n", "<leader>gf", ":! git checkout -- % <cr>", { silent = true, desc = "Chechout current file" })

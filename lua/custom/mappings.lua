local map = vim.keymap.set

map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- tabufline
map('n', '<leader>n', '<CMD>enew<CR>', { desc = 'new buffer' })
map('n', '<leader>x', '<CMD>bd<CR>', { desc = 'close buffer' })

-- toggle adjacent buffers
map('n', '<TAB>', '<CMD>BufferLineCycleNext<CR>', { desc = 'Cycle to next buffer tab' })
map('n', '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>', { desc = 'Cycle to previous buffer tab' })

-- Comment
map('n', '<leader>#', 'gcc', { desc = 'comment toggle', remap = true })
map('v', '<leader>#', 'gc', { desc = 'comment toggle', remap = true })

-- telescope
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
-- map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
-- map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--   { desc = "telescope find all files" }
-- )
-- map('n', '<leader>fw', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Telescope live_grep_args' })

-- terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- toggle terminal
map({ 'n', 't' }, '<A-h>', '<CMD>ToggleTerm direction=horizontal<CR>', { desc = 'toggle horizontal terminal' })

map({ 'n', 't' }, '<A-v>', '<CMD>ToggleTerm direction=vertical size=80<CR>', { desc = 'toggle vertical terminal' })

map({ 'n', 't' }, '<A-i>', '<CMD>ToggleTerm direction=float size=40<CR>', { desc = 'toggle float terminal' })

-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down Centering' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up Centering' })
map('n', 'n', 'nzzzv', { desc = 'Centralize Next Search Term' })
map('n', 'N', 'Nzzzv', { desc = 'Centralize Prev Search Term' })

-- map('n', '<leader>fp', '<cmd> Prettier <CR>', { desc = 'Prettier Format' })
-- map('n', '<leader>F', '<cmd> lua vim.lsp.buf.format() <CR>', { desc = 'LSP Format' })

-- map('n', ';', ':', { desc = 'Remap : to ;' })

-- map('n', '<leader>gg', '<cmd> GitGutterToggle <CR>')
-- map('n', '<leader>gd', '<cmd> GitGutterDiffOrig <CR>')
-- map('n', '[c', '<cmd> GitGutterPrevHunk <CR>')
-- map('n', ']c', '<cmd> GitGutterNextHunk <CR>')

map('n', '<leader>d', [["_d]], { desc = 'Deletes without copying to register' })

map('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Dynamic Word Substitution' })

map('n', '<leader>+x', '<cmd>silent !chmod +x %<CR>', { desc = 'Give execution permission to shell script' })

map('n', '<leader>gc', '<cmd>!gcc -o ex %<CR>', { desc = "Compile C file into 'ex' executable" })
map('n', '<leader>gm', '<cmd>!gcc -o ex % -lm<CR>', { desc = 'Compile C file with -lm' })

-- Obsidian
map('n', '<leader>oo', '<cmd> ObsidianOpen <CR>', { desc = 'Open Obsidian' })
map('n', '<leader>ow', '<cmd> ObsidianWorkspace <CR>', { desc = 'Obsidian Workspace' })
map('n', '<leader>oS', '<cmd> ObsidianSearch <CR>', { desc = 'Obsidian Search' })
map('n', '<leader>on', '<cmd> ObsidianNew <CR>', { desc = 'Obsidian New' })
map('n', '<leader>os', '<cmd> ObsidianQuickSwitch <CR>', { desc = 'Obsidian Quick Switch' })
map('n', '<leader>of', '<cmd> ObsidianFollowLink <CR>', { desc = 'Obsidian Follow Link' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selection Up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Selection Down' })
map('v', '<leader>d', [["_d]], { desc = 'Deletes without copying to register' })

return map

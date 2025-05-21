local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("n", "<Space>", "<Nop>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>e", ":Ex<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)

--telescope bindings
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>g", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)

map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>N', ':NvimTreeFocus<CR>', opts)

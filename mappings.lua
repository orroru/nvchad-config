---@type MappingsConfig
local M = {}

M.disabled = {
  n = {
    ["<leader>gt"] = "",
    ["<leader>cm"] = "",
    ["<leader>b"] = "",
  },
}

M.general = {
  n = {
    -- LSP and search
    ["<leader>fs"] = { "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>", "Find document symbols" },
    ["<leader>fS"] = { "<cmd>lua require'telescope.builtin'.treesitter()<CR>", "Treesitter symbols" },
    ["<leader>q"] = {
      "<cmd>lua require'telescope.builtin'.diagnostics({bufnr=0})<CR>",
      "List current file diagnostics",
    },
    ["<leader>Q"] = {
      "<cmd>lua require'telescope.builtin'.diagnostics()<CR>",
      "List workspace diagnostics",
    },
    ["gr"] = { "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", "Find references" },
    ["gd"] = { "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", "LSP definitions" },
    ["<leader>k"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Float window diagnostics" },
    -- ["gi"] = { "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", "List workspace diagnostics"},

    -- Git
    ["<leader>gs"] = { "<cmd>lua require'telescope.builtin'.git_status()<CR>", "Git status" },
    ["<leader>gb"] = { "<cmd>lua require'telescope.builtin'.git_branches()<CR>", "Git branches" },
    ["<leader>gB"] = { "<cmd>lua require'gitsigns'.blame_line()<CR>", "Git blame line" },
    ["<leader>gc"] = { "<cmd>lua require'telescope.builtin'.git_commits()<CR>", "Git commits" },
    ["<leader>gC"] = { "<cmd>lua require'telescope.builtin'.git_bcommits()<CR>", "Git buffer's commits" },
    ["<leader>gS"] = { "<cmd>lua require'telescope.builtin'.git_stash()<CR>", "Git stash" },

    -- etc
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>mp"] = { "<cmd>lua require'telescope.builtin'.man_pages()<CR>", "Man pages" },
    ["<leader>n"] = { "<cmd> enew <CR>", "New buffer" },

    -- Debugger
    ["<leader>dR"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    ["<leader>dE"] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    ["<leader>dC"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
      "Conditional Breakpoint",
    },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    ["<leader>dS"] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    --    ["<leader>gg"] = { "<cmd> !golines . -w <CR>", "run golines" },
    --    ["<leader>bb"] = { "<cmd> !black . <CR>", "run black" },
  },
}

return M

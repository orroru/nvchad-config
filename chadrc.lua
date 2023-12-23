---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "github_dark" },
  theme = "github_dark",

  hl_override = {
    CursorLine = {
      bg = "black2",
    },
    Comment = {
      italic = true,
    },

    NvimTreeGitStaged = { fg = '#aff5b4' },
    NvimTreeGitDirty = { fg = '#e3b341' },
    NvimTreeGitNew = { fg = '#56d364' },
    NvimTreeGitRenamed = { fg = '#f0883e' },
    NvimTreeGitDeleted = { fg = '#f85149'},
  },

  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },

  transparency = false,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

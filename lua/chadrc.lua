local M = {}
M.base46 = {
  theme = "aquarium",
  integrations = { "dap", "cmp", "notify", "telescope", "todo", "neogit", "snacks-picker" },
}
M.ui = {
  statusline = {
    enabled = true,
    theme = "default",
    -- separator_style = "arrow",
    -- separator_style = "default",
  },
  telescope = { style = "borderless" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
    bufwidth = 20,
  },
  cmp = {
    lspkind_text = true,
    icons_left = false,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },
}
M.lsp = {
  signature = true,
}
M.nvdash = {
  load_on_startup = true,

  header = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "                            ",
  },

  buttons = {
    { txt = "  New File", hl = "NvDashHeader", keys = "n", cmd = "ene" },
    { txt = "  Find File", hl = "NvDashHeader", keys = "f", cmd = "lua Snacks.picker.files()"},
    { txt = "  Recent Files", hl = "NvDashHeader", keys = "o", cmd = "lua Snacks.picker.recent()" },
    { txt = "󰈭  Find Word", hl = "NvDashHeader", keys = "w", cmd = "lua Snacks.picker.grep()" },
    -- { txt = "󱥚  Themes", hl = "NvDashHeader", keys = "t", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Last Session", hl = "NvDashHeader", keys = "s", cmd = "lua require('resession').load('Last Session')" },
    { txt = "  Configurations", hl = "NvDashHeader", keys = "a", cmd = "lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
M.term = {
  winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    row = 0.15,
    col = 0.15,
    width = 0.7,
    height = 0.7,
    border = "rounded",
  },
}
return M

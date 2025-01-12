local M = {}
M.base46 = {
  theme = "aquarium",
  integrations = { "dap", "cmp", "notify", "telescope", "todo" },
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
    { txt = "  Find File", hl = "NvDashHeader", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", hl = "NvDashHeader", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  New File", hl = "NvDashHeader", keys = "Spc f n", cmd = "ene" },
    {
      txt = "  Configurations",
      hl = "NvDashHeader",
      keys = "Spc f c",
      cmd = "Telescope find_files cwd=" .. vim.fn.stdpath "config",
    },

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

-- if true then return {} end
return {
  "chenzhihuai/nvchad-ui",
  lazy = false,
  branch = "custom",
  opts = {
    -- base46 = { theme = "onedark" },
    nvdash = {

      buttons = {
        { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
        { txt = "󱥚  Themes", keys = "Spc f t", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Last Session", keys = "Spc S l", cmd = "NvCheatsheet" },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

        {
          txt = function()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime) .. " ms"
            return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
          end,
          hl = "NvDashLazy",
          no_gap = true,
        },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
      },
    },
  },
  config = function()
    pcall(function()
      dofile(vim.g.base46_cache .. "defaults")
      dofile(vim.g.base46_cache .. "statusline")
    end)
    require "nvchad"

    for i = 1, 9, 1 do
      vim.keymap.set("n", string.format("<A-%s>", i), function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end)
    end
  end,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts) return vim.tbl_deep_extend("force", opts, require "nvchad.cmp") end,
    },
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { showtabline = 0 } },
        autocmds = { bufferline = false },
        mappings = {
          n = {
            ["<Leader>h"] = {
              function()
                local is_valid_win = function(win)
                  local bufnr = vim.api.nvim_win_get_buf(win)
                  return require("astrocore.buffer").is_valid(bufnr) or vim.bo[bufnr].filetype == "alpha"
                end
                local cur_win = vim.api.nvim_get_current_win()
                -- try to find the most suitable window for Alpha
                if not is_valid_win(cur_win) then
                  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                    if win ~= cur_win and is_valid_win(win) then
                      vim.fn.win_gotoid(win)
                      break
                    end
                  end
                end
                require("nvchad.nvdash").open()
              end,
              desc = "Home Screen",
            },
            ["<Leader>ft"] = { function() require("nvchad.themes").open() end, desc = "Find themes" },
          },
        },
      },
    },
    -- Disable unnecessary plugins
    -- { import = "astrocommunity.recipes.disable-tabline" },
    { "rebelot/heirline.nvim", enabled = false, opts = { statusline = false } },
    { "goolord/alpha-nvim", enabled = false },
    { "brenoprata10/nvim-highlight-colors", enabled = false },
    { "NvChad/nvim-colorizer.lua", enabled = false },
    -- add lazy loaded dependencies
    { "nvim-lua/plenary.nvim", lazy = true },
    { "NvChad/volt", lazy = true },
    {
      "chenzhihuai/base46",
      branch = "custom",
      lazy = true,
      init = function() vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/" end,
      build = function()
        vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
        require("base46").load_all_highlights()
      end,
      -- load base46 cache when necessary
      specs = {
        {
          "nvim-treesitter/nvim-treesitter",
          optional = true,
          opts = function()
            pcall(function()
              dofile(vim.g.base46_cache .. "syntax")
              dofile(vim.g.base46_cache .. "treesitter")
            end)
          end,
        },
        {
          "folke/which-key.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "whichkey") end)
          end,
        },
        {
          "lukas-reineke/indent-blankline.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "blankline") end)
          end,
        },
        {
          "nvim-telescope/telescope.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "telescope") end)
          end,
        },
        {
          "neovim/nvim-lspconfig",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "lsp") end)
          end,
        },
        {
          "nvim-neo-tree/neo-tree.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "neo-tree") end)
          end,
        },
        {
          "nvim-tree/nvim-tree.lua",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "nvimtree") end)
          end,
        },
        {
          "williamboman/mason.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "mason") end)
          end,
        },
        {
          "lewis6991/gitsigns.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "git") end)
          end,
        },
        {
          "nvim-tree/nvim-web-devicons",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "devicons") end)
          end,
        },
        {
          "echasnovski/mini.icons",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "devicons") end)
          end,
        },
        {
          "hrsh7th/nvim-cmp",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "cmp") end)
          end,
        },
      },
    },
  },
}

-- 中文输入法有什么不好的地方吗
-- 这个只有一个人知道就好,f了
return {
  {
    "yehuohan/cmp-im",
    enabled = false,
    dependencies = {
      "yehuohan/cmp-im-zh",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local cmp_im = require "cmp_im"
      cmp_im.setup {
        -- Enable/Disable IM
        enable = false,
        -- IM keyword pattern
        keyword = [[\l\+]],
        -- IM tables path array
        tables = require("cmp_im_zh").tables { "wubi" },
        -- Function to format IM-key and IM-tex for completion display
        format = function(key, text) return vim.fn.printf("%-15S %s", text, key) end,
        -- Max number entries to show for completion of each table
        maxn = 8,
      }
      vim.keymap.set(
        { "n", "v", "c", "i" },
        "<M-;>",
        function() vim.notify(string.format("IM is %s", cmp_im.toggle() and "enabled" or "disabled")) end
      )
      local cmp = require "cmp"
      cmp.setup {
        sources = { { name = "IM" } },
        mapping = { ["<Space>"] = cmp.mapping(cmp_im.select(), { "i" }) },
      }
    end,
  },
  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash-zh").jump {
            chinese_only = false,
          }
        end,
        desc = "Flash between Chinese",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
  },
  {
    "liubianshi/cmp-lsp-rimels",
    keys = { { "<localleader>f", mode = "i" } },
    config = function()
      -- INSTALL
      -- apt install librime-dev
      -- apt install librime-data-double-pinyin
      -- build rime-ls or use release
      vim.system({ "rime_ls", "--listen", "127.0.0.1:9257" }, { detach = true })
      require("rimels").setup {
        cmd = vim.lsp.rpc.connect("127.0.0.1", 9257),
      }
    end,
  },
  {
    "noearc/jieba.nvim",
    dependencies = { "noearc/jieba-lua" },
    config = function()
      vim.keymap.set(
        { "x", "n" },
        "B",
        '<cmd>lua require("jieba_nvim").wordmotion_B()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "b",
        '<cmd>lua require("jieba_nvim").wordmotion_b()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "w",
        '<cmd>lua require("jieba_nvim").wordmotion_w()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "W",
        '<cmd>lua require("jieba_nvim").wordmotion_W()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "E",
        '<cmd>lua require("jieba_nvim").wordmotion_E()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "e",
        '<cmd>lua require("jieba_nvim").wordmotion_e()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "ge",
        '<cmd>lua require("jieba_nvim").wordmotion_ge()<CR>',
        { noremap = false, silent = true }
      )
      vim.keymap.set(
        { "x", "n" },
        "gE",
        '<cmd>lua require("jieba_nvim").wordmotion_gE()<CR>',
        { noremap = false, silent = true }
      )
    end,
  },
  {
    "keaising/im-select.nvim",
    enabled = false,
    config = function()
      require("im_select").setup {
        -- IM will be set to `default_im_select` in `normal` mode
        -- For Windows/WSL, default: "1033", aka: English US Keyboard
        -- For macOS, default: "com.apple.keylayout.ABC", aka: US
        -- For Linux, default:
        --               "keyboard-us" for Fcitx5
        --               "1" for Fcitx
        --               "xkb:us::eng" for ibus
        -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
        default_im_select = "com.apple.keylayout.ABC",

        -- Can be binary's name, binary's full path, or a table, e.g. 'im-select',
        -- '/usr/local/bin/im-select' for binary without extra arguments,
        -- or { "AIMSwitcher.exe", "--imm" } for binary need extra arguments to work.
        -- For Windows/WSL, default: "im-select.exe"
        -- For macOS, default: "macism"
        -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
        default_command = "im-select.exe",

        -- Restore the default input method state when the following events are triggered
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

        -- Restore the previous used input method state when the following events
        -- are triggered, if you don't want to restore previous used im in Insert mode,
        -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
        -- as `set_previous_events = {}`
        set_previous_events = { "InsertEnter" },

        -- Show notification about how to install executable binary when binary missed
        keep_quiet_on_no_binary = false,

        -- Async run `default_command` to switch IM or not
        async_switch_im = true,
      }
    end,
  },
  -- {
  --   "ppwwyyxx/vim-PinyinSearch",
  --   config = function() vim.g.PinyinSearch_Dict = "~/.local/share/nvim/lazy/vim-PinyinSearch/PinyinSearch.dict" end,
  -- },
}

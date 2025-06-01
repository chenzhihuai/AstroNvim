-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    enabled=false,
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
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
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- == Plugins That I Need ==
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    opts = {},
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      -- { "nvim-tree/nvim-web-devicons" },
      -- or if using `mini.icons`
      -- { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
      leader_key = '<leader><leader>', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }
  },
  {
    'simonmclean/triptych.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-tree/nvim-web-devicons', -- optional for icons
      'antosha417/nvim-lsp-file-operations' -- optional LSP integration
    },
    opts = {}, -- config options here
    keys = {
      { '<leader>-', ':Triptych<CR>' },
    },
  },
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup()
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
  {
    'dstein64/vim-startuptime'
  },
  -- == Overrided Plugins ==

  {
    "folke/flash.nvim",
    keys = {
      { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Jump forwards" },
      {
        "S",
        function() require("flash").jump { search = { forward = false } } end,
        mode = { "n", "x", "o" },
        desc = "Jump backwards",
      },
    },
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      {
        "<C-Up>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move up",
      },
      {
        "<C-Down>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move down",
      },
      {
        "<C-LeftMouse>",
        "<Cmd>MultipleCursorsMouseAddDelete<CR>",
        mode = { "n", "i" },
        desc = "Add or remove cursor",
      },
      {
        "<Leader>ka",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword",
      },
      {
        "<Leader>kA",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword in previous area",
      },
      -- {"<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
      -- {"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
      -- {"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    "mangelozzi/rgflow.nvim",
    -- enabled=false,
    opts = {
      -- Set the default rip grep flags and options for when running a search via
      -- RgFlow. Once changed via the UI, the previous search flags are used for
      -- each subsequent search (until Neovim restarts).
      cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",

      -- Mappings to trigger RgFlow functions
      default_trigger_mappings = true,
      trigger = {
        -- Normal mode maps
        n = {
          ["<leader>RG"] = "open_blank", -- Open UI - search pattern = blank
          ["<leader>Rp"] = "open_paste", -- Open UI - search pattern = First line of unnamed register as the search pattern
          ["<leader>Rg"] = "open_cword", -- Open UI - search pattern = <cword>
          ["<leader>Rw"] = "open_cword_path", -- Open UI - search pattern = <cword> and path = current file's directory
          ["<leader>Ra"] = "open_again", -- Open UI - search pattern = Previous search pattern
          ["<leader>Rx"] = "abort", -- Close UI / abort searching / abortadding results
          ["<leader>Rc"] = "print_cmd", -- Print a version of last run rip grep that can be pasted into a shell
          ["<leader>R?"] = "print_status", -- Print info about the current state of rgflow (mostly useful for deving on rgflow)
        },
        -- Visual/select mode maps
        x = {
          ["<leader>Rg"] = "open_visual", -- Open UI - search pattern = current visual selection
        },
      },
      -- These mappings are only active when the RgFlow UI (panel) is open
      default_ui_mappings = true,
      -- QuickFix window only mapping
      default_quickfix_mappings = true,
    },
  },
  {
    "bennypowers/splitjoin.nvim",
    lazy = true,
    keys = {
      {
        "gj",
        function() require("splitjoin").join() end,
        desc = "Join the object under cursor",
      },
      {
        "g,",
        function() require("splitjoin").split() end,
        desc = "Split the object under cursor",
      },
    },
  },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    opt = {
      offline_mode = {
        enabled = true,
        no_github = false,
      }
    }
  },

}

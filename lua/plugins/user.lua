-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    opts = {},
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = { "neo-tree" },
      bottom = {
        {
          ft = "qf",
          title = "quickfix",
        },
        {
          ft = "toggleterm",
          filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        },
      },
      wo = {
        winbar = true,
        winhighlight = "",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled=false,
    opts = {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.cmd [[setlocal fillchars=vert:▐,horiz:▄,vertright:▐,horizup:▟]] end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = false,
        layout_config = {
          -- preview_width = 0.618,
          horizontal = {
            height = 0.6,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.6,
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrotheme",
    enabled = false,
    opts = {
      style = {
        transparent = false, -- Bool value, toggles transparency.
        inactive = false, -- Bool value, toggles inactive window color.
        float = true, -- Bool value, toggles floating windows background colors.
        neotree = true, -- Bool value, toggles neo-trees background color.
        border = true, -- Bool value, toggles borders.
        title_invert = true, -- Bool value, swaps text and background colors.
        italic_comments = true, -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },
    },
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = function()
      require("neogit").setup()
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
  },
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    enabled = false,
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
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
  -- {
  --   "ZhiyuanLck/smart-pairs",
  --   config = function() require("pairs"):setup() end,
  --   specs = {
  --     {
  --       "windwp/nvim-autopairs",
  --       optional = true,
  --       enabled = false,
  --     },
  --   },
  -- },
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

  {
    "rcarriga/nvim-notify",
    opts={
      stages="static",
    }
  }
}

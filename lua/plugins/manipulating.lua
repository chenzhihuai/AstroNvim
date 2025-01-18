return {
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
}

return {
  {
    "NeogitOrg/neogit",
    keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" } },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit) print("selected commit:", commit.hash) end,
        on_select_range_commit = function(from, to) print("selected range:", from.hash, to.hash) end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
        desc = "GitGraph - Draw",
      },
    },
  },
}

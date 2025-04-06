-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- https://astronvim.github.io/astrocommunity
  "AstroNvim/astrocommunity",

  -- language package
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.vue" },

  -- tools
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.gitgraph-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },

  -- markdown
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },

  --jupyter 
  { import = "astrocommunity.code-runner.molten-nvim" },

  -- runner
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.code-runner.executor-nvim" },
  
  -- others
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = false,
        layout_config = {
          -- preview_width = 0.618,
          horizontal = { height = 0.6, preview_cutoff = 120, prompt_position = "top", width = 0.6 },
        },
      },
    },
  }
}

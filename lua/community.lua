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
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },

  -- markdown
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  --
  -- others
  { import = "astrocommunity.recipes.neovide" },
}

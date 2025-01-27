-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.gitgraph-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  -- { import = "astrocommunity.pack.nvchad-ui" },
  -- import/override with your plugins folder
}

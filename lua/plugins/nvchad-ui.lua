-- if true then return {} end
return {
  "chenzhihuai/nvchad-ui",
  lazy = false,
  branch = "custom",
  opts = {},
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
        autocmds = { bufferline = false, },
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
    { import = "astrocommunity.recipes.disable-tabline" },
    { "rebelot/heirline.nvim", enabled=false, opts = { statusline = false } },
    { "goolord/alpha-nvim", enabled = false },
    {
      "folke/snacks.nvim",
      optional = true,
      ---@type snacks.Config
      opts = { dashboard = { enabled = false } },
    },
    { "brenoprata10/nvim-highlight-colors", enabled = false },
    { "NvChad/nvim-colorizer.lua", enabled = false },

    { "nvim-lua/plenary.nvim", lazy = true },
    { "NvChad/volt", lazy = true },
    { "nvzone/menu" , lazy = false },
    -- { import = "astrocommunity.recipes.picker-nvchad-theme" },


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
      "Saghen/blink.cmp",
      optional=true,
      opts={
        completion={
          menu={
            border='single',
            winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
            scrollbar = false,
          },
          documentation={
            auto_show=true,
            window={
              border='single',
              winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
            }
          },
        },
        signature={
          -- enabled=true,
          window={
            border='single',
            winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
          }
        }
      }
    },

    {
      "nvim-tree/nvim-tree.lua",
      -- enabled=false,
      opts  = function ()
        vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, {
          pattern={"NvimTree_*"},
          callback=function(_)
            vim.cmd [[setlocal fillchars=vert:▐,horiz:▄,vertright:▐,horizup:▟]]
          end
        })
        vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
          require('menu.utils').delete_old_menus()

          vim.cmd.exec '"normal! \\<RightMouse>"'

          -- clicked buf
          local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
          local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

          require("menu").open(options, { mouse = true })
        end, {})
      end,
      keys ={
        {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc="NvimTree"}
      }
    },

    {
      "nvim-neo-tree/neo-tree.nvim",
      enabled=false,
      opts = {

        filesystem = {
          hijack_netrw_behavior = "open_default",
          -- "open_current",
          -- "disabled",
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_) vim.cmd [[setlocal fillchars=vert:▐,horiz:▄,vertright:▐,horizup:▟]] end,
          },
        },
      },
    },
    {
      "folke/edgy.nvim",
      event = "VeryLazy",
      opts = {
        animate = {
          enabled = false,
        },
        left = { "NvimTree" },
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
        options={
          left={wo={winbar=false}},
          bottom={size=16},
        },
        wo = {
          -- winbar = false,
          winhighlight = "",
        },
      },
    },
    {
      "folke/snacks.nvim",
      opts = {
        styles={
          notification={border='single'},
        },
        dashboard = { enabled = false, },
        picker = {
          layout = {
            row = 1,
            layout = {
              backdrop = true,
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.7,
              border="right",
              {
                box = "vertical",
                border = "none",
                { win = "input", title = "{title} {live} {flags}", height = 1, border = "rounded" },
                { box = "vertical", border = "rounded", { win = "list", border = "hpad" } },
              },
              { win = "preview", title = "{preview}", border = "rounded" },
            },
          },
        },
      },
    },
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
          "folke/snacks.nvim",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "snacks-picker") end)
          end,
        },
        {
          "hrsh7th/nvim-cmp",
          optional = true,
          opts = function()
            pcall(function() dofile(vim.g.base46_cache .. "cmp") end)
          end,
        },
        {
          "Saghen/blink.cmp",
          optional=true,
          opts= function()
            pcall(function() dofile(vim.g.base46_cache .. "blink-cmp") end)
          end,
        },
        {
          "NeogitOrg/neogit",
          optional=true,
          opts = function()
            dofile(vim.g.base46_cache .. "git")
            dofile(vim.g.base46_cache .. "neogit")
          end,
        },
        {
          "sindrets/diffview.nvim",
          optional=true,
          opts = function()
            dofile(vim.g.base46_cache .. "diffview")
          end,
        },
      },
    },
  },
}

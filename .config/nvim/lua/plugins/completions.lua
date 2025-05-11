return {
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "99290b3",
  },
  {
    "saadparwaiz1/cmp_luasnip",
    commit = "98d9cb5",
  },
  {
    "rafamadriz/friendly-snippets",
    commit = "572f566",
  },
  {
    "hrsh7th/cmp-path",
    commit = "91ff86c",
  },
  {
    "L3MON4D3/LuaSnip",
    version = "^2.3.0",
    dependiencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-path",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = "^0.0.2",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-i>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}

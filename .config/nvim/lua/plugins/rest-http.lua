return {
  "mistweaverco/kulala.nvim",
  version = "^5.3.0",
  ft = { "http", "rest" },
  opts = {
    -- cURL path
    curl_path = "curl", -- if you have curl installed in a non-standard path,

    -- dev, test, prod, can be anything
    -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
    default_env = "dev",

    debug = false, -- 0 = silence all notifications, 1 = only error, 2 = error and warn, 3 = error, warn and info, 4 = debug

    -- default formatters/pathresolver for different content types
    contenttypes = {
      ["application/json"] = {
        ft = "json",
        formatter = { "jq", "." },
        -- pathresolver = require("kulala.parser.jsonpath").parse,
      },
      ["application/xml"] = {
        ft = "xml",
        formatter = { "xmllint", "--format", "-" },
        pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
      },
      ["text/html"] = {
        ft = "html",
        formatter = { "xmllint", "--format", "--html", "-" },
        pathresolver = {},
      },
    },

    -- additional cURL options
    -- see: https://curl.se/docs/manpage.html
    additional_curl_options = {},

    -- can be used to show loading, done and error icons in inlay hints
    -- possible values: "on_request", "above_request", "below_request", or nil to disable
    -- If "above_request" or "below_request" is used, the icons will be shown above or below the request line
    -- Make sure to have a line above or below the request line to show the icons
    show_icons = "on_request",

    ui = {
      display_mode = "split", -- Display mode, possible values: "split", "float"
      split_direction = "vertical", -- possible values: "vertical", "horizontal"
      default_view = "headers_body", -- default_view, body or headers or headers_body
      -- default icons
      icons = {
        inlay = {
          loading = "⏳",
          done = "✅",
          error = "❌",
        },
        lualine = "🐼",
      },
      -- Specify the panes to be displayed by default
      default_winbar_panes = { "body", "headers", "headers_body" }, -- { "body", "headers", "headers_body", "script_output", "stats" }
    },

    -- disable the vim.print output of the scripts
    -- they will be still written to disk, but not printed immediately
    disable_script_print_output = false,

    -- set scope for environment and request variables
    environment_scope = "b", -- possible values: b = buffer, g = global

    -- certificates
    certificates = {},
  },
  keys = {

    -- Key bandigs
    vim.keymap.set(
      { "n" },
      "<leader>rr",
      -- kulala.run(),
      "<cmd>lua require('kulala').run()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Execute the request. rest run, rr" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>rp",
      --kulala.jump_prev(),
      "<cmd>lua require('kulala').jump_prev()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Jump to the previous request. rest previous, rp" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>rn",
      "<cmd>lua require('kulala').jump_next()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Jump to the next request. rest next, rn" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>rt",
      "<cmd>lua require('kulala').toggle_view()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Toggle between body and headers, rest toggle, rt" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>ri",
      "<cmd>lua require('kulala').inspect()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Inspect the current request. rest inspect, ri" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>rc",
      "<cmd>lua require('kulala').copy()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Copy the current request as a curl command. rest copy, rc" }
    ),
    vim.keymap.set(
      { "n" },
      "<leader>rf",
      "<cmd>lua require('kulala').from_curl()<cr>",
      { noremap = true, silent = true, desc = "Rest-http: Paste curl from clipboard as http request. rest from, rf" }
    ),
  },
}

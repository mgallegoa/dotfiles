-- ~/.config/nvim/ftplugin/kotlin.lua

local lspconfig = require("lspconfig")
local util = lspconfig.util

-- Prevent duplicate LSP startups
if vim.b.kotlin_lsp_started then
  return
end
vim.b.kotlin_lsp_started = true

lspconfig.kotlin_lsp.setup({
  cmd = { "kotlin-lsp" },
  filetypes = { "kotlin" },
  root_dir = util.root_pattern(
    "settings.gradle.kts",
    "settings.gradle",
    "build.gradle.kts",
    "build.gradle",
    ".git",
    "pom.xml"
  ),
  single_file_support = true,
  init_options = {
    storagePath = vim.fn.stdpath("cache") .. "/kotlin-lsp",
  },
})

local dap = require("dap")

-- Avoid redefining configs
if vim.b.kotlin_dap_configured then
  return
end
vim.b.kotlin_dap_configured = true

-- Kotlin uses Java debug adapter
dap.configurations.kotlin = {
  {
    type = "java",
    request = "launch",
    name = "Launch Kotlin (Main.kt)",
    mainClass = function()
      return vim.fn.input("Main class > ", "", "file")
    end,
    projectName = function()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
  },
}

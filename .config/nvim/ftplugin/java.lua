local status, jdtls = pcall(require, "jdtls")
if not status then
  vim.notify("Install jdtls for java via mason: ", vim.log.levels.WARN)
  return
end

local home = os.getenv("HOME")
local jdk_path = os.getenv("JAVA_HOME") or "/usr/lib/jvm/java-17-openjdk-amd64"
local lombok_path = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
local workspace_dir = home .. "/.local/share/nvim/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local root_markers = { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then
  return
end

-- DAP and test bundles
local bundles = {}
local mason_registry = vim.fn.stdpath("data") .. "/mason/packages"

local java_debug_jar =
  vim.fn.glob(mason_registry .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
if java_debug_jar ~= "" then
  table.insert(bundles, java_debug_jar)
end

local test_jars = vim.split(vim.fn.glob(mason_registry .. "/java-test/extension/server/*.jar"), "\n")
vim.list_extend(bundles, test_jars)

-- keybindings to add
local my_on_attach = function(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end

  -- Additional nvim-jdtl LSP keymaps
  map({ "n" }, "<leader>go", require("jdtls").organize_imports, "LSP - jdtls: Organize Imports, go.")
  map({ "n", "v" }, "<leader>gv", require("jdtls").extract_variable, "LSP - jdtls: Extract variable, gv.")
  map({ "n", "v" }, "<leader>gb", require("jdtls").extract_constant, "LSP - jdtls: Extract constant, gb.")
  map({ "n", "v" }, "<leader>gm", require("jdtls").extract_method, "LSP - jdtls: Extract method, gm.")

  -- Custom JDT keymaps
  map({ "n" }, "<leader>tt", require("jdtls").test_class, "Debug - jdtls: Run class test, tt.")
  map({ "n" }, "<leader>tn", require("jdtls").test_nearest_method, "Debug - jdtls: Run method test, tn.")

  -- Remove default autocommand for BufReadCmd *.class if it exists
  -- vim.api.nvim_clear_autocmds({
  --   event = "BufReadCmd",
  --   pattern = "*.class",
  -- })
end

-- Merge the LSP keybindings with the new ones
local jdtls_on_attach = function(client, bufnr)
  -- Call your global on_attach first
  if _G.lsp_on_attach then
    _G.lsp_on_attach(client, bufnr)
  end

  -- add the specific mappings
  my_on_attach(client, bufnr)
end

-- Setup capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Start or attach JDTLS
jdtls.start_or_attach({
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.io=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.net=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.nio=ALL-UNNAMED",
    "--add-opens",
    "java.base/sun.nio.ch=ALL-UNNAMED",
    "-javaagent:" .. lombok_path,
    "-jar",
    vim.fn.glob(mason_registry .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    mason_registry .. "/jdtls/config_linux",
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  capabilities = capabilities,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      completion = { enabled = true },
      configuration = {
        runtimes = {
          -- {
          --   name = "JavaSE-11",
          --   path = "/opt/manuel/sdk/java-11-openjdk-amd64",
          -- },
          {
            name = "JavaSE-21",
            path = jdk_path,
          },
        },
      },
      format = {
        enabled = true,
      },
      gradle = {
        enabled = true,
      },
      maven = {
        enabled = true,
        -- downloadSources = true,
      },
      referencesCodeLens = { enabled = true }, --Show reference counts above classes/methods (true/false).
      signatureHelp = { enabled = true }, -- Show parameter info while typing method arguments.
      saveActions = { organizeImports = true }, -- Auto-organize imports on save (true/false).
      -- contentProvider = { preferred = "fernflower" }, -- enables internal/decompiled class refs
      imports = {
        gradle = {
          wrapper = {
            checksums = {
              ["7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172"] = {
                allowed = true,
              },
            },
          },
        },
      },
    },
  },
  on_attach = jdtls_on_attach,
})

require("jdtls").setup_dap()

local dap = require("dap")
dap.configurations.java = {
  -- Configuration to run a new Java process to Debug
  {
    type = "java",
    request = "launch",
    name = "Launch Plane Java Project",
    mainClass = "com.co.manuel.algorithms.challenges.TwoSumEqualInputNumber",
    console = "integratedTerminal", -- "integratedTerminal": Terminal inside Neovim (RECOMMENDED for Java). "internalConsole": Use the debug adapter's internal. "externalTerminal": External
    stopOnEntry = false, -- pause on the first line of your main method or entry point.
    javaExec = "/opt/manuel/sdkman/candidates/java/current/bin/java",
    -- modulePaths = {}, -- If using the JDK9+ module system, this needs to be extended `nvim-jdtls` automatically populate this
    cwd = vim.fn.getcwd(),
    classPaths = { "build" }, -- You need to extend the classPath to list dependencies. `nvim-jdtls` automatically add the `classPaths`
    -- args = {}, -- Object with the list of the arguments
  },
  -- Configuration when maven or gradle to run a new Java process to Debug
  {
    type = "java",
    request = "launch",
    name = "Launch Maven or Gradle Java Project",
    -- mainClass = "com.co.manuel.algorithms.list.SinglyLinkedList",
    -- projectName = "java", -- If using multi-module projects, remove otherwise.
    console = "integratedTerminal", -- "integratedTerminal": Terminal inside Neovim (RECOMMENDED for Java). "internalConsole": Use the debug adapter's internal. "externalTerminal": External
    stopOnEntry = false, -- pause on the first line of your main method or entry point.
  },
  -- Configuration to attach to a server Java process to Debug
  {
    type = "java",
    request = "attach",
    name = "Attach Java Project",
    hostname = "127.0.0.1",
    port = "5005",
  },
}

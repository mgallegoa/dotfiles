local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
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
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
    "-data",
    workspace_dir,
  },
  -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = extendedClientCapabilities,
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
      },
    },
  },

  -- init_options = {
  --   bundles = {
  --     vim.fn.glob(
  --       "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
  --       1
  --     ),
  --   },
  -- },
}

-- Configuration for the debugger
-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob(
    "~/.local/share/nvim//mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    1
  ),
}
vim.list_extend(
  bundles,
  vim.split(vim.fn.glob("~/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
)
config["init_options"] = {
  bundles = bundles,
}

require("jdtls").start_or_attach(config)
require("jdtls").setup_dap()

local dap = require("dap")
dap.configurations.java = {
  -- Configuration to run a new Java process to Debug
  {
    type = "java",
    request = "launch",
    name = "Launch Plane Java Project",
    mainClass = "com.co.manuel.algorithms.list.SinglyLinkedList",
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
    mainClass = "com.co.manuel.algorithms.list.SinglyLinkedList",
    projectName = "java", -- If using multi-module projects, remove otherwise.
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

vim.keymap.set("n", "<leader>go", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>gv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
vim.keymap.set(
  "v",
  "<leader>gv",
  "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
  { desc = "Extract Variable" }
)
vim.keymap.set("n", "<leader>gb", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
vim.keymap.set(
  "v",
  "<leader>gb",
  "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
  { desc = "Extract Constant" }
)
vim.keymap.set(
  "v",
  "<leader>gm",
  "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
  { desc = "Extract Method" }
)

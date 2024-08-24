-- Alpha (dashboard) for neovim

local options

-- Only runs this script if Alpha Screen loads -- only if there isn't files to read
if (vim.api.nvim_exec('echo argc()', true) == "0")
then
  math.randomseed(os.time()) -- For random header.

  -- Create button for initial keybind.
  --- @param sc string
  --- @param txt string
  --- @param hl string
  --- @param keybind string optional
  --- @param keybind_opts table optional
  local function button(sc, txt, hl, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
      position       = "center",
      shortcut       = sc,
      cursor         = 5,
      width          = 50,
      align_shortcut = "right",
      hl_shortcut    = hl,
    }

    if keybind then
      keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
      opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
      local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end

    return {
      type     = "button",
      val      = txt,
      on_press = on_press,
      opts     = opts,
    }
  end

  -- All custom headers
  Headers = {

    {
      [[            .-'''''-.    ]],
      [[          .'         `.  ]],
      [[         :             : ]],
      [[        :               :]],
      [[        :      _/|      :]],
      [[         :   =/_/      : ]],
      [[          `._/ |     .'  ]],
      [[       (   /  ,|...-'    ]],
      [[        \_/^\/||__       ]],
      [[     _/~  `""~`"` \_     ]],
      [[  __/  -'.  ` .  `\_\__  ]],
      [[/jgs     \           \-.\ ]],
    }, -- jgs

    {
      [[                                                                     ]],
      [[       ███████████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      ████████████████ ███████████ ███   ███████     ]],
      [[     ████████████████ ████████████ █████ ██████████████   ]],
      [[    █████████████████████████████ █████ █████ ████ █████   ]],
      [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
      [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
      [[ ██████   ██  ███████████████   ██ █████████████████ ]],
      [[ ██████   ██  ███████████████   ██ █████████████████ ]],
    },

    {
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
      '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
      '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
      '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
      '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
      '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
      '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
    },

    {
      "╔══╗♥           ",
      "╚╗╔╝♥           ",
      "╔╝╚╗♥           ",
      "╚══╝♥           ",
      "     ╔╗ ♥ღ♥ღ♥ღ♥           ",
      "     ║║╔═╦╦╦╔╗           ",
      "     ║╚╣║║║║╔╣           ",
      "     ╚═╩═╩═╩═╝           ",
      "╔═╗╔═╗   ♥ ♥♥ ♥♥           ",
      "║║╚╝║║    ♥   ♥  ♥    ♥    ",
      "║╔╗╔╗╠══╦═╦╦══╦═╗╔══╗   ♥  ",
      "║║║║║║╔╗║╔╬╣╔╗║╔╗╣╔╗║    ♥ ",
      "║║║║║║╔╗║║║║╔╗║║║║╔╗║   ♥  ",
      "╚╝╚╝╚╩╝╚╩╝╚╩╝╚╩╝╚╩╝╚╝    ♥ ",
    },

    {
      [[  ／|_       ]],
      [[ (o o /      ]],
      [[  |.   ~.    ]],
      [[  じしf_,)ノ ]],
    },

    {
      '          ▀████▀▄▄              ▄█ ',
      '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
      '    ▄        █          ▀▀▀▀▄  ▄▀  ',
      '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
      '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
      '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
      '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
      '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
      '   █   █  █      ▄▄           ▄▀   ',
    },

    {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    },
    {
      "░░░░▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄                 ",
      "░░░░█░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▀▀▄             ",
      "░░░█░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░░█            ",
      "░░█░░░░░░▄██▀▄▄░░░░░▄▄▄░░░█            ",
      "░▀▒▄▄▄▒░█▀▀▀▀▄▄█░░░██▄▄█░░░█           ",
      "█▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒█          ",
      "█▒█░█▀▄▄░░░░░█▀░░░░▀▄░░▄▀▀▀▄▒█         ",
      "░█▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░░░░█░░█          ",
      "░░█░░▀▄▀█▄▄░█▀▀▀▄▄▄▄▀▀█▀██░█           ",
      "░░░█░░██░░▀█▄▄▄█▄▄█▄████░█             ",
      "░░░░█░░░▀▀▄░█░░░█░███████░█            ",
      "░░░░░▀▄░░░▀▀▄▄▄█▄█▄█▄█▄▀░░█            ",
      "░░░░░░░▀▄▄░▒▒▒▒░░░░░░░░░░█             ",
      "░░░░░░░░░░▀▀▄▄░▒▒▒▒▒▒▒▒▒▒░█            ",
      "░░░░░░░░░░░░░░▀▄▄▄▄▄░░░░░█             ",
    },
    {
      "⠀⠀⠀⠀⠀⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⡄⠀⠀⠀⠀⠀⠀       ",
      "⠀⠀⠀⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀       ",
      "⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀       ",
      "⠠⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀       ",
      "⠀⢻⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀       ",
      "⠀⢠⡟⡠⠔⡦⠘⣫⣤⣄⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⢟⠭⢽⡀⠀⠀       ",
      "⠀⠈⢇⣴⡿⢧⡌⠙⠛⠻⠿⠿⢷⣦⠄⠀⠀⢸⣿⡿⠋⢂⠀⢀⠇⠀⠀       ",
      "⠀⢠⣾⡿⠡⢄⡄⢠⠀⡴⠶⠶⠲⠷⠀⠀⠀⠈⠙⠁⠀⡆⠈⢸⡇⠀⠀       ",
      "⠀⠀⢏⣴⠞⢛⣷⠀⠀⠑⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⠉⡇⠀⠀       ",
      "⠀⠀⠀⠟⠈⠜⡇⠀⠀⡀⡠⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⡌⠀⠀⠀       ",
      "⠀⠀⢸⠀⡈⢰⡀⢀⠤⠤⠆⠀⠑⢄⠀⢠⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀       ",
      "⠀⠀⠘⡀⠑⠈⢁⡠⢤⣀⣶⣶⢦⣄⣤⠘⡄⠀⠀⠀⠀⢘⣿⠀⠀⠀⠀       ",
      "⠀⠀⠀⠐⡜⢄⣿⣞⣉⣡⣷⣿⣾⡟⢛⠸⠀⠀⠀⠀⠀⢈⡇⠀⠀⠀⠀       ",
      "⠀⠀⠀⠀⠈⢂⢻⢝⠿⠍⢓⡉⠔⠁⣸⠇⠀⠀⠀⠀⠀⡜⠇⠀⠀⠀⠀       ",
      "⠀⠀⠀⠀⠀⠀⠡⣧⠀⠀⠀⠀⠀⠔⠝⠀⠀⠀⠀⢀⠊⠀⠰⡀⠀⠀⠀       ",
      "⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠄⠀⠀       ",
      "⠀⠀⠀⠀⠀⠀⠀⠈⣢⢄⠠⠔⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡌⠢⡀       ",
      "⠀⠀⠀⠀⠀⠀⠀⡐⠀⢆⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀       ",
    },
    -- Generated with: https://fsymbols.com/generators/carty/
    {
      "    ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░    ",
      "    ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░    ",
      "    ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░    ",
      "    ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░    ",
      "    ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗    ",
      "    ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝    ",
    },
    {
      "    █████████████████████████████████████████████    ",
      "    █▄─▀█▀─▄██▀▄─██▄─▄▄▀█▄─▄██▀▄─██▄─▀█▄─▄██▀▄─██    ",
      "    ██─█▄█─███─▀─███─▄─▄██─███─▀─███─█▄▀─███─▀─██    ",
      "    ▀▄▄▄▀▄▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▀▄▄▀▄▄▄▀▀▄▄▀▄▄▀▄▄▀    ",
    },

  }

  --
  -- Sections for Alpha.
  --

  local header = {
    type = "text",
    val = Headers[math.random(1, #Headers)],
    -- val = Headers[4],
    opts = {
      position = "center",
      hl       = "Whitespace"
      -- wrap = "overflow";
    }
  }

  local footer = {
    type = "text",
    -- Change 'rdn' to any program that gives you a random quote.
    -- https://github.com/BeyondMagic/scripts/blob/master/quotes/rdn
    -- Which returns one to three lines, being each divided by a line break.
    -- Or just an array: { "I see you:", "Above you." }
    val  = {
      "Pedaso 10.2 de la Constiución Politica: Nadie podrá llevar por encima de su corazón a nadie, ",
      "             ni hacerle mal en su persona, aunque piense y diga diferente. ",
      "                                         Traducción indígenas de Colombia al Articulo 12 C.P.",
    }, -- split(capture('rdn')),
    hl   = "NvimTreeRootFolder",
    opts = {
      position = "center",
      hl       = "Whitespace",
    }
  }

  local buttons = {
    type = "group",
    val = {
      button("e", "  New Buffer", 'RainbowRed', ':tabnew<CR>', {}),
      button("f", "󰈞  Find file", 'RainbowYellow', ':Telescope find_files<CR>', {}),
      button("h", "  Recently opened files", 'RainbowBlue', ':Telescope oldfiles<CR>', {}),
      button("l", "  Projects", 'RainbowOrange', ':Telescope marks<CR>', {}),
      --button("r", "  Frecency/MRU",          'RainbowCyan', ':Telescope oldfiles<CR>', {}),
      button("g", "  Open Last Session", 'RainbowGreen', ':source ~/.config/nvim/session.vim<CR>', {}),
      --button("m", "󰈞  Word Finder",           'RainbowViolet', ':Telescope live_grep<CR>', {}),
    },
    opts = {
      spacing = 1,
    }
  }

  --
  -- Centering handler of ALPHA
  --

  local ol = {                              -- occupied lines
    icon            = #header.val,          -- CONST: number of lines that your header will occupy
    message         = #footer.val,          -- CONST: because of padding at the bottom
    length_buttons  = #buttons.val * 2 - 1, -- CONST: it calculate the number that buttons will occupy
    neovim_lines    = 0,                    -- CONST: 2 of command line, 1 of the top bar
    padding_between = 1,                    -- STATIC: can be set to anything, padding between keybinds and header
  }

  local left_terminal_value = vim.api.nvim_get_option('lines') -
      (ol.length_buttons + ol.message + ol.padding_between + ol.icon + ol.neovim_lines)

  if (left_terminal_value < 0) then
    left_terminal_value = 0
  end
  local top_padding = math.floor(left_terminal_value / 2)
  --    local bottom_padding = left_terminal_value - top_padding

  --
  -- Set alpha sections
  --

  options           = {
    layout = {
      { type = "padding", val = top_padding },
      header,
      { type = "padding", val = ol.padding_between },
      buttons,
      footer,
      --{ type = "padding", val = bottom_padding },
    },
    opts = {
      margin = 5
    },
  }

end

return {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    if (options ~= nil) then
      require 'alpha'.setup(options)
    end
  end
};

local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  },

  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
  },

  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
  },

  {
    "axelvc/template-string.nvim",
    config = function(_, opts)
      require("template-string").setup {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" },
        jsx_brackets = true,
        remove_template_string = false,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      }
    end,
    lazy = false,
  },

  {
    "tpope/vim-obsession",
    lazy = false,
  },

  {
    "MattesGroeger/vim-bookmarks",
    lazy = false,
  },

  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "rmagatti/alternate-toggler",
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
  },
  {
    "gelguy/wilder.nvim",
    config = function(_, opts)
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
          border = "rounded",
          max_height = "75%", -- max height of the palette
          min_height = 0, -- set to the same as 'max_height' for a fixed height window
          prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
          reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        })
      )
    end,
    lazy = false,
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup {
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer

        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
      }
    end,
    lazy = false,
  },
}

return plugins

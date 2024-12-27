-- ~/.config/nvim/lua/plugins/core.lua
return {
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "typescript",
          "javascript", "python", "go", "java",
          "sql", "json", "yaml", "markdown", "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end,
  },

  -- which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          mappings = {
            { "<C-j>", "move_selection_next", desc = "Move Selection Next"},
            { "<C-k>", "move_selection_previous", desc = "Move Selection Previous"},
           },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },

  -- nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
      })
    end,
  },

  -- nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",  -- Correctly specified plugin repository
    dependencies = { "nvim-treesitter/nvim-treesitter" },  -- Ensure dependency on treesitter
    config = function()
      require('nvim-ts-autotag').setup({
        -- Enable or disable auto-closing
        auto_close = true,

        -- Filetypes to enable autotagging
        filetypes = {
          'html',
          'javascript',
          'javascriptreact',
          'typescriptreact',
          'svelte',
          'vue',
          'tsx',
          'jsx',
          'xml',
          'php',
          'markdown',
          'astro',
        },

        -- Whether to allow self-closing on specific filetypes
        self_closing = {
          enable = true,
          filetypes = { 'xml', 'html', 'javascript', 'typescript', 'vue', 'svelte', 'jsx', 'tsx' },
        },

        -- Whether to remove closing tags when the opening tag is removed
        remove_close_tag = true,

        -- Whether to allow rename of paired tags
        rename_close_tag = true,

        -- Highlight the closing tag
        highlight = {
          enable = true,
          color = "#ff0000", -- Set your preferred color
        },
      })
    end,
  },
}


-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/vim-be-good',
    cmd = 'VimBeGood',
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      require 'custom.configs.harpoon'
    end,
    lazy = false,
  },
  {
    'mbbill/undotree',
    config = function()
      require 'custom.configs.undotree'
    end,
    lazy = false,
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    cmd = {
      'ObsidianOpen',
      'ObsidianWorkspace',
      'ObsidianNew',
      'ObsidianToday',
      'ObsidianSearch',
      'ObsidianQuickSwitch',
      'ObsidianFollowLink',
    },
    config = function()
      require 'custom.configs.obsidian'
    end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = {
      'DiffviewOpen',
    },
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup(require 'custom.configs.window-picker')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      require('bufferline').setup(require 'custom.configs.bufferline')
    end,
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'olimorris/codecompanion.nvim',
    version = '^18.3.1',
    opts = {},
    config = function()
      require('codecompanion').setup(require 'custom.configs.codecompanion')
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      preview = {
        filetypes = { 'codecompanion' },
        ignore_buftypes = {},
      },
    },
	-- Uncomment the config function to enable markview for all md files by default
    -- config = function()
    --   vim.g.markview_blink_loaded = true
    -- end,
  },
  {
    'HakonHarnes/img-clip.nvim',
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = '[Image]($FILE_PATH)',
          use_absolute_path = true,
        },
      },
    },
  },
  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      -- require('easy-dotnet').setup(require 'custom.configs.easy-dotnet')
      require('easy-dotnet').setup()
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      require 'custom.configs.dap'
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup(require 'custom.configs.dap-ui')
    end,
  },
}

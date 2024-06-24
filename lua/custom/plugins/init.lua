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
}

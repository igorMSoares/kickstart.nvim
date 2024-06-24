return {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['<CR>'] = 'open_with_window_picker',
      },
    },
    filtered_items = { hide_dotfiles = false, visible = true },
  },
  event_handlers = {
    {
      event = 'file_opened',
      handler = function(_)
        local command = require 'neo-tree.command'

        local window_count = 0
        for _ in pairs(vim.api.nvim_tabpage_list_wins(0)) do
          window_count = window_count + 1
        end

        -- if buffer is splitted into multiple windows
        if window_count > 2 then
          command.execute { action = 'close' }
        end
      end,
    },
  },
}

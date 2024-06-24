local bufferline = require 'bufferline'

return {
  options = {
    max_name_length = 20,
    tab_size = 22,
    diagnostics = 'nvim_lsp',
    show_buffer_icons = false,
    separator_style = 'thick',
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    },
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    offsets = {
      {
        filetype = 'neo-tree',
        text_align = 'center',
        separator = true,
      },
    },
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --     return "("..count..")"
    -- end,
    hover = {
      enabled = true,
      delay = 100,
      reveal = { 'close' },
    },
  },
}

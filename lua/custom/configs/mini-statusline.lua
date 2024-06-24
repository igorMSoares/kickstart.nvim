local statusline = require 'mini.statusline'

local H = {}

H.is_disabled = function()
  return vim.g.ministatusline_disable == true or vim.b.ministatusline_disable == true
end

H.default_content_active = function()
  H.use_icons = H.get_config().use_icons
  local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
  local git = statusline.section_git { trunc_width = 40 }
  local diff = statusline.section_diff { trunc_width = 75 }
  local diagnostics = statusline.section_diagnostics {
    trunc_width = 75,
    icon = '',
    signs = { ERROR = '✘', WARN = '▲', INFO = '🛈', HINT = '⚹' },
  }
  local lsp = statusline.section_lsp { trunc_width = 75 }
  local filename = statusline.section_filename { trunc_width = 140 }
  local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
  local location = statusline.section_location { trunc_width = 75 }
  local search = statusline.section_searchcount { trunc_width = 75 }
  H.use_icons = nil

  -- Usage of `statusline.combine_groups()` ensures highlighting and
  -- correct padding with spaces between groups (accounts for 'missing'
  -- sections, etc.)
  return statusline.combine_groups {
    { hl = mode_hl, strings = { mode } },
    { hl = 'MiniStatuslineDevinfo', strings = { git, diff, lsp } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = {} },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, diagnostics } },
    { hl = mode_hl, strings = { search, location } },
  }
end

H.get_config = function(config)
  return vim.tbl_deep_extend('force', statusline.config, vim.b.ministatusline_config or {}, config or {})
end

-- Utilities ------------------------------------------------------------------
H.get_filesize = function()
  local size = vim.fn.getfsize(vim.fn.getreg '%')
  if size < 1024 then
    return string.format('%dB', size)
  elseif size < 1048576 then
    return string.format('%.2fKiB', size / 1024)
  else
    return string.format('%.2fMiB', size / 1048576)
  end
end

H.ensure_get_icon = function()
  local use_icons = H.use_icons or H.get_config().use_icons
  if not use_icons then
    H.get_icon = nil
  end
  if use_icons and H.get_icon == nil then
    -- Have this `require()` here to not depend on plugin initialization order
    local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
    if has_devicons then
      H.get_icon = function()
        return devicons.get_icon(vim.fn.expand '%:t', nil, { default = true })
      end
    end
  end
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_fileinfo = function(args)
  return ''
  -- local icon = ''
  --
  -- -- Don't show anything if not inside a "normal buffer"
  -- if vim.bo.buftype ~= '' then
  --   return ''
  -- end
  --
  -- -- Add filetype icon
  -- H.ensure_get_icon()
  -- if H.get_icon ~= nil then
  --   icon = H.get_icon()
  -- end
  --
  -- -- Construct output string if truncated
  -- if statusline.is_truncated(args.trunc_width) then
  --   return icon
  -- end
  --
  -- return string.format('%s', icon)
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_lsp = function(args)
  return ''
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.active = function()
  if H.is_disabled() then
    return ''
  end

  return (H.get_config().content.active or H.default_content_active)()
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_filename = function(args)
  local dir_path = vim.fn.expand '%:h'

  if dir_path == '.' then
    print(dir_path)
    dir_path = string.match(vim.fn.expand '%:p:h', '([^/]+)$')
    print(dir_path)
  end

  -- In terminal always use plain name
  if vim.bo.buftype == 'terminal' then
    local terminal_name = string.match(vim.fn.expand '%t', '([Aa-zZ]+);')
    return terminal_name
  else
    -- directory path relative to the cwd + read-only flag when applicable
    return dir_path .. '%r'
  end
end

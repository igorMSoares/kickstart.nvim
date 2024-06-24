local obsidian = require("obsidian")

obsidian.setup({
    workspaces = {
        {
            name = "creath",
            path = "~/Documents/creath",
        },
        {
            name = "notes",
            path = "~/Documents/notes",
        },
    },
    --
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
    },

    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return tostring(os.time()) .. "-" .. suffix
    end,

    -- Optional, customize how wiki links are formatted.
    ---@param opts {path: string, label: string, id: string|?}
    ---@return string
    wiki_link_func = function(opts)
        if opts.id == nil then
            return string.format("[[%s]]", opts.label)
        elseif opts.label ~= opts.id then
            return string.format("[[%s|%s]]", opts.id, opts.label)
        else
            return string.format("[[%s]]", opts.id)
        end
    end,

    -- Optional, customize how markdown links are formatted.
    ---@param opts {path: string, label: string, id: string|?}
    ---@return string
    markdown_link_func = function(opts)
        return string.format("[%s](%s)", opts.label, opts.path)
    end,

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",

        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        mappings = {
            -- Create a new note from your query.
            new = "<C-x>",
            -- Insert a link to the selected note.
            insert_link = "<C-l>",
        },
    },

    -- Optional, sort search results by "path", "modified", "accessed", or "created".
    -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
    -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
    sort_by = "modified",
    sort_reversed = true,

    -- Optional, determines how certain commands open notes. The valid options are:
    -- 1. "current" (the default) - to always open in the current window
    -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
    -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
    open_notes_in = "current",

    -- Optional, configure additional syntax highlighting / extmarks.
    -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
    ui = {
        enable = true,         -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)

        -- Define how various check-boxes are displayed
        checkboxes = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            -- Replace the above with this if you don't have a patched font:
            -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
            -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

            -- You can also add more custom ones...
        },

        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        hl_groups = {
            -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
            ObsidianTodo = { bold = true, fg = "#f78c6c" },
            ObsidianDone = { bold = true, fg = "#89ddff" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
        },
    },
})


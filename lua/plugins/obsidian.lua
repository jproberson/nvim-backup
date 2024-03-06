return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false, -- true,
    -- ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = "~/vaults/work",
            },
            {
                name = "personal",
                path = "~/vaults/personal",
            },
        },
        notes_subdir = "Notes",
        templates = {
            subdir = "Templates",
            date_format = "%m/%d/%Y",
            time_format = "%I:%M %p",
        },
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "Notes/Daily",

            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%m-%d-%Y",

            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%m-%d-%Y",

            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            -- template = nil,
        },
        completion = {
            -- Set to false t%o disable completion.
            nvim_cmp = true,

            -- Trigger completion at 2 chars.
            min_chars = 2,

            -- Where to put new notes created from completion. Valid options are
            --  * "current_dir" - put new notes in same directory as the current buffer.
            --  * "notes_subdir" - put new notes in the default notes subdirectory.
            new_notes_location = "notes_subdir",

            -- Either 'wiki' or 'markdown'.
            preferred_link_style = "wiki",

            -- Control how wiki links are completed with these (mutually exclusive) options:
            --
            -- 1. Whether to add the note ID during completion.
            -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
            -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
            prepend_note_id = true,
            -- 2. Whether to add the note path during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
            -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
            prepend_note_path = false,
            -- 3. Whether to only use paths during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
            --
            -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
            use_path_only = false,
        },
        mappings = {
            -- Toggle check-boxes.
            ["<leader>oc"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true, desc = "Toggle checkbox" },
            },
            ["<leader>oC"] = {
                action = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get current cursor position
                    local current_line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, true)[1] or ""
                    local checkbox = "- [ ] "
                    local new_row_position = row
                    local new_col_position = string.len(checkbox)

                    if string.match(current_line, "^%s*$") then
                        -- If the current line is empty or whitespace, replace it with the checkbox
                        vim.api.nvim_buf_set_lines(bufnr, row - 1, row, false, { checkbox })
                    else
                        -- If the current line is not empty, insert the checkbox below the current line
                        vim.api.nvim_buf_set_lines(bufnr, row, row, false, { checkbox, "" })
                        new_row_position = row + 1 -- Move the cursor down one line to the new checkbox
                    end

                    -- Move the cursor to the position right after the newly inserted checkbox
                    vim.api.nvim_win_set_cursor(0, { new_row_position, new_col_position })
                end,
                opts = {
                    buffer = true,
                    desc = "Create checkbox with empty line below", -- Description of the mapping
                },
            },
        },
    },
}

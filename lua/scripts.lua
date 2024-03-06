local function getMondayDate(date)
    local dayOfWeek = os.date("*t", date).wday
    local diff = dayOfWeek - 2 -- Lua os.date() treats Sunday as 1, so Monday is 2
    return os.time{year=os.date("*t", date).year, month=os.date("*t", date).month, day=os.date("*t", date).day - diff}
end

function OpenWeeklyOncallNote()
    local today = os.time()
    local monday = getMondayDate(today)
    local friday = monday + (4 * 24 * 60 * 60) -- Add 4 days worth of seconds to get Friday

    local mondayDate = os.date("%m-%d", monday)
    local fridayDate = os.date("%m-%d", friday)
    local year = os.date("%Y", today)
    local weekRange = string.format("%s to %s", mondayDate, fridayDate)
    local weeklyNoteTitle = string.format("Oncall %s %s", weekRange, year)
    local homePath = os.getenv("HOME") or ""
    local weeklyNotePath = string.format("%s/vaults/work/Notes/OnCall/%s.md", homePath, weeklyNoteTitle)

    -- Correctly expand the home directory path for the template
    local templatePath = string.format("%s/vaults/work/Templates/oncall_template.md", homePath)
    local templateContent = ""

    -- Optional: Front matter

    -- Read the template content
    local file = io.open(templatePath, "r")
    if file then
        templateContent = file:read("*a") -- Read the entire content
        io.close(file)
    end

    -- Replace placeholder in the template content and prepend front matter
    templateContent = templateContent:gsub("{{week_range}}", weekRange)
    templateContent = templateContent:gsub("{{year}}", year)

    -- Check if the weekly note file exists, if not create it
    file = io.open(weeklyNotePath, "r")
    if not file then
        file = io.open(weeklyNotePath, "w") -- Create the file if it doesn't exist
        if file then
            file:write(templateContent)  -- Write the modified template content
            io.close(file)
        end
    else
        io.close(file)
    end

    -- Open the weekly note in Neovim
    vim.cmd("edit " .. weeklyNotePath)
end

vim.api.nvim_set_keymap("n", "<leader>ow", "<cmd>lua OpenWeeklyOncallNote()<CR>", {noremap = true, silent = true, desc = "Weekly Oncall Note"})


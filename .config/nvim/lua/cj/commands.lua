require('cj.system')

vim.api.nvim_create_user_command('Note', function (details)
    local name = "notes.md"

    local args = details.fargs
    if #args == 1 then
        name = args[1] .. ".md"
    end

    local date_info = os.date("*t");
    local dir_name = "/Users/cjhillbrand/notes/" .. date_info.year .. "/" .. date_info.month .. "/" .. date_info.day
    os.execute("mkdir " .. dir_name)

    local file_name = dir_name .. "/" .. name
    os.execute("touch " .. file_name)

    vim.cmd("e " .. file_name)
    vim.cmd("MarkdownPreview")
end,
{
    nargs = '?'
})

local function telescope_dir(dir)
   require('telescope.builtin').find_files({ cwd = dir });
end

local os = System.get_os()

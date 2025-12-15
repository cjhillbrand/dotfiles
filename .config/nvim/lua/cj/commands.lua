require('cj.system')

local function telescope_dir(dir)
   require('telescope.builtin').find_files({ cwd = dir });
end


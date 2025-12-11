-- Define static container for OS, or system specific methods.
System = { }

function System.get_os()
    return vim.loop.os_uname().sysname
end


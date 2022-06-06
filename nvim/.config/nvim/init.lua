local scripts = {
    "options",
    "keymaps",
    "plugins"
}

for k, script in pairs(scripts) do
    require("user." .. script)
end

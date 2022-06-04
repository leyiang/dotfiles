local scripts = {
    "options",
    "keymaps"
}

for k, script in pairs(scripts) do
    require("user." .. script)
end

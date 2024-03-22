local files = {
    'keymaps',
    'plugins',
    'options',
}

-- this feels very ugly but I don't know why
for _, file in ipairs(files) do
    require('prismo.' .. file)
end

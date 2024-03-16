local files = {
	'keymaps',
	'plugins',
	'options',
}

for _, file in ipairs(files) do
	require('prismo.' .. file)
end

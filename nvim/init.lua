local modules = {
	-- 'globals',
	'plugin-manager'
}

-- Load each module
for _, module in ipairs(modules) do
	local status, err = pcall(require, module)
	if not status then
		local error_message = string.format("Failed to load module %s with error %s.", module, err)
		print(error_message)
		return
	end
end


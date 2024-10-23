local lib = {}

lib.ignore_dirs = function(paths)
	if not type(paths) == "table" then
		return false
	end

	if #paths == 1 then
		return true
	end

	local i = 1

	while i <= #paths do
		if next(vim.fs.dir(paths[i])) == nil then
			return false
		end
		i = i + 1
	end

	return true
end

return lib

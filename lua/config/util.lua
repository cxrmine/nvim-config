local lib = {}

lib.ignore_paths = function(paths)
	local i = 0

	while (i <= #paths)
		do
			if not vim.fs.dirname(paths[i]) then
				return 0;
			end
			i = i + 1
		end
	return 1
end

return lib

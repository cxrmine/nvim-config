local M = {}

M.toTitleCase = function (s)
	local transformed = ""
	local separator = "-"
	local hasSeparator = false
	local uppercased = false
	local res = ""
	local i = 1

	if type(s) ~= "string" then
		return "Error: Invalid type"
	end
	transformed = string.lower(s)
	for c in string.gmatch(transformed, ".") do
		if string.byte(c) == 45 then
			hasSeparator = true
		end
	end
	if hasSeparator then
		for token in string.gmatch(transformed, "([^".. separator .."]+)") do
			uppercased = false
			for c in string.gmatch(token, ".") do
				if M.isalpha(c) and not uppercased then
					res = res .. string.upper(c)
					uppercased = true
					i = i + 1
				else
					res = res .. c
					i = i + 1
				end
			end
			res = res .. " "
		end
		return res
	end

	i = 1
	for c in string.gmatch(s, ".") do
		if M.isalpha(c) and not uppercased then
			res = res .. string.upper(c)
			uppercased = true
			i = i + 1
		else
			res = res .. c
			i = i + 1
		end
	end
	return res
end

M.isalpha = function (c)
	local code = string.byte(c)
	return (code >= 97 and code <= 122) or (code >= 65 and code <= 90)
end

return M

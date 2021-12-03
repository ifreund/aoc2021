local f = assert(io.open("input/01.txt"))
local input = f:read("*all")
f:close()

local lines = string.gmatch(input, "[^\n]+")
local previous = tonumber(lines())
local increases = 0
for line in lines do
	if tonumber(line) > previous then
		increases = increases + 1
	end
	previous = tonumber(line)
end

print("Part 1: ", increases)

local lines = string.gmatch(input, "[^\n]+")
local window = { tonumber(lines()), tonumber(lines()), tonumber(lines()) }
local increases = 0
local i = 0
for line in lines do
	local previous = window[1] + window[2] + window[3]
	window[i % 3 + 1] = tonumber(line)
	local current = window[1] + window[2] + window[3]
	if current > previous then
		increases = increases + 1
	end
	i = i + 1
end

print("Part 2: ", increases)

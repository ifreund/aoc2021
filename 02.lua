local f = assert(io.open("input/02.txt"))
local input = f:read("*all")
f:close()

local horizontal = 0
local depth = 0
for line in string.gmatch(input, "[^\n]+") do
	local words = string.gmatch(line, "%S+")
	local direction = words()
	local units = tonumber(words())
	assert(not words())

	if direction == "forward" then
		horizontal = horizontal + units
	elseif direction == "down" then
		depth = depth + units
	elseif direction == "up" then
		depth = depth - units
	end
end

print("Part 1:", horizontal * depth)

local aim = 0
local horizontal = 0
local depth = 0
for line in string.gmatch(input, "[^\n]+") do
	local words = string.gmatch(line, "%S+")
	local direction = words()
	local units = tonumber(words())
	assert(not words())

	if direction == "forward" then
		horizontal = horizontal + units
		depth = depth +  aim * units
	elseif direction == "down" then
		aim = aim + units
	elseif direction == "up" then
		aim = aim - units
	end
end

print("Part 2:", horizontal * depth)

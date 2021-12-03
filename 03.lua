local f = assert(io.open("input/03.txt"))
local input = f:read("*all")
f:close()

local bit = require("bit")
local function is_set(x, b)
	return bit.band(x, bit.lshift(1, b - 1)) ~= 0
end

local value_len = string.len(input:match("[^\n]+"))
local report = {}
for line in input:gmatch("[^\n]+") do
	report[tonumber(line, 2)] = true
end

local counts = {}
for value in pairs(report) do
	for i = 1, value_len do
		if not counts[i] then counts[i] = 0 end
		if is_set(value, i) then
			counts[i] = counts[i] + 1
		else
			counts[i] = counts[i] - 1
		end
	end
end

local gamma = 0
local epsilon = 0
for i, count in ipairs(counts) do
	if count > 0 then
		gamma = gamma + 2 ^ (i - 1)
	else
		epsilon = epsilon + 2 ^ (i - 1)
	end
end

print("Part1:", gamma * epsilon)

local report_len = 0
local report_copy = {}
for value in pairs(report) do
	report_len = report_len + 1
	report_copy[value] = true
end

local function rating(report, oxygen)
	local len =report_len
	local i = value_len
	while len > 1 do
		local count = 0
		for value in pairs(report) do
			if is_set(value, i) then
				count = count + 1
			else
				count = count - 1
			end
		end
		for value in pairs(report) do
			if (is_set(value, i) ~= (count >= 0)) == oxygen then
				report[value] = nil
				len = len - 1
			end
		end
		i = i - 1
	end
	return next(report)
end

local oxygen_rating = rating(report, true)
local co2_rating = rating(report_copy, false)

print("Part2:", oxygen_rating * co2_rating)

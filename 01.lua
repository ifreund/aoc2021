increases = 0
previous = nil
for line in io.lines("input/01.txt") do
    if not previous then previous = tonumber(line) end
    if tonumber(line) > previous then
        increases = increases + 1
    end
    previous = tonumber(line)
end

print("Part 1: ", increases)

increases = 0
window = {0, 0, 0}
i = 0
for line in io.lines("input/01.txt") do
    if i < 3 then
        window[i % 3] = tonumber(line)
    else
        previous = window[0] + window[1] + window[2]
        window[i % 3] = tonumber(line)
        current = window[0] + window[1] + window[2]
        if current > previous then
            increases = increases + 1
        end
	end
    i = i + 1
end

print("Part 2: ", increases)

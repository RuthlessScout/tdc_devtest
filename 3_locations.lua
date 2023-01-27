local points = { --Table with both points

    ["a"] = {
        x = 100,
        y = 120
    },
    ["b"] = {
        x = 200,
        y = 250
    },

}

local DIFx = points["a"].x - points["b"].x -- Simple maths for diffrenceses between x and y axis of a point
local DIFy = points["a"].y - points["b"].y

if DIFx < 0 then -- Checking if values are negative and turning them into positive 
    DIFx = -DIFx
end
if DIFy < 0 then
    DIFy = -DIFy
end

print("Diffrance between x axis : "..DIFx..", Diffrance between y axis : "..DIFy.."")

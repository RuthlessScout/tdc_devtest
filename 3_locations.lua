local points = { --Table with both points

    ["a"] = {
        x = 2,
        y = 4
    },
    ["b"] = {
        x = 6,
        y = 8
    },

}

local dist = math.sqrt( (points["b"].x-points["a"].x)^2 + (points["b"].y-points["a"].y)^2 )

print("Distance - "..dist.."")

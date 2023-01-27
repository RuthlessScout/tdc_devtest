local shahmat = {} -- Регистриране на таблица

local cherno = 1 -- Цветове, за да могат лесно да се променят
local bqlo = 0

print("Shahmatna daska")

for i = 1, 8 do -- Фор лууп, за да създадем едната страна на матрицата
    shahmat[i] = {}
    for a = 1, 8 do -- Фор лооп за втората страна
        if (i + a) % 2 == 0 then
            shahmat[i][a] = cherno
        else
            shahmat[i][a] = bqlo
        end
    end
end

for i = 1, 8 do -- И последен Фоор лооп, за да може да се принтне
    for j = 1, 8 do
        io.write(shahmat[i][j] .. " ")
    end
    print()
end

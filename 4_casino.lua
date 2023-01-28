local cena = 5

print("Zdraveite! Dobre doshlii v CAZINO REKA TUNDJA")
print("S kolko para ste do6li dnes?")
local money = io.read()
print("Breh "..money.."leva ne sa malko kinti")
local vrutvaniq = math.floor(money / cena)
print("S tezi pari imate "..vrutvaniq.." vrutki")
print("Kolko vrutvaniq iskate da napravite?")
local Broivrutvaniq = tonumber(io.read())

if Broivrutvaniq <= vrutvaniq then
local nagradi = {"strawberry", "melon", "apple", "7", "star"}
local pechalba = 0

  
    for i = 1, Broivrutvaniq do
      local spin = {}
      for j = 1, 3 do
        spin[j] = nagradi[math.random(#nagradi)]
      end
  
      if spin[1] == spin[2] and spin[2] == spin[3] then
        if spin[1] == "strawberry" then
          pechalba = pechalba + 10
        elseif spin[1] == "melon" then
          pechalba = pechalba + 15
        elseif spin[1] == "apple" then
          pechalba = pechalba + 20
        elseif spin[1] == "7" then
          pechalba = pechalba + 25
        elseif spin[1] == "star" then
          pechalba = pechalba + 50
        end
      end
      print("["..spin[1].."] - ["..spin[2].."] - ["..spin[3].."]")
      
    end

    print("Specheli - "..pechalba.."lv") 

    
end

--print("Welcome to Ruthless Casino")
--print("Num1:")
--local num1 = io.read()
--print("num2:")
--local num2 = io.read()
--print("Choose operator: + / - / * / /")
--local operator = io.read()
--if operator == "+" then
--   local add = num1 + num2
--   print(add)     
--end 
--if operator == "-" then
--   local subtract = num1 - num2
--   print(subtract)   
--end
--if operator == "*" then
--   local multiply = num1 * num2
--   print(multiply)
--end   
--if operator == "/" then  
--   local devide = num1 / num2
--   print(devide) 
--end
--io.read()


    

  
local cars = {"btype2"}
local spawncar = {}
local carspawned = false
local twopeds = {}
local onepeds = {}
local npcHash = GetHashKey("a_f_m_bodybuild_01")
local closestVEH
local exploded = false

--DISCLAIMER опитвах се да направя всичко околу колата, тоест да не взима кординати от педовете
--но не можах да направя като хората native-ите, сори, другото е, че можах да вкарам само единия педовет
--малко е разхвърляно, може да се види кое как съм се опитвал, но квот такова

local function Spawncar(car)
	local ped = GetPlayerPed(-1)
	local pedcoords = GetEntityCoords(ped)
	local car = GetHashKey(car)

	RequestModel(car)
	while not HasModelLoaded(car) do
		RequestModel(car)
		Citizen.Wait(0)
	end
	
	local x,y,z = table.unpack(pedcoords)
	local vehicle = CreateVehicle(car, x,y,z, 0.0, true, false)
	SetEntityAsMissionEntity(vehicle, true, true)
	carspawned = true
	spawnNPC()
end

function spawnNPC()
	local ped = GetPlayerPed(-1)
	local pedcoords = GetEntityCoords(ped)
	--local carhash = GetEntityModel(`btype2`)
	closestVEH = GetClosestVehicle(pedcoords.x, pedcoords.y, pedcoords.z,5.0, 0  , 70)
	local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(closestVEH)
	--local carcoords = GetClosestVehicle(pedcoords['x'],  pedcoords['y'],  pedcoords['z'],  2.0,  0,  71)
	print(closestVEH)
	RequestModel(npcHash)
	while not HasModelLoaded(npcHash) do
		Citizen.Wait( 1 )
	end
	onepeds = CreatePed(5,npcHash, pedcoords['x'] - 3, pedcoords['y'], pedcoords['z'] - 1 )
	twopeds = CreatePed(5,npcHash, pedcoords['x'] + 3, pedcoords['y'], pedcoords['z'] - 1 )
	SetEntityInvincible(twopeds, true)
	SetBlockingOfNonTemporaryEvents(twopeds, true)
	Citizen.Wait(1000)
	TaskWarpPedIntoVehicle(twopeds, closestVEH, freeSeat)
	--TaskWarpPedIntoVehicle(onepeds, closestVEH, freeSeat)
	TaskEnterVehicle(twopeds, closestVEH, -1,2, freeSeat, 1.0, 0)
	Wait(10000)
	TaskEnterVehicle(onepeds, closestVEH, -1,2, freeSeat, 1.0, 0)
	--TaskStartScenarioInPlace(twopeds, "WORLD_HUMAN_DRINKING", 0, true)
end

RegisterCommand("tdc", function()
	local car = (cars[math.random(#cars)])
	spawncar = Spawncar(car)
end)

CreateThread(function()
	while true do
	local sleep = 250
	Citizen.Wait(sleep)
		if carspawned and not exploded then
			sleep = 10
			local pedcoords = GetEntityCoords(twopeds)
			local ped = GetPlayerPed(-1)
			local playerCoords = GetEntityCoords(ped)
			local vehtoexplode = GetClosestVehicle(pedcoords.x, pedcoords.y, pedcoords.z,5.0, 0  , 70)
			local vehtoexplosion = GetEntityCoords(vehtoexplode)
			local pos = GetDistanceBetweenCoords(pedcoords.x, pedcoords.y, pedcoords.z, playerCoords.x, playerCoords.y, playerCoords.z, false)
			
			if pos >= 10 then
				--print(vehtoexplode)
				--print("PENIS")
				--ExplodeVehicle(vehtoexplode, true, true)
				AddExplosion(pedcoords.x, pedcoords.y, pedcoords.z, 'EXPLOSION_CAR', 1.0, true, false, 0)
				exploded = true
				
			end
		end
	end
	
end)
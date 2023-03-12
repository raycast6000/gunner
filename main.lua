local Player = game.Players.LocalPlayer
local core = {}
local defaultPropTable = {
    --[[
        I didn't want to do this but I have to, because other
        methods are causing stack overflows.
    ]]

    ["M4A1"] = {
        Damage = 11, 
	    Description = "black monkey", 
	    MaxAmmo = 30, 
	    CurrentAmmo = 30, 
	    StoredAmmo = 600, 
	    FireRate = 0.0875, 
	    AutoFire = true, 
	    Range = 800, 
        Spread = 18, 
	    ReloadTime = 2, 
	    Bullets = 1, 
	    ReloadAnim = "ReloadMagazine", 
    	ShootAnim = "ShootBullet", 
	    HoldAnim = "Hold", 
	    FireSoundId = "http://www.roblox.com/asset/?id=2934888536", 
	    SecondarySoundId = nil, 
	    ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
    },
    ["M9"] = {
        Damage = 10, 
	Description = "I'm the highest in the room", 
	MaxAmmo = 15, 
	CurrentAmmo = 15, 
	StoredAmmo = 100, 
	FireRate = 0.08, 
	AutoFire = false, 
	Range = 600, 
	Spread = 11, 
	ReloadTime = 2, 
	Bullets = 1, 
	ReloadAnim = "ReloadMagazine", 
	ShootAnim = "ShootBullet", 
	HoldAnim = "Hold", 
	FireSoundId = "http://www.roblox.com/asset/?id=2934888024", 
	SecondarySoundId = nil, 
	ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
    },
    ["AK-47"] = {
        Damage = 11, 
	Description = "Remember to put a description here BEFORE the game is published -Me", 
	MaxAmmo = 30, 
	CurrentAmmo = 30, 
	StoredAmmo = 600, 
	FireRate = 0.1, 
	AutoFire = true, 
	Range = 800, 
	Spread = 14, 
	ReloadTime = 2, 
	Bullets = 1, 
	ReloadAnim = "ReloadMagazine", 
	ShootAnim = "ShootBullet", 
	HoldAnim = "Hold", 
	FireSoundId = "http://www.roblox.com/asset/?id=2934888736", 
	SecondarySoundId = nil, 
	ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
    },
    ["Remington 870"] = {
        Damage = 15, 
	Description = "Remember to put a description here BEFORE the game is published -Me", 
	MaxAmmo = 6, 
	CurrentAmmo = 6, 
	StoredAmmo = 600, 
	FireRate = 0.8, 
	AutoFire = false, 
	Range = 400, 
	Spread = 3, 
	ReloadTime = 4, 
	Bullets = 5, 
	ReloadAnim = "ReloadShells", 
	ShootAnim = "ShootShell", 
	HoldAnim = "Hold", 
	FireSoundId = "http://www.roblox.com/asset/?id=2934889760", 
	SecondarySoundId = "http://www.roblox.com/asset/?id=255061173", 
	ReloadSoundId = "http://www.roblox.com/asset/?id=2934888952"
    },
    ["Taser"] = {
        Description = "Remember to put a description here BEFORE the game is published -Me", 
	MaxAmmo = 1, 
	CurrentAmmo = 1, 
	Range = 100, 
	Spread = 30, 
	ReloadTime = 3, 
	Bullets = 1, 
	ReloadAnim = "ReloadMagazine", 
	ShootAnim = "ShootBullet", 
	HoldAnim = "Hold", 
	FireSoundId = "http://www.roblox.com/asset/?id=2934889941", 
	SecondarySoundId = nil, 
	ReloadSoundId = "http://www.roblox.com/asset/?id=82273261"
    }
}

function core:trickGun(gunName, properties)
    --> Metatable for those nil properties.
    setmetatable(properties, {
        __index = function(self, index)
            if rawget(self, index) == nil and not checkcaller() then
                local caller = getcallingscript()
                print(caller, "tried to index a nil property, returning default.")

                return defaultPropTable[gunName][index]
            end
            
            return self[index]
        end
    })
    
    oldFn = hookfunction(getrenv().require, newcclosure(function(rmod)
    local caller = getcallingscript()
    
    if caller:isA("LocalScript") and rmod.Name == "GunStates" and rmod.Parent.Name == gunName and not checkcaller() then
        return properties
    end
    
    return oldFn(rmod)
end))
end

return core

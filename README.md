# gunner
A modding API for Prison Life guns.
```lua
local API: {} = loadstring(game:HttpGet("https://raw.githubusercontent.com/raycast6000/gunner/main.lua"))()
```
# Usage
To apply a modification for any gun just call the `trickGun` function. For example:
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/raycast6000/gunner/main.lua"))()

API:trickGun("Gun name, M4A1, M9, etc", {
    FireRate = 0.01,
    MaxAmmo = 69
})
```
As we can see, the `trickGun` function takes two arguments, `GUNNAME` and `PROPERTYTABLE`. The `GUNNAME` argument contains, obviously, the gun name, and the `PROPERTYTABLE` is a table containing your modded properties, such as `FireRate` or `MaxAmmo`. Unchanged properties will remain the same. \
# Property list
To make your life more easier, here is a list of properties that almost any gun use.
- FireRate
- MaxAmmo
- ReloadTime
- Bullets (amount of bullets per shot)
- Range
- CurrentAmmo (amount of ammo by default)
- Damage (this does not get replicated btw)
- AutoFire (hold or not hold left click to shoot)
# Please give credits ❤

Config = {}

-- Jam probability per shot
Config.JamChance = 0.01 -- Keep this at 0.03 So it don't jam every 2 shots.
-- Time to fix weapon jam in milliseconds
Config.FixTime = 3000

-- Keybind for fixing jams
Config.JamFixKey = 38 -- Default: E

-- Notification messages
Config.Messages = {
    Jammed = "Your weapon is jammed! Press E to fix it.",
    Fixing = "Fixing weapon jam...",
    Fixed = "Weapon jam fixed! You're good to go."
}

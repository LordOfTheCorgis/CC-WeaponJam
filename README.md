# CC-WeaponJam - FiveM Weapon Jam Script

**CC-WeaponJam** is a script for FiveM that introduces a weapon jamming mechanic. Weapons can randomly jam during use, and players must fix them before they can fire again. This script is open-source and available for anyone to use or modify.

---

## Features

- **Weapon Jam Chance:** Weapons can jam with a configurable probability.
- **Jammed State:** Tracks which weapons are jammed and prevents firing.
- **Weapon Types:** Melee and throwable weapons are excluded from jamming.
- **Jam Fixing:** Players can fix their jammed weapons with a key press.
- **Customizable Messages:** Messages for when a weapon jams, is being fixed, or is fixed are configurable.

---

## Planned Updates

1. **Add Sound When Unjamming:** Include sound effects when a weapon is successfully unjammed.
2. **Add Animations:** Add animations for players to perform when fixing a jammed weapon.

---

## Installation

1. Download or clone this repository to your server's resources folder.
2. Add `start CC-WeaponJam` to your `server.cfg`.
3. Configure the script in `config.lua` for customizable settings like jam chance, fix time, and messages.

---

## Configuration

In the `config.lua` file, you can adjust the following settings:

- `JamChance`: A number between 0 and 1, representing the probability of a weapon jamming when used (e.g., 0.1 for 10% chance).
- `FixTime`: The time (in milliseconds) it takes to fix a jammed weapon.
- `JamFixKey`: The key to press to fix the jammed weapon.
- `Messages`: Customizable messages displayed when a weapon jams, is being fixed, or is fixed. You can set your own text for:
  - `Jammed`: The message shown when a weapon jams.
  - `Fixing`: The message shown while fixing the weapon.
  - `Fixed`: The message shown after a weapon is fixed.

---

## Usage

- When a weapon jams, the player will not be able to fire it until it is fixed.
- To fix a jammed weapon, press the configured key (default in `Config.JamFixKey`).
- When the weapon is jammed, it will show a notification to the player with the configured message.
  
---

## Functions

- `attemptToJamWeapon()`: Attempts to jam the current weapon if conditions are met (chance, weapon type).
- `isMeleeOrThrowable(weapon)`: Determines whether the weapon is melee or throwable and should not jam.
- `disableWeaponFire(weapon)`: Disables the weapon's firing until it is fixed.
- `fixWeaponJam()`: Fixes a jammed weapon and notifies the player.
- `weaponJam:notify`: Custom event to show notifications to the player.

---

## Events

- `weaponJam:notify`: Triggers a notification with the provided message (e.g., "Weapon Jammed", "Fixing Weapon").
  
---

## Requirements

- **FiveM server**

---

## License

This script is open-source and available for free. Feel free to use and modify it, but credit the original authors if you decide to distribute it. Contributions are welcome!

---

## Disclaimer

This script is provided "as-is" without any warranty. Use at your own risk.

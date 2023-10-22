# Other You Elite Crew Appearance Fix
Fixes a Starfield bug causing the Other You Elite Crew to change appearance after you use an Enhance. This makes no sense, You went to the Enhance, not Other You!

## Explanation
Having found out about the Other You Elite Crew I wanted to have them so that I could essentiallyt have my own custom companion, they'd just be whoever I was when I met them, and then I could change my own character's customization to whatever I wanted.

This did not end up working.

By default the `CrewEliteOtherPlayerScript` script has a state machine that switches back to it's uninitialized "WaitingForPlayer" state after it's 3D data is unloaded.

The things it does during this initialization (setting up their appearance, voice, and quest connections) do not need to happen more than once, and unless something changed from Skyrim and Fallout 4, [may even cause bugs](https://falloutck.uesp.net/wiki/ForceRefTo_-_ReferenceAlias#Notes:~:text=Calling%20this%20multiple%20times%20in%20a%20row).

This simple script edit (all I've done is comment out the line that switches the state back) will prevent the script from repeatedly re-initializing the Other You Elite Crew companion.

## Tools Used
Created using  [Bethesda Archive Extractor](https://www.nexusmods.com/starfield/mods/165),  [Champollion](https://www.nexusmods.com/starfield/mods/4528), and  [Caprica](https://github.com/Orvid/Caprica), in that order.

## Build Instructions
1. Using [BAE](https://www.nexusmods.com/starfield/mods/165) extract Starfield's scripts from `Data\Starfield - Misc.ba2`  into a dedicated folder, then decompile them using [Champollion](https://www.nexusmods.com/starfield/mods/4528). I would recommend doing this each time Starfield updates.
2. Edit `build.bat`'s variables to point at your newly decompiled scripts, and a copy of [Caprica](https://github.com/Orvid/Caprica).
3. Run `build.bat`

## Installation Instructions
Install manually or with mod manager of your choice. Requires  [archive invalidation](https://www.nexusmods.com/starfield/articles/116).
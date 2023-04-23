#### Description
This addon helps prevent accidental PvP flagging and warns when flagged.    
Please note that the addon will not function while in instances.    
You can enable or disable the features of the addon by using the /hcwarn or /hcw command.
### Features
#### Player Warning
If you are PvP flagged a warning will be displayed, a screen border will be shown and a pvp sound will be played.   
#### Target Warning
The addon includes an target setting "/hcwarn target" to help prevent flagging yourself for pvp.   
If the target setting is OFF, the addon will stop interaction by clearing the target.    
#### The target setting is ON by default - this setting is saved per character.
#### If you are hardcore:     
- Turtle WoW allows hardcore players to assist NPC PvP units without PvP flagging but does not allow you to assist player targets.   
- If the target setting is ****ON**** and you are targeting a PvP flagged enemy, a warning will be displayed.
- If the target setting is ****OFF**** and you are targeting a PvP flagged enemy, the target will be cleared.
#### If you are NOT hardcore:     
- If the target setting is ****ON**** and you are targeting a PvP flagged unit, a warning will be displayed.      
- If the target setting is ****OFF**** and you are targeting a PvP flagged unit, the target will be cleared.
- If the target setting is off you can still interact with friendly targets that are PvP flagged by right clicking.
#### Quest Warning
The addon includes a warning for quests that involve the potential to flag yourself for pvp ([based on this post](https://forum.turtle-wow.org/viewtopic.php?f=37&t=4490)).     
A warning will show in the quest detail window - mouseover the warning to show the details.     
If you find a quest that involves PvP that is not listed, please create an [issue](https://github.com/GryllsAddons/HCWarn/issues).
### Macros to prevent casting on PvP units
If using the mouseover mod included in [ShaguTweaks-Mods](https://github.com/GryllsAddons/ShaguTweaks-Mods), it will take the target setting into account.    
For example if you use the /stcast macro below and the target setting is off, you will not be able to cast on the mouseover unit.
```
/stcast Heal
```
Other ways to prevent casts include using the "nopvp" condition included in [Roid-Macros](https://github.com/DennisWG/Roid-Macros):
```
/cast [@mouseover nopvp nodead] Heal; Heal
```
You can also use "not UnitIsPVP("target")" in a macro:
```
if not UnitIsPVP("target") then CastSpellByName("Heal") end
```
### Addon Compatibility
The addon is compatible with [unitscan](https://github.com/shirsig/unitscan-vanilla) and [unitscan-turtle](https://github.com/GryllsAddons/unitscan-turtle).    
For other useful hardcore addons, please see [HCRank](https://github.com/GryllsAddons/HCRank) and [codex](https://github.com/nakda/codex).  

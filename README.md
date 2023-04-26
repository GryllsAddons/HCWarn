### Description
This addon helps prevent accidental PvP flagging and warns when flagged.    
The addon will not function while in instances.    

### Features
You can toggle features of the addon by using the /hcwarn or /hcw command.
| Feature | Description |
| --- | --- |
| Player Warning | <b>If you are PvP flagged</b><li>A warning will be displayed</li><li>A screen border will be shown</li><li>A PvP sound will be played.</li> |
| Target Warning | The addon includes a target setting "/hcwarn target" to allow or prevent you from targeting PvP flagged enemies.<br>The setting is on (allow) by default.<br><br><b>If the target setting is on or you are PvP flagged</b><li>If you are targeting a PvP flagged enemy, a warning will be displayed.</li><br><b>If the target setting is off</b><br><li>If you attempt to target a PvP flagged enemy, the target will be cleared ****unless**** you are PvP flagged.</li> |
| Quest Warning | The addon includes a warning for quests that involve the potential to flag yourself for pvp (based on [this post](https://forum.turtle-wow.org/viewtopic.php?f=37&t=4490)).<br>A warning will show in the quest detail window.<br>Mouseover the warning to show the PvP information for the quest.<br>If you find a quest that involves PvP that is not listed, please create an [issue](https://github.com/GryllsAddons/HCWarn/issues). |
| Mouseover support | The mouseover mod included in [ShaguTweaks-Mods](https://github.com/GryllsAddons/ShaguTweaks-Mods) supports HCWarn.<br>The mod will prevent any /stcast macros from casting on PvP enemies when outside instances unless you are PvP flagged. |

### Macros to prevent casting on PvP units
If you are not using [ShaguTweaks-Mods](https://github.com/GryllsAddons/ShaguTweaks-Mods) you can prevent casts on PvP flagged units by using the *****nopvp***** condition in [Roid-Macros](https://github.com/DennisWG/Roid-Macros).
```
/cast [@mouseover nopvp nodead] Heal
```
You can also use *****not UnitIsPVP("target")***** in a macro without addons.
```
if not UnitIsPVP("target") then CastSpellByName("Heal") end
```

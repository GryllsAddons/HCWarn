### HCWarn
This addon helps prevent accidental PvP flagging and warns when flagged.    
The addon was primarily created with [hardcore](https://turtle-wow.org/#/hardcore-mode]) players in mind.    
The addon is compatible with [unitscan](https://github.com/shirsig/unitscan-vanilla) and [unitscan-turtle](https://github.com/GryllsAddons/unitscan-turtle).    

For other useful hardcore addons, please see [HCRank](https://github.com/GryllsAddons/HCRank) and [codex](https://github.com/nakda/codex).

### Warnings and Targeting
If you are PvP flagged, a warning will be displayed and a screen border will be shown. A pvp sound will also be played.   
  
The addon includes an target setting to help prevent flagging yourself for pvp.   
You can prevent casts on a flagged unit by using this setting with the mouseover mod (/stcast) included in [ShaguTweaks-Mods](https://github.com/GryllsAddons/ShaguTweaks-Mods).

#### The target setting is OFF by default - this setting is saved per character. You can toggle this setting by using /hcwarn target
#### If you are hardcore:     
- Turtle WoW allows hardcore players to assist NPC PvP units without PvP flagging but does not allow you to assist player targets.   
- If the target setting is **ON** and you are targeting a PvP flagged enemy, a warning will be displayed.
- If the target setting is **OFF** and you are targeting a PvP flagged enemy, the target will be cleared.
#### If you are NOT hardcore:     
- If the target setting is **ON** and you are targeting a PvP flagged unit, a warning will be displayed.      
- If the target setting is **OFF** and you are targeting a PvP flagged unit, the target will be cleared.
- You can still interact with friendly targets that are PvP flagged by right clicking.
### Instances
The addon will not display warnings or clear targets while in instances.     
The target setting will be displayed when logging in or when leaving instances.       
### Quests
The addon includes a warning for quests that involve the potential to flag yourself for pvp ([based on this post](https://forum.turtle-wow.org/viewtopic.php?f=37&t=4490)).     
A warning will show in the quest detail window - mouseover the warning to show the details.     
If you find a quest that involves PvP that is not listed, please create an [issue](https://github.com/GryllsAddons/HCWarn/issues).
### Usage
/hcwarn or /hcw    
### Commands
/hcwarn target - toggle targeting PvP flagged units
/hcwarn sound - toggle PvP warning sound
/hcwarn border - toggle PvP warning border
/hcwarn warn player - toggle PvP warning for your character
/hcwarn quest - toggle PvP warning for quests
/hcwarn reset - reset settings

### HCWarn
This addon helps prevent accidental PvP flagging and warns when flagged.    
The addon was primarily created with [hardcore](https://turtle-wow.org/#/hardcore-mode]) players in mind.    
The addon is compatible with [unitscan](https://github.com/shirsig/unitscan-vanilla) and [unitscan-turtle](https://github.com/GryllsAddons/unitscan-turtle).

### Warnings:
If you are PvP flagged, a warning will be displayed and a screen border will be shown. A pvp sound will also be played.   
Turtle WoW allows hardcore players to assist NPC PvP units without PvP flagging but does not allow you to assist player targets without flagging.     
The addon includes an interact setting to help prevent flagging yourself for pvp.   
You can prevent casts on a flagged unit by using this setting with the mouseover mod (/stcast) included in [ShaguTweaks-Mods](https://github.com/GryllsAddons/ShaguTweaks-Mods).

#### The interact setting is OFF by default - this setting is saved per character. You can toggle this setting by using /hcwarn interact
#### If you are hardcore:     
- If the interact setting is **ON** and you have an PvP flagged enemy, a warning will be displayed.    
- If the interact setting is **OFF** and you have an PvP flagged enemy, the target will be instantly cleared if the target is a player.
#### If you are NOT hardcore:     
- If the interact setting is **ON** and you have an PvP flagged target, a warning will be displayed.    
- If the interact setting is **OFF** and you have an PvP flagged target, the target will be instantly cleared if the target is a player.
### Instances
The addon will not display warnings or clear targets while in instances.     
The interact setting will be displayed when logging in or when leaving instances.       
### Quests
The addon includes a warning for quests that involve the potential to flag yourself for pvp ([based on this post](https://forum.turtle-wow.org/viewtopic.php?f=37&t=4490)).     
A warning will show in the quest detail window - mouseover the warning to show the details.     
### Usage
/hcwarn or /hcw    
### Commands
/hcwarn interact - toggle interaction with PvP flagged targets     
/hcwarn sound - toggle PvP warning sound     
/hcwarn border - toggle PvP warning border     
/hcwarn player - toggle PvP warning for your character     
/hcwarn target - toggle PvP warning for your target     

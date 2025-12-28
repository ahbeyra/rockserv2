# Admin Commands (Fuzzem)

This is the admin command reference for the Fuzzem realm. Commands are defined in `fuzzem/src/commands.bse`.

Conventions:
- `<player>`: character name or userid
- `<objid>`: object id
- `<room>`: room id
- `<rec>`: item record id
- `<effect>`: effect id

## Special Event Usage

To list available special events:
- `specialevent`
- `specialevent status`
- `specialevent list`

To enable an event:
- `specialevent on krazy_killols`

To disable it:
- `specialevent off krazy_killols`

## Admin Commands (Arguments)

| Command | Syntax | Description |
| --- | --- | --- |
| `OLDgoto` | `OLDgoto <objid> <room>` | Legacy goto variant (deprecated). |
| `actvalidate` | `actvalidate <args>` | Validates an action definition and prints errors. |
| `altscan` | `altscan <userid> [order]` | Runs alt-watch scan for a userid. |
| `ash` | `ash <message>` | Admin-only shout channel. |
| `bcast` | `bcast <message>` | Sends a stylized broadcast to all players. |
| `beep` | `beep <player> <message>` | Sends a beep message to a player. |
| `chgrp` | `chgrp <group>` | Sets your creation group. |
| `cp` | `cp <amount>` | Adds CP to your character. |
| `cr` | `cr <rec>` | Spawns an item by record id (restricted to ISABOB). |
| `cryl` | `cryl <args>` | Performs the admin action `cryl`. |
| `dblist` | `dblist <db> [filter]` | Lists DB entries with optional filter. |
| `dnum` | `dnum <objid>` | Shows an object’s description compression index. |
| `echo` | `echo <message>` | Echoes a message to your room and to you. |
| `effect` | `effect <effect-id>` | Adds an effect to yourself by id. |
| `effects` | `effects` | Lists your active effects with remaining duration. |
| `eject` | `eject <player>` | Soft-kicks a player session. |
| `eshout` | `eshout <message>` | Echoes a message to all players. |
| `etell` | `etell <player> <message>` | Sends an echo message to a player. |
| `evalll` | `evalll <perl>` | Evaluates Perl code (restricted to specific admins). |
| `find` | `find <player>` | Auto-walks to a target player. |
| `findfx` | `findfx <text>` | Greps effects files for text and prints results. |
| `findme` | `findme <objid>` | Summons an object to you using AI movement. |
| `findrec` | `findrec <text>` | Greps item files for text and prints results. |
| `force` | `force <player> <command>` | Forces a player to execute a command. |
| `forcerules` | `forcerules <player>` | Forces a player to read rules. |
| `freemv` | `freemv <value>` | Adjusts free movement points. |
| `freeze` | `freeze <player>` | Freezes a player (disables actions). |
| `gender` | `gender <player> <m|f>` | Sets a player’s gender. |
| `giftuserexp` | `giftuserexp <player> <levels>` | Gives EXP equal to a number of levels and notifies the player. |
| `giftuserexpraw` | `giftuserexpraw <player> <exp>` | Grants a raw EXP amount to the player. |
| `goto` | `goto <room|objid>` | Teleports to a room or object. |
| `gotostalk` | `gotostalk <player>` | Teleports to a player and enables stalking. |
| `hardeject` | `hardeject <player>` | Force-closes a player socket. |
| `hp` | `hp <amount>` | Sets your HP to max + value. |
| `ipscan` | `ipscan <ip>` | Looks up last known user for an IP. |
| `lcoms` | `lcoms <player> <lines>` | Shows last commands for a player. |
| `levelto` | `levelto <level>` | Sets your level by recalculating stats. |
| `ma` | `ma <amount>` | Sets your mana to max + value. |
| `mistrana` | `mistrana <player>` | Triggers assassin haunt on a player. |
| `mockshout` | `mockshout <name> <text>` | Sends a shout as if from another name. |
| `modex` | `modex <exit>` | Modifies a room exit using exit_mod. |
| `movesto` | `movesto <objid>` | Shows estimated minimum moves to reach you. |
| `msg` | `msg <message>` | Disabled placeholder; tells user to use forums. |
| `namecaps` | `namecaps <player> <newcase>` | Changes only the capitalization of a player name. |
| `namechange` | `namechange <player> <newname>` | Changes a player’s login name after validation. |
| `nm` | `nm <args>` | Performs the admin action `nm`. |
| `noturns` | `noturns <player>` | Sets a player’s turns to 0 and forces rules flag. |
| `objfx` | `objfx <objid> <effect>` | Adds an effect to an object. |
| `objfxg` | `objfxg <objid> <effect>` | Reads an effect from an object. |
| `objvg` | `objvg <objid> <var>` | Reads a feedback variable from an object. |
| `objvs` | `objvs <objid> <var> <value>` | Sets a feedback variable on an object. |
| `pfx` | `pfx <player> <effect>` | Adds an effect to a player. |
| `pfxg` | `pfxg <player> <effect>` | Reads an effect from a player. |
| `prizedruler` | `prizedruler <rec>` | Spawns prize ruler and sets PRIZEREC (restricted to ISABOB). |
| `pscan` | `pscan <player>` | Runs an Oracle player scan. |
| `pvg` | `pvg <player> <var>` | Reads a feedback variable from a player. |
| `pvp` | `pvp <level-range>` | Sets realm-wide PvP level range and broadcasts a warning. |
| `pvs` | `pvs <player> <var> <value>` | Sets a feedback variable on a player. |
| `raceme` | `raceme <race>` | Applies race default stats to yourself. |
| `reduce` | `reduce <player> <levels>` | Reduces a player’s level by a number and forces rules flag. |
| `refs` | `refs <objid>` | Shows object reference hierarchy. |
| `removegeneral` | `removegeneral <player>` | Clears a player’s general-election votes. |
| `resetuser` | `resetuser <player>` | Marks a player for partial reset on next login; the target must have enabled "can reset". |
| `rlookup` | `rlookup <objid>` | Shows which room contains the object. |
| `rmobjid` | `rmobjid <objid>` | Deletes an object by id (dissolve). |
| `rvg` | `rvg <var>` | Reads a feedback variable from the current room. |
| `safecmds` | `safecmds <count>` | Limits commands to a safe count before crash (debug). |
| `setstat` | `setstat <stat> <value>` | Sets your stat by writing EXP and recalculating. |
| `setuserstat` | `setuserstat <player> <stat> <value>` | Sets a target player stat by writing EXP and recalculating. |
| `sevent` | `sevent <on|off> <event> [label]` | Alias for specialevent. |
| `sfx` | `sfx <effect>` | Adds an effect to yourself. |
| `sfxg` | `sfxg <effect>` | Reads an effect from yourself. |
| `silentgiftuserexp` | `silentgiftuserexp <player> <levels>` | Same as giftuserexp, but silent to the player. |
| `skillme` | `skillme <skill-id...>` | Toggles skills on yourself. |
| `skvs` | `skvs <gift> <value>` | Sets/clears a gift variable on yourself. |
| `specialevent` | `specialevent <on|off> <event> [label]` | Enables/disables a special event, spawns/removes its objects, and updates the web banner. Use `specialevent` or `specialevent status` to list events. |
| `spell` | `spell <args>` | Performs the admin action `spell`. |
| `svg` | `svg <var>` | Reads a feedback variable from yourself. |
| `svs` | `svs <var> <value>` | Sets a feedback variable on yourself. |
| `t` | `t <turns>` | Sets your turns to MT + value. |
| `thaw` | `thaw <player>` | Unfreezes a player. |
| `transport` | `transport <player>` | Teleports a player to you. |
| `upcode` | `upcode <file...>` | Syntax-checks and hot-reloads one or more Perl files. |
| `uspy` | `uspy <player>` | Toggles command spying for a player. |
| `vdump` | `vdump` | Dumps realm variables (realmvardump). |

## Admin Commands (No Arguments)

| Command | Syntax | Description |
| --- | --- | --- |
| `acom` | `acom` | Lists admin commands available to you. |
| `act2sql` | `act2sql` | Exports socials/actions to an SQL file. |
| `active` | `active` | Shows active users. |
| `adminonly` | `adminonly` | Toggles admin-only logins. |
| `badobjscan` | `badobjscan` | Scans for bad objects. |
| `cleanup` | `cleanup` | Runs room and object cleanup routines. |
| `clobjs` | `clobjs` | Cleans web/bodypart/misc floor objects and reports counts. |
| `cmdbash` | `cmdbash` | Lists command bash stats. |
| `cmdclock` | `cmdclock` | Lists command timing stats. |
| `coursescan` | `coursescan` | Lists courses and their stats. |
| `courseturbo` | `courseturbo` | Forces your courses to update immediately. |
| `deslodge` | `deslodge` | Uncrowds rooms (rooms_uncrowd). |
| `dump` | `dump` | Dumps the database state (rock_dump). |
| `emap` | `emap` | Shows a local map of surrounding rooms. |
| `event` | `event` | Processes a single event tick. |
| `events` | `events` | Shows the event manager queue. |
| `fakelogin` | `fakelogin` | Broadcasts a fake login and resets invisibility flags. |
| `fakelogout` | `fakelogout` | Broadcasts a fake logout and sets invisibility flags. |
| `forceclean` | `forceclean` | Force cleanup for inactive users, rooms, descs, objects. |
| `goremove` | `goremove` | Performs the admin action `goremove`. |
| `groups` | `groups` | Lists active groups. |
| `helpscan` | `helpscan` | Scans for missing help files. |
| `idle` | `idle` | Forces the idle tick routine. |
| `immortal` | `immortal` | Toggles immortality for yourself. |
| `inject` | `inject` | Randomly injects items into the world. |
| `invade` | `invade` | Invades player privacy and commits admin stats. |
| `invis` | `invis` | Toggles room/transport invisibility. |
| `mail` | `mail` | Checks admin mail (POP). |
| `newportal` | `newportal` | Reports unused portal id since last reboot. |
| `nocmds` | `nocmds` | Toggles command input for everyone. |
| `nogoremove` | `nogoremove` | Performs the admin action `nogoremove`. |
| `nokill` | `nokill` | Toggles realm-wide killing on/off. |
| `odump` | `odump` | Dumps all objects. |
| `org` | `org` | Generates the object report. |
| `ors` | `ors` | Generates the simple object report. |
| `ospell all` | `ospell all` | Performs the admin action `ospell all`. |
| `racemult` | `racemult` | Regenerates race multiplier data. |
| `randmove` | `randmove` | Performs the admin action `randmove`. |
| `restart` | `restart` | Saves state and restarts the server process. |
| `rspell` | `rspell` | Performs the admin action `rspell`. |
| `rspell all` | `rspell all` | Performs the admin action `rspell all`. |
| `rwho2` | `rwho2` | Racial who list for all races. |
| `saveall` | `saveall` | Saves all logged-in players. |
| `server` | `server` | Shows server stats (telnet/web connects, command count). |
| `slodgescan` | `slodgescan` | Lists rooms with more than 4 players. |
| `socinvis` | `socinvis` | Toggles social invisibility. |
| `spawn` | `spawn` | Spawns standard world objects. |
| `sserverjkill` | `sserverjkill` | Shuts down the server immediately. |
| `stores` | `stores` | Runs admin store maintenance. |
| `suspa` | `suspa` | Shows suspicious activity for online players. |
| `tally votes` | `tally votes` | Tallies votes for generals. |
| `telnet` | `telnet` | Performs the admin action `telnet`. |
| `telnetonly` | `telnetonly` | Toggles telnet-only logins. |
| `telservips` | `telservips` | Lists telnet server IPs. |
| `telservipshalve` | `telservipshalve` | Halves telnet IP counters. |
| `trailtrig` | `trailtrig` | Creates a plane-wide trail to the current room. |
| `unique` | `unique` | Lists unique items. |
| `upact` | `upact` | Reloads actions and help text. |
| `upaliases` | `upaliases` | Reloads command aliases. |
| `upitems` | `upitems` | Hot-reloads items files via upcode. |
| `uplib` | `uplib` | Reloads rocklib files. |
| `upstats` | `upstats` | Recalculates stats and updates scoreboard DB. |
| `votepromo` | `votepromo` | Sends vote reminders to eligible players. |

## Deprecated / Disabled

These appear in the file but are commented out or marked deprecated:
- `OLDgoto`, `cryl`, `nm`, `spell`
- `rspell`, `rspell all`, `ospell all`
- `goremove`, `nogoremove`, `randmove`
- `telnet` (deprecated)
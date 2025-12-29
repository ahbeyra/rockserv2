# Admin Commands Manual (Fuzzem)

This manual documents the admin commands defined in `fuzzem/src/commands.bse`. It is written as a practical reference: each entry lists its syntax and explains what it actually does in code, including side‑effects and restrictions.

Conventions
- `<player>`: character name or userid (resolved via `uid_resolve`)
- `<objid>`: object id
- `<room>`: room id
- `<rec>`: item record id
- `<effect>`: effect id
- `<stat>`: stat name (e.g., STR, AGI, KNO, MAJ, etc.)

Notes on EXP
- Where a command grants “levels worth” of EXP, it uses the level formula `((new_level^3 - old_level^3) * 17)`.

---

## Player Account, Discipline, and Moderation

### `resetuser`
Syntax:
- `resetuser <player>`
Behavior:
- Marks a player’s cryl/inv/stat/map/skill/class/mili/quest/time/pref data to reset on next login by deleting the `VER*` keys.
- Requires the player to have enabled “can reset” preference; otherwise it refuses.

### `namechange`
Syntax:
- `namechange <player> <newname>`
Behavior:
- Validates the new name; if valid, sets `NAME_CHANGE` so the name is updated on next login.
- Notifies the player and logs the change to the admin.

### `namecaps`
Syntax:
- `namecaps <player> <newcase>`
Behavior:
- Changes only the capitalization of a player name; characters must be identical.
- Sets `NAME_CHANGE` for next login.

### `gender`
Syntax:
- `gender <player> <m|male|f|female>`
Behavior:
- Sets the player’s gender and confirms.

### `forcerules`
Syntax:
- `forcerules <player>`
Behavior:
- Sets the player’s “read rules” preference to false, forcing them to read rules again.

### `noturns`
Syntax:
- `noturns <player>`
Behavior:
- Sets the player’s turns to 0 and forces rules flag.

### `reduce`
Syntax:
- `reduce <player> <levels>`
Behavior:
- Applies a level penalty to the player by the number of levels specified.
- Also forces rules flag.

### `freeze` / `thaw`
Syntax:
- `freeze <player>`
- `thaw <player>`
Behavior:
- Toggles player freeze via `user_freezethaw` (disables/enables actions).

### `eject`
Syntax:
- `eject <player>`
Behavior:
- Soft‑kicks the player (telnet kick).

### `hardeject`
Syntax:
- `hardeject <player>`
Behavior:
- Force‑disconnects the player by closing their socket.
- Logs an error to the player and reports success/failure to the admin.

### `force`
Syntax:
- `force <player> <command>`
- `force <player> to <command>`
Behavior:
- Forces a player to execute a command using `force_cmd`.

### `uspy`
Syntax:
- `uspy <player>`
Behavior:
- Toggles command spying on a player and announces the state to admins.

### `altscan`
Syntax:
- `altscan <userid> [order]`
Behavior:
- Runs alt‑watch scan for the specified userid (optional order value).

### `pscan`
Syntax:
- `pscan <player>`
Behavior:
- Runs an Oracle player scan.

### `ipscan`
Syntax:
- `ipscan <ip>`
Behavior:
- Looks up the last known user for an IP address (dual login archive).

### `lcoms`
Syntax:
- `lcoms <player> <lines>`
Behavior:
- Shows the player’s last commands.

---

## Admin Messaging and Broadcasts

### `ash`
Syntax:
- `ash <message>`
Behavior:
- Admin‑only shout channel.

### `beep`
Syntax:
- `beep <player> <message>`
Behavior:
- Sends a beep message to a player.

### `etell`
Syntax:
- `etell <player> <message>`
Behavior:
- Sends an echo message to a player.

### `echo`
Syntax:
- `echo <message>`
Behavior:
- Echoes a message to your room and to yourself.

### `eshout`
Syntax:
- `eshout <message>`
Behavior:
- Echoes a message to all players (admin echo, not a public shout).

### `bcast`
Syntax:
- `bcast <message>`
Behavior:
- Sends a stylized broadcast banner to all players.

### `mockshout`
Syntax:
- `mockshout <name> <text>`
Behavior:
- Sends a shout as if from another name (format‑only; does not change identity).

### `msg`
Syntax:
- `msg <message>`
Behavior:
- Disabled placeholder; tells the user to use the forums.

---

## Teleport, Locate, and Movement Tools

### `goto`
Syntax:
- `goto <room|objid>`
Behavior:
- Teleports you to a room or an object using `obj_goto`.

### `gotostalk`
Syntax:
- `gotostalk <player>`
Behavior:
- Teleports to a player and enables stalking.

### `find`
Syntax:
- `find <player>`
Behavior:
- AI walks you to a player using `ai_troll_to`.

### `findme`
Syntax:
- `findme <objid>`
Behavior:
- Forces an object to AI‑move to you.

### `movesto`
Syntax:
- `movesto <objid>`
Behavior:
- Shows the minimum number of moves needed to reach the object.

### `rlookup`
Syntax:
- `rlookup <objid>`
Behavior:
- Shows the room containing the object.

### `transport`
Syntax:
- `transport <player>`
Behavior:
- Teleports a player to you.

---

## Stats, EXP, Skills, and Effects

### `setstat`
Syntax:
- `setstat <stat> <value>`
Behavior:
- Sets your stat by writing EXP directly and recalculating.

### `setuserstat`
Syntax:
- `setuserstat <player> <stat> <value>`
Behavior:
- Sets a player’s stat by writing EXP directly and recalculating.

### `levelto`
Syntax:
- `levelto <level>`
Behavior:
- Sets your level via `stats_allto` (1–2000 only).

### `giftuserexp`
Syntax:
- `giftuserexp <player> <levels>`
Behavior:
- Grants EXP equivalent to a number of levels and notifies the player.

### `silentgiftuserexp`
Syntax:
- `silentgiftuserexp <player> <levels>`
Behavior:
- Same as `giftuserexp` but silent to the player.

### `giftuserexpraw`
Syntax:
- `giftuserexpraw <player> <exp>`
Behavior:
- Grants a raw EXP amount and notifies the player.

### `t`
Syntax:
- `t <turns>`
Behavior:
- Sets your turns to `MT + <turns>`.

### `hp`
Syntax:
- `hp <amount>`
Behavior:
- Sets your HP to `MAXH + <amount>`.

### `ma`
Syntax:
- `ma <amount>`
Behavior:
- Sets your mana to `MAXM + <amount>`.

### `freemv`
Syntax:
- `freemv <value>`
Behavior:
- Adjusts free movement points.

### `skillme`
Syntax:
- `skillme <skill-id...>`
- `skillme <skill-id,skill-id,...>`
Behavior:
- Toggles skills on yourself (add if missing, remove if present).

### `effect`
Syntax:
- `effect <effect-id>`
Behavior:
- Adds an effect to yourself by id (validates effect exists).

### `sfx` / `sfxg`
Syntax:
- `sfx <effect>`
- `sfxg <effect>`
Behavior:
- Adds an effect to yourself / reads an effect from yourself.

### `pfx` / `pfxg`
Syntax:
- `pfx <player> <effect>`
- `pfxg <player> <effect>`
Behavior:
- Adds / reads an effect on a player.

### `objfx` / `objfxg`
Syntax:
- `objfx <objid> <effect>`
- `objfxg <objid> <effect>`
Behavior:
- Adds / reads an effect on an object.

### `effects`
Syntax:
- `effects`
Behavior:
- Lists your active effects and time remaining.

### `skvs`
Syntax:
- `skvs <gift> <value>`
Behavior:
- Sets or clears a gift variable on yourself.

### `raceme`
Syntax:
- `raceme <race>`
Behavior:
- Applies default race stats to yourself.

### `upstats`
Syntax:
- `upstats`
Behavior:
- Recalculates stats for all active players and updates the scoreboard DB.

---

## Feedback Vars (Object/Room/Player)

### `objvs` / `objvg`
Syntax:
- `objvs <objid> <var> <value>`
- `objvg <objid> <var>`
Behavior:
- Sets / reads a feedback variable on an object.

### `rvs` / `rvg`
Syntax:
- `rvs <var> <value>`
- `rvg <var>`
Behavior:
- Sets / reads a feedback variable on the current room.

### `svs` / `svg`
Syntax:
- `svs <var> <value>`
- `svg <var>`
Behavior:
- Sets / reads a feedback variable on yourself.

### `pvs` / `pvg`
Syntax:
- `pvs <player> <var> <value>`
- `pvg <player> <var>`
Behavior:
- Sets / reads a feedback variable on a player.

---

## Items, Objects, and DB Tools

### `cr`
Syntax:
- `cr <rec>`
Behavior:
- Spawns an item by record id (ISABOB‑only). Uses forced spawn.

### `prizedruler`
Syntax:
- `prizedruler <rec>`
Behavior:
- Spawns prize ruler (rec 363) and sets `PRIZEREC` (ISABOB‑only).

### `rmobjid`
Syntax:
- `rmobjid <objid>`
Behavior:
- Dissolves an object by id.

### `dnum`
Syntax:
- `dnum <objid>`
Behavior:
- Shows an object’s description compression index.

### `dblist`
Syntax:
- `dblist <db> [filter]`
Behavior:
- Lists entries in a DB group, with optional filter string.

### `findrec`
Syntax:
- `findrec <text>`
Behavior:
- Greps item files for text and prints results (uses `/opt/rs2/src/items*.bse`).

### `findfx`
Syntax:
- `findfx <text>`
Behavior:
- Greps effects files for text and prints results (uses `/opt/rs2/src/effects*.bse`).

### `refs`
Syntax:
- `refs <objid>`
Behavior:
- Displays the reference hierarchy for the object.

---

## World / Realm Control

### `specialevent` / `sevent`
Syntax:
- `specialevent`
- `specialevent status`
- `specialevent list`
- `specialevent <on|off> <event> [label]`
Behavior:
- Lists available events or toggles an event on/off.
- Updates the web banner and spawns/removes event objects.

### `spawn`
Syntax:
- `spawn`
Behavior:
- Runs the world spawn routine (`spawn_stuff`).

### `inject`
Syntax:
- `inject`
Behavior:
- Randomly injects items into the world.

### `cleanup`
Syntax:
- `cleanup`
Behavior:
- Runs room and object cleanup routines.

### `forceclean`
Syntax:
- `forceclean`
Behavior:
- Runs a broader cleanup pass (inactive users, rooms, descs, objects).

### `clobjs`
Syntax:
- `clobjs`
Behavior:
- Cleans up webs, body parts, and floor clutter; broadcasts counts.

### `idle`
Syntax:
- `idle`
Behavior:
- Forces an idle tick for all objects.

### `events`
Syntax:
- `events`
Behavior:
- Dumps the event manager queue.

### `event`
Syntax:
- `event`
Behavior:
- Processes a single event tick.

### `trailtrig`
Syntax:
- `trailtrig`
Behavior:
- Creates a plane‑wide trail to the current room.

### `nokill`
Syntax:
- `nokill`
Behavior:
- Toggles realm‑wide killing on/off.

### `pvp`
Syntax:
- `pvp <level-range>`
Behavior:
- Sets realm‑wide PvP level range and broadcasts a warning.

---

## Server, Maintenance, and Diagnostics

### `restart`
Syntax:
- `restart`
Behavior:
- Saves world state, cleans up, closes sockets, unties DBs, and restarts the server process.

### `sserverjkill`
Syntax:
- `sserverjkill`
Behavior:
- Immediate shutdown (`shutdown_game`) and exit.

### `adminonly`
Syntax:
- `adminonly`
Behavior:
- Toggles admin‑login‑only mode.

### `telnetonly`
Syntax:
- `telnetonly`
Behavior:
- Toggles telnet‑only logins.

### `nocmds`
Syntax:
- `nocmds`
Behavior:
- Toggles command input for everyone.

### `server`
Syntax:
- `server`
Behavior:
- Shows server stats (telnet/web connects, command count).

### `dump`
Syntax:
- `dump`
Behavior:
- Dumps database state (`rock_dump`).

### `odump`
Syntax:
- `odump`
Behavior:
- Dumps all objects (`rock_objdump`).

### `ors`
Syntax:
- `ors`
Behavior:
- Generates the simple object report (`object_briefing`).

### `org`
Syntax:
- `org`
Behavior:
- Generates the object report (`object_report_generate`).

### `badobjscan`
Syntax:
- `badobjscan`
Behavior:
- Scans for bad objects in the object table.

### `helpscan`
Syntax:
- `helpscan`
Behavior:
- Scans for missing help files.

### `cmdclock`
Syntax:
- `cmdclock`
Behavior:
- Lists command timing stats.

### `cmdbash`
Syntax:
- `cmdbash`
Behavior:
- Lists command bash stats.

### `newportal`
Syntax:
- `newportal`
Behavior:
- Scans portals and reports the next unused portal id.

### `emap`
Syntax:
- `emap`
Behavior:
- Shows a local map of surrounding rooms.

### `saveall`
Syntax:
- `saveall`
Behavior:
- Saves all logged‑in player files.

### `upaliases`
Syntax:
- `upaliases`
Behavior:
- Reloads command aliases/definitions.

### `upitems`
Syntax:
- `upitems`
Behavior:
- Hot‑reloads item files (`items.bse` through `items5.bse`).

### `upcode`
Syntax:
- `upcode <file> [file ...]`
Behavior:
- Syntax‑checks each file, then `do` loads it into the live process.
- Broadcasts success or syntax errors to admins.

### `uplib`
Syntax:
- `uplib`
Behavior:
- Reloads rocklib files.

### `upact`
Syntax:
- `upact`
Behavior:
- Reloads actions and updates help text.

### `actvalidate`
Syntax:
- `actvalidate <args>`
Behavior:
- Validates an action definition and prints errors.

### `act2sql`
Syntax:
- `act2sql`
Behavior:
- Exports socials/actions to an SQL file on disk.

### `vdump`
Syntax:
- `vdump`
Behavior:
- Dumps realm variables (`realmvardump`).

### `safecmds`
Syntax:
- `safecmds <count>`
Behavior:
- Sets a command limit before a forced crash (debug/testing).

### `telservips` / `telservipshalve`
Syntax:
- `telservips`
- `telservipshalve`
Behavior:
- Lists telnet server IP counts / halves the counters.

### `mail`
Syntax:
- `mail`
Behavior:
- Checks admin mail (POP).

### `invade`
Syntax:
- `invade`
Behavior:
- Invades player privacy and commits admin stats.

### `suspa`
Syntax:
- `suspa`
Behavior:
- Shows suspicious activity for online players.

---

## Groups, Votes, and Social Visibility

### `groups`
Syntax:
- `groups`
Behavior:
- Lists active groups.

### `removegeneral`
Syntax:
- `removegeneral <player>`
Behavior:
- Clears a player’s general‑election votes.

### `tally votes`
Syntax:
- `tally votes`
Behavior:
- Tallies votes for generals.

### `votepromo`
Syntax:
- `votepromo`
Behavior:
- Sends vote reminders to eligible players.

### `racemult`
Syntax:
- `racemult`
Behavior:
- Regenerates race multiplier data.

### `invis`
Syntax:
- `invis`
Behavior:
- Toggles room/transport invisibility.

### `socinvis`
Syntax:
- `socinvis`
Behavior:
- Toggles social invisibility.

### `immortal`
Syntax:
- `immortal`
Behavior:
- Toggles immortality for yourself.

### `fakelogin` / `fakelogout`
Syntax:
- `fakelogin`
- `fakelogout`
Behavior:
- Sends fake login/logout broadcasts and flips invisibility flags to match.

---

## Admin Help / Discovery

### `acom`
Syntax:
- `acom`
Behavior:
- Lists admin commands available to you.

### `active`
Syntax:
- `active`
Behavior:
- Shows active users.

### `unique`
Syntax:
- `unique`
Behavior:
- Lists unique items.

### `rwho2`
Syntax:
- `rwho2`
Behavior:
- Shows a racial “who” list for all races.

### `coursescan`
Syntax:
- `coursescan`
Behavior:
- Lists courses and their stats.

### `courseturbo`
Syntax:
- `courseturbo`
Behavior:
- Forces your courses to update immediately and shows your course list.

### `stores`
Syntax:
- `stores`
Behavior:
- Runs admin store maintenance.

---

## Deprecated / Disabled Commands

These appear in the file but are commented out or marked deprecated and are not active:
- `spell`, `cryl`, `nm`
- `rspell`, `rspell all`, `ospell all`
- `goremove`, `nogoremove`, `randmove`
- `telnet`
- `OLDgoto` (legacy)

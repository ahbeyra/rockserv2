# Quests Guide (Fuzzem)

This document lists all quest-like content currently defined in the fuzzem
codebase. It is intended to be readable for players/admins and safe to publish
on the website.

Sources:
- `fuzzem/src/items.bse` (quest receivers and item names)
- `fuzzem/src/rockunit.pm` (quest logic and special cases)
- `fuzzem/src/rockracial.pm` (one-time race change)
- `fuzzem/src/courses.bse` and `fuzzem/src/commands.bse` (course-based quest flags)
- `dillfrog/doc/skills_mapped.txt` (skill ID 44 name)

## How quest receivers work
- Most quests are handled by NPCs that accept items (and sometimes cryl).
- The quest receiver tracks turn-ins per player and completes the quest when
  all required items (and cryl, if any) have been provided.
- Some quests are one-time only. Those are marked with a quest flag in the data.
- If a quest has no quest flag, it is repeatable.

---

## Quest Index (item turn-ins)

| Quest | Giver | Repeatable |
| --- | --- | --- |
| Eldar Noblewoman (Baby Rescue) | Eldar Noblewoman | One-time |
| Antisin Pears | Antisin | One-time |
| Beastly Fuzzem | Fuzzem Elder | One-time |
| Sulphax the Red (Skyblade) | King Edger | Repeatable |
| Earthstone | Elder Treant | Repeatable |
| Greatshield Repairs | Master Mechanic | Repeatable |
| Ghtheen Mantle | Troitian Seamstress | Repeatable |
| Westland Bard | Westland Bard | One-time |
| Dragon Guard | Ergin | Repeatable |
| Dragon Egg | Angry Dragon | Repeatable |
| Obsidian Blade | Obsidian Protector | Repeatable |
| Adamant | Baine | Repeatable |
| Bracers of Pain | City Protector | Repeatable |
| Haste Amulet | Mayor of Outcast City | Repeatable |

---

## Quest Details

### Eldar Noblewoman (Baby Rescue)
- Giver: Eldar Noblewoman.
- Steps:
  1) Find the eldar baby (item: `eldar baby`).
  2) Give the baby to the Eldar Noblewoman.
- Rewards (first completion):
  - 1000 cryl.
  - 1500 mental experience.
  - `smooth disc` (item 213).
- Repeat behavior:
  - The NPC still gives a `smooth disc`, but no extra exp/cryl.

### Antisin Pears
- Giver: Antisin.
- Steps:
  1) Give Antisin 3x `golden pear`.
- Rewards (first completion):
  - 10,000 physical experience.
  - 10,000 mental experience.
- Repeat behavior:
  - No quest reward; Antisin gives a flavor response and a small effect.

### Beastly Fuzzem
- Giver: Fuzzem Elder.
- Steps:
  1) Give the Fuzzem Elder the `Beastly Fuzzem` (item 509).
- Rewards:
  - 25,000 exp.
  - 25 cryl.
- Notes:
  - One-time quest flag is set on completion.

### Sulphax the Red (Skyblade)
- Giver: King Edger.
- Steps:
  1) Give King Edger the `piece of the skyblade` (item 488).
- Rewards:
  - Primary: `statuette of a griffon` (item 490).
  - Fallback if item spawn fails: 500,000 exp + `sapphire medallion` (item 506).

### Earthstone
- Giver: Elder Treant.
- Steps:
  1) Collect the four earthstones:
     - `brown earthstone` (526)
     - `blue earthstone` (527)
     - `red earthstone` (528)
     - `green earthstone` (529)
  2) Turn all four in to the Elder Treant.
- Rewards:
  - Skill 44: `lifeshield`.
  - 750,000 exp.

### Greatshield Repairs
- Giver: Master Mechanic.
- Steps:
  1) Bring all four parts:
     - `oily crankshaft` (610)
     - `rusted sprocket` (631)
     - `stamped chain link` (636)
     - `oversized wrench` (344)
  2) Stay in the room while the mechanic works.
- Rewards:
  - `troitian greatshield` (item 605) after a short delay.
- Notes:
  - Repeatable.

### Ghtheen Mantle
- Giver: Troitian Seamstress.
- Steps:
  1) Pay 150 cryl total.
  2) Bring 3x `frost ghtheen hide` (item 637).
- Rewards:
  - `ghtheen mantle` (item 596).
- Notes:
  - Repeatable.

### Westland Bard
- Giver: Westland Bard.
- Steps:
  1) Bring a `nightsky flower` (item 688).
- Rewards:
  - 2 levels worth of experience (capped at level 50).
- Notes:
  - One-time quest flag is set on completion.

### Dragon Guard
- Giver: Ergin.
- Steps:
  1) Bring:
     - `sparkling topaz` (823)
     - `egg shell` (821)
     - 2x `dragon's scale` (822)
- Rewards:
  - `dragon's guard` (item 824) after a short delay.
- Notes:
  - Repeatable.

### Dragon Egg
- Giver: Angry Dragon.
- Steps:
  1) Bring a `dragons egg` (item 820).
- Rewards:
  - `egg shell` (item 821).
  - Lore dialog that hints at the Dragon Guard quest with Ergin.
- Notes:
  - Repeatable.

### Obsidian Blade
- Giver: Obsidian Protector.
- Steps:
  1) Bring:
     - `freshly molded hilt` (898)
     - `rough piece of obisdian` (899)
     - `forged blade` (900)
- Rewards:
  - `obsidian blade` (item 341) after a short delay.
- Notes:
  - Repeatable.

### Adamant
- Giver: Baine.
- Steps:
  1) Bring `preservation solution` (988).
- Rewards:
  - `eyes of the dragon king` (item 880) after a short delay.
- Notes:
  - NPC also tells you to leave after the reward.
  - Repeatable.

### Bracers of Pain
- Giver: City Protector.
- Steps:
  1) Bring:
     - `fire emblem` (1000)
     - `lightning emblem` (1001)
     - `wind emblem` (1002)
     - `water emblem` (1003)
- Rewards:
  - `bracers of pain` (item 997) after a short delay.
- Notes:
  - Repeatable.

### Haste Amulet
- Giver: Mayor of Outcast City.
- Steps:
  1) Bring:
     - `tendrelian noble ring` (1004)
     - `hoarg signet ring` (1005)
     - `hoarg battleplan` (1006)
     - `tendrelian battleplan` (1007)
- Rewards:
  - `amulet of haste` (item 998) after a short delay.
- Notes:
  - Repeatable.

---

## Quest-Like Flags (Courses and Race Change)

These are not classic item turn-in quests, but they set quest flags that gate
skills and progression.

### Race Change (one-time)
- Command: `raceto <race>`
- Requirements:
  - Level 45 or lower.
  - Valid races: `vrean`, `spectrite`, `dryne`, `taer`, `shi-kul`, `kelion`.
- Result:
  - Changes race and sets quest flag 1 (one-time).

### Course Quest Flags
Courses are started via `enroll <course>`, `checkin <course>`, and `about <course>`
at course registration locations.

| Course | Quest Flag | Notes |
| --- | --- | --- |
| powermonger | 3 | Required for several melee-focused courses. |
| truthseeker | 4 | Required for several magic-focused courses. |
| advanced powermonger | 6 | Requires powermonger + level > 300. |
| advanced truthseeker | 7 | Requires truthseeker + level > 300. |
| advanced leveling | 8 | Requires level > 800, grants skill 63. |
| cartography | 10 | Requires KNO > 200, grants skill 64. |

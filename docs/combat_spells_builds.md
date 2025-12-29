# Combat, Spells, and Builds (Fuzzem)

This document summarizes the core combat and spell mechanics and provides build guidance derived from the live formulas.

Source files used:
- fuzzem/src/rockobj.pm (combat, damage, crits, stats_update)
- fuzzem/src/rockobj2.pm (raise/exp, vigor behavior)
- fuzzem/src/rockobj3.pm (level calc, biorythms)
- fuzzem/src/realm_maint.pm (race multipliers)
- fuzzem/src/spells.bse (spell definitions and damage formulas)
- fuzzem/src/mainconsts.bse (race biorythms)
- fuzzem/src/const_stats.pm (stat indices)


## Stat model and level

Main stats are averages of substats (stats_update in fuzzem/src/rockobj.pm):
- KNO = (KMEC + KSOC + KMED + KCOM) / 4
- MAJ = (MOFF + MDEF + MELE + MMEN) / 4
- CHA = (CAPP + CATT) / 2
- AGI = (AUPP + ALOW) / 2
- STR = (SUPP + SLOW) / 2
- DEF = (DPHY + DENE + DMEN) / 3

Level formula (weighted average):
- LEV = int((KNO*4 + MAJ*4 + CHA*2 + AGI*2 + STR*2 + DEF*3) / 17)

Real level (exp-only) is very close to LEV but computed as:
- real_level = int(sum(exp[6..22] ** (1/3)) / 17)

Race multipliers (exp rate per substat) are derived from biorythms:
- race_mult[stat] = ((stat_value - min) / (max - min) * 0.7) + 0.35
- Higher biorythm values = faster exp gain on that substat.


## Melee combat mechanics

Swing count (attack_melee in fuzzem/src/rockobj.pm):
- targetcount = int((LEV/15 + AGI/13 + STR/17 - (weapon_mass/5.5 + weapon_vol/1.75)) / swinginvmod) + 1
- Capped at 6, with possible bonuses from skills.

Hit check (simplified):
- A nested rand comparison using AGI, KCOM, STR, HP%, and mirage; focus skill can force hits.

Damage cap per swing:
- damcap = WC * 4.5 (for players) where WC is weapon WC.
- With a killol (WC 1000), damcap is ~4500 per swing.

Offense formula (dam_offense):
- offense = ((lev + str + kno + kcom + supp + aupp) * (1 + rand(vigor)) * 1.5) + weapon_dam_bonus
- lev = rand(LEV) * 0.3
- str = rand(STR) * 0.65
- kno = rand(KNO) * 0.2
- kcom = rand(KCOM) * 0.2
- supp = rand(SUPP) * 0.4
- aupp = rand(AUPP) * 0.2
- weapon_dam_bonus uses STR and WC

Defense formula (dam_defense):
- defense = (def + kno + kmed + dphy + alow + ac) * rand(vigor)
- def = rand(DEF) * 0.2
- kno = rand(KNO) * 0.2
- kmed = rand(KMED) * 0.2
- dphy = rand(DPHY) * 0.2
- alow = rand(ALOW) * 0.2
- ac = AOFFSET * 0.2 (players) or AC * 0.2 (NPCs)

Crits:
- crit chance uses KCOM, KMEC, and LEV vs victim; capped at 30%.
- crit damage: ~1.4x + rand(dam) + rand(0.1) * LEV (higher with skill 93).

Notes:
- Vigor (VIGOR) amplifies both offense and defense through rand(vigor).
- KMED contributes to VIGOR recovery and defense; ALOW contributes to defense.


## Spells mechanics

Casting pipeline (spell_hgeneric in fuzzem/src/rockspell.pm):
- Spells are defined in fuzzem/src/spells.bse with costs, requirements, accuracy range, target rules, and a code block for effects.
- If not enough mana/HP/turns or fails accuracy check, the spell does nothing.
- Accuracy is derived from gift level unless hard-coded.

Spell definition shape (spells.bse):
- [min_mana, min_hp, min_turns, acode, min_ability, min_acc, max_acc, rectype, all_targets, permit_self, lifeforms_only, include_dead, lvl_restrict, retaliate, code, msgs_after_spell, ...messages]

Common damage patterns (examples in fuzzem/src/spells.bse):
- MOFF-based: damage scales with MOFF (e.g., MDART, MBOLT, MBEAM)
- MELE vs DENE: damage scales with (MELE - target DENE) * multiplier (e.g., FBOLT, FBLAST)
- MMEN vs DMEN: damage scales with (MMEN - target DMEN) * multiplier (e.g., MMELT, TSTAB)
- KCOM/KMED-based: some drains and heals use KMED/KCOM or KMED + KSOC averages

Takeaway:
- Spell damage is almost always a simple function of a single caster stat and a single target defense stat. Build around that specific stat for your spell set.


## Build strategy basics (melee)

Melee damage benefits most from:
- STR (SUPP/SLOW)
- AGI (AUPP for offense, ALOW for defense and hit checks)
- KCOM and KMEC (crit chance), KNO (offense contribution)
- KMED (vigor, defense)
- DEF (DPHY/DENE/DMEN)

Level is a weighted average, so you can keep MAJ and CHA low for melee to keep level lower while still increasing combat stats. That reduces level-based penalties but also slightly reduces swing count (LEV/15 term), so do not starve LEV too hard.


## Killol melee build (low MAJ/CHA)

Killol: WC 1000 (fuzzem/src/items.bse). Use this as a baseline melee weapon.

Target main-stat distribution at level 300 (MAJ and CHA near 0):
- KNO 500
- AGI 550
- STR 550
- DEF 300

This hits level 300 exactly with the weighted formula and favors offense and swing count.

Breakpoints (same ratio, MAJ/CHA low):
- Level 50:  KNO 83,  AGI 92,  STR 92,  DEF 50
- Level 100: KNO 167, AGI 183, STR 183, DEF 100
- Level 150: KNO 250, AGI 275, STR 275, DEF 150
- Level 200: KNO 333, AGI 367, STR 367, DEF 200
- Level 250: KNO 417, AGI 458, STR 458, DEF 250
- Level 300: KNO 500, AGI 550, STR 550, DEF 300

Recommended substat bias for this build:
- KNO substats: KCOM high, KMEC high, KMED moderate, KSOC low
- STR substats: SUPP and SLOW both high (do not starve SLOW)
- AGI substats: AUPP high, ALOW moderate for defense and hit checks
- DEF substats: DPHY and DENE moderate, DMEN moderate

Alternate balanced melee (same level):
- KNO 464, AGI 464, STR 464, DEF 464 (MAJ/CHA low)
- This is tankier but less bursty per swing.


## Best Shi-Kul melee build (level 300)

Shi-Kul biorythms favor DENE, STR, and KNO. Lean into those while keeping MAJ/CHA low.

Target main-stat distribution at level 300:
- KNO 500
- AGI 500
- STR 540
- DEF 340

Breakpoints (same ratio, MAJ/CHA low):
- Level 50:  KNO 84,  AGI 83,  STR 90,  DEF 57
- Level 100: KNO 167, AGI 167, STR 180, DEF 113
- Level 150: KNO 250, AGI 250, STR 270, DEF 170
- Level 200: KNO 334, AGI 333, STR 360, DEF 227
- Level 250: KNO 417, AGI 417, STR 450, DEF 283
- Level 300: KNO 500, AGI 500, STR 540, DEF 340

Shi-Kul substat bias:
- DEF: prioritize DENE (highest biorythm), then DMEN and DPHY
- STR: SUPP/SLOW high and even
- KNO: keep KCOM and KMEC ahead of KSOC
- AGI: ALOW slightly higher than AUPP if you want more defense


## Suggested builds per race (biorythm-aware)

These are best-in-class directions based on biorhythms (fuzzem/src/mainconsts.bse). Use the level formula above to keep MAJ/CHA low for melee or high for caster builds.

Vrean (MELE and STR lean):
- Best: melee or elemental caster hybrid
- Prioritize: MELE, SUPP/SLOW, KCOM, AUPP
- Gear: high WC weapon, MELE/STR/AGI gear; modest DPHY

Spectrite (MMEN and DENE lean):
- Best: mental caster or control
- Prioritize: MMEN, MOFF/MDEF, DENE, KMED
- Gear: MMEN/MOFF and defensive DENE/DMEN gear

Dryne (STR/DEF lean):
- Best: bruiser/tank
- Prioritize: SUPP/SLOW, DPHY/DMEN, KMED
- Gear: AC-heavy armor, STR/DEF stat boosts

Taer (AGI and STR lean):
- Best: fast melee
- Prioritize: AUPP/ALOW, SUPP/SLOW, KCOM
- Gear: AGI/STR gear, light armor to keep swing count high

Shi-Kul (DEF and STR lean):
- Best: tanky melee
- Prioritize: DENE, SUPP/SLOW, KCOM, KMEC
- Gear: DEF/DENE-heavy armor, solid WC weapon

Kelion (KNO and KCOM lean):
- Best: crit-focused melee or control caster
- Prioritize: KCOM, KMEC, KMED, STR
- Gear: KCOM/KMEC gear, WC-heavy weapon


## Gear guidance

For melee builds:
- Weapons: maximize WC; killol is a top-end WC baseline.
- Armor: AC matters, but ALOW, DPHY, DENE, DMEN bonuses are very valuable.
- Stat gear: STR, AGI, KCOM, KMEC, and KMED add directly to offense/crit/vigor.

For caster builds:
- MOFF/MELE/MMEN gear matching your primary spell family.
- Defensive stats that counter the common damage type you face (DENE for MELE-based spells, DMEN for MMEN-based spells, etc.).


## Notes on "low stat" strategy

Because LEV is a weighted average, leaving MAJ and CHA near zero makes your level lower than your combat stats. This increases damage per level and preserves PVP strength at lower visible level. The tradeoff is fewer swings (LEV/15 term) and slightly lower crit ratios that include LEV.

If you want to be extremely bursty at level 300, the killol melee build above is the best starting point; adjust DEF upward if you need to survive longer engagements.

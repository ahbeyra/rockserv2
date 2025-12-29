# Items Guide (Fuzzem)

This doc lists wearable and collectible items defined in `fuzzem/src/items.bse`.
Wearables are items with an `ATYPE`. Collectibles are non-wearables that are
takeable or used in quests. Sources are inferred from DB spawn groups and quest
definitions in code.

- Wearables: 323
- Collectibles: 405

## Wearables

| Name | Rec | Slot | Stats | Value | Source |
| --- | --- | --- | --- | --- | --- |
| level extender | 1248 | brain implant |  | 4750 | Unknown |
| max level | 1265 | brain implant |  | 4750 | Unknown |
| azral figurine | 733 | carried | AC 50 | 0 | Unknown |
| fire emblem | 1000 | carried | AC 1 | Stats: MELE 7 | 1000 | Quest required: BRACERS_OF_PAIN_QUEST (City Protector) |
| Ivory Toy | 1309 | carried | AC 30 | Stats: DPHY 0, MMEN 25 | 10 | Unknown |
| Koalite Toy | 1310 | carried | AC 40 | Stats: DPHY 0, SUPP 20 | 10 | Unknown |
| lightning emblem | 1001 | carried | AC 1 | Stats: MELE 7 | 1000 | Quest required: BRACERS_OF_PAIN_QUEST (City Protector) |
| polished humanskull | 723 | carried | AC 20 | Stats: KMEC 5, KSOC 5, KMED 5, KCOM 5, DPHY 5, DENE 5, DMEN 5, SUPP 5, SLOW 5 | 8000 | Unknown |
| Spectral Toy | 1308 | carried | AC 40 | Stats: DPHY 0 | 10 | Unknown |
| water emblem | 1003 | carried | AC 1 | Stats: MELE 15 | 1000 | Quest required: BRACERS_OF_PAIN_QUEST (City Protector) |
| wind emblem | 1002 | carried | AC 1 | Stats: MELE 7 | 1000 | Quest required: BRACERS_OF_PAIN_QUEST (City Protector) |
| crystalline earring | 935 | ears | AC 10 | Stats: DENE 10, DMEN 10 | 1500 | Unknown |
| diamond earrings | 870 | ears | AC 4 | Stats: CAPP 5, CATT 5, DPHY 5 | 1250 | Unknown |
| ear-muffs | 803 | ears | AC 3 + int rand(8 | KJ 750 | 200 | Unknown |
| fingerbone earrings | 722 | ears | AC 20 | Stats: DMEN 10, MMEN 10 | 9000 | Unknown |
| flesh earring | 1126 | ears | AC 8 | Stats: DPHY 4, KMEC 4 | 600 | Unknown |
| Ivory Industrial | 1312 | ears | AC 20 | Stats: DPHY 0, MOFF 25, MELE 25, MMEN 25 | 10 | Unknown |
| Koalite Industrial | 1313 | ears | AC 25 | Stats: DPHY 25, DENE 25, MDEF 25 | 10 | Unknown |
| silvertone earring | 443 | ears | Stats: STAT_FAILS_TODAY 8 | 2500 | Unknown |
| Spectral industrial | 1311 | ears | AC 15 | Stats: DPHY 0 | 10 | Unknown |
| tyrite earring | 1062 | ears | AC 1 | Stats: CATT 1, MELE 1, MOFF 1, MMEN 1, MDEF 1, DMEN 1, KCOM 1, KMEC 1, KSOC 1, KMED 1 | 2400 | Unknown |
| azral eyes | 714 | eyes | AC 10 | Stats: CAPP 10 | 1500 | Unknown |
| eye of nessie | 849 | eyes | Stats: MMEN 25, MOFF 5 | 300 | Unknown |
| eyes of the dragon king | 880 | eyes | AC 50 | Stats: KMEC 20, KCOM 20, MMEN 20 | 0 | Quest reward: ADAMANT_QUEST (Baine) |
| Ivory Contacts | 1315 | eyes | AC 20 | Stats: DPHY 0, MELE 10, MMEN 10 | 10 | Unknown |
| Koalite Goggles | 1316 | eyes | AC 20 | Stats: DPHY 10, AUPP 10 | 10 | Unknown |
| Spectral Glasses | 1314 | eyes | AC 20 | Stats: DPHY 0, KMEC 5, KCOM 5, KMED 5, KSOC 5 | 10 | Unknown |
| an enruned psi-screen | 278 | face | WC -100 | AC 2 | Stats: STAT_FAILS_TODAY 20 | 3000 | Unknown |
| azral warpaint | 718 | face | AC 10 | Stats: CAPP 20, CATT 20, KCOM 20 | 1500 | Unknown |
| ballroom mask | 863 | face | AC 12 | Stats: CATT 20 | 750 | Unknown |
| chelicerae plate | 1161 | face | WC 2 | AC 6 | Stats: STAT_EXPERTS_TOTAL 15 | 3500 | Unknown |
| Ivory Face Mask | 1318 | face | AC 30 | Stats: DPHY 0, DENE 15, DMEN 25 | 10 | Unknown |
| Koalite Face Mask | 1319 | face | AC 30 | Stats: DPHY 0, SUPP 25, SLOW 15 | 10 | Unknown |
| onyx faceplate | 990 | face | AC 10 | Stats: CATT 5, KCOM 5, DPHY 5 | 1300 | Unknown |
| oxygen mask | 970 | face | WC -100 | AC 5 | 14000 | DB: Vastis: Armor |
| rearview goggles | 585 | face | AC 2 | Stats: DPHY 1 | 1750 | DB: Ghtheen Gear |
| rimmed spectacles | 597 | face | Stats: KMEC 6 | 900 | Unknown |
| sand mask | 44 | face | Stats: STAT_CASTS_TODAY 1 | 30 | DB: Ghtheen Gear |
| scarred hockey mask | 232 | face | AC 2 | Stats: STAT_BESTHIT_OVERALL 25, STAT_EXPERTS_TODAY 10 | 1800 | Unknown |
| Spectral Face mask | 1317 | face | AC 30 | Stats: DPHY 0, KMEC 15, KCOM 25 | 10 | Unknown |
| tattoo | 800 | face | AC 5 + int rand(5 | KJ 750 | 300 | Unknown |
| tinted goggles | 349 | face | AC 2 | 20 | Unknown |
| titanium faceguard | 563 | face | AC 4 | Stats: DPHY 2 | 75 | Unknown |
| vexian hunting mask | 451 | face | AC 2 | Stats: STAT_PLR_DEATHS_TODAY 3, STAT_BESTHIT_TODAY 3 | 300 | Unknown |
| azrite boots | 720 | feet | AC 10 | Stats: DPHY 10 | 1500 | Unknown |
| blackened boots | 1289 | feet | AC 15 | Stats: STAT_CASTS_TODAY 10 | 1850 | Unknown |
| boots of pungent fur | 365 | feet | AC 5 | Stats: STAT_BESTHIT_TODAY -2 | 10 | Unknown |
| bronze greaves | 701 | feet | AC 3 | Stats: DPHY 1 | 100 | DB: Bronzeware Unlimited |
| dirty old boots | 37 | feet | Stats: STAT_CASTS_TODAY 1 | 1 | Unknown |
| ferrite-toed boots | 595 | feet | AC 5 | Stats: DPHY 3 | 250 | Unknown |
| Ivory Boots | 1305 | feet | AC 25 | Stats: DPHY 10, MELE 7, MMEN 7 | 10 | Unknown |
| jeweled slippers | 868 | feet | AC 2 | Stats: CAPP 6 | 500 | Unknown |
| knee-high boots | 867 | feet | WC 10 | AC 14 | Stats: CAPP 1, DPHY 4, ALOW 2 | 300 | Unknown |
| Koalite Boots | 1306 | feet | AC 30 | Stats: DPHY 20, DENE 5, DMEN 5 | 10 | Unknown |
| magnetic boots | 825 | feet | AC 6 | Stats: DPHY 8 | 2500 | Unknown |
| mithril shackles | 704 | feet |  | 10000 | Unknown |
| onyx boots | 995 | feet | AC 6 | Stats: SLOW 3, DPHY 5 | 1300 | Unknown |
| padded leather boots | 16 | feet | AC 3 | Stats: STAT_CASTS_TODAY 2 | 10 | Unknown |
| ruby spherule boots | 1114 | feet | AC 20 | 2500 | Unknown |
| snowshoes | 591 | feet | AC 1 | Stats: ALOW 2 | 100 | Unknown |
| Spectral Boots | 1307 | feet | AC 27 | Stats: DPHY 15, DENE 3, DMEN 3, MDEF 3 | 10 | Unknown |
| steel boots | 495 | feet | AC 6 | Stats: DPHY 2 | 250 | Unknown |
| tyrite boots | 1059 | feet | AC 4 | Stats: DPHY 2 | 350 | Unknown |
| winged sandals | 940 | feet | AC 7 | Stats: ALOW 5, SLOW 5 | 1300 | Unknown |
| a bloodstone ring | 157 | finger | KJ 2000 | Stats: STAT_PLR_DEATHS_TOTAL 25 | 50 | Unknown |
| adamant ring | 874 | finger | AC 15 | Stats: AUPP 10, KCOM 10 | 1100 | Unknown |
| azrite ring | 732 | finger | AC 10 | Stats: AUPP 30, ALOW 30 | 5000 | Unknown |
| battle ring | 366 | finger | Stats: STAT_MISSES_TODAY 4, STAT_EXPERTS_TODAY 4 | 300 | Unknown |
| dryne fingertrap | 154 | finger | WC 3 | AC 3 | 120 | Unknown |
| invisible ring | 807 | finger | Stats: STAT_PLR_DEATHS_TODAY 10 | 2200 | Unknown |
| ivory ring | 594 | finger | Stats: KSOC 5, CATT 5 | 500 | Unknown |
| Koalite Ring | 1322 | finger | AC 15 | Stats: DPHY 30, KCOM 40 | 10 | Unknown |
| ring of celerity | 225 | finger | KJ 750 | Stats: STAT_MISSES_TODAY 30 | 8000 | Unknown |
| ring of earth magic | 17 | finger | KJ 6500 | Stats: STAT_SWINGS_TOTAL 20 | 1500 | Unknown |
| ring of haste | 1277 | finger | KJ 750 | Stats: SUPP 30 | 8000 | Unknown |
| Ring of Ivory | 1321 | finger | AC 10 | Stats: DPHY 0, MOFF 50, MELE 25, MMEN 25 | 10 | Unknown |
| ring of plant-lore | 433 | finger | Stats: STAT_PLR_KILLS_TOTAL 5, STAT_SWINGS_TOTAL 8 | 2000 | Unknown |
| ring of warfare | 361 | finger | Stats: STAT_PLR_DEATHS_TODAY 15 | 500 | Unknown |
| ring of white magic | 273 | finger | Stats: STAT_SWINGS_TODAY 60 | 6000 | Unknown |
| ring of zepher | 986 | finger | AC 3 | Stats: KCOM 20, KMEC 20 | 10000 | Unknown |
| royal emblem ring | 1063 | finger | AC 12 | Stats: SUPP 10 | 400 | Unknown |
| ruby ring | 727 | finger | AC 10 | Stats: KMEC 10, KMED 10, KSOC 10, KCOM 15 | 2000 | Unknown |
| sapphire spherule ring | 1115 | finger | AC 20 | 2500 | Unknown |
| Spectral Ring | 1320 | finger | AC 20 | Stats: DPHY 5, DENE 5, DMEN 5, MOFF 5, MDEF 5, MELE 5, MMEN 5, SUPP 5, SLOW 5, AUPP 5, ALOW 5, KMEC 5, KCOM 5, KMED 5, KSOC 5, CAPP 5, CATT 5 | 10 | Unknown |
| spiders egg ring | 1159 | finger | Stats: DMEN 3, MELE 15 | 4750 | DB: Vrean Shop |
| azrite gauntlets | 729 | hands | AC 15 | Stats: DPHY 15 | 5000 | Unknown |
| black satin gloves | 860 | hands | AC 5 | Stats: CAPP 8 | 300 | Unknown |
| blackened gauntlets | 1274 | hands | AC 15 | Stats: STAT_CASTS_TODAY 10 | 1850 | Unknown |
| burgundy satin gloves | 862 | hands | AC 5 | Stats: CAPP 8 | 250 | Unknown |
| cream satin gloves | 861 | hands | AC 5 | Stats: CAPP 8 | 300 | Unknown |
| eldritch blade | 151 | hands |  | 15000 | Unknown |
| fingerless gauntlets | 362 | hands | AC 8 | Stats: STAT_CASTS_TODAY 3 | 40 | Unknown |
| Ivory studded gloves | 1324 | hands | AC 20 | Stats: DPHY 10, MELE 15, MMEN 15 | 10 | Unknown |
| Koalite studded gloves | 1325 | hands | AC 30 | Stats: DPHY 10, SUPP 15, SLOW 15 | 10 | Unknown |
| onyx gauntlet | 996 | hands | AC 8 | Stats: DPHY 3, DMEN 3, DENE 5 | 1300 | Unknown |
| silvertone gauntlets | 438 | hands | AC 10 | Stats: DPHY 2, DENE 2 | 350 | Unknown |
| Spectral Gloves | 1323 | hands | AC 25 | Stats: DPHY 30 | 10 | Unknown |
| steel gauntlets | 494 | hands | AC 6 | Stats: DPHY 2 | 250 | Unknown |
| thick ghtheen gauntlets | 45 | hands | AC 5 | Stats: STAT_CASTS_TODAY 2 | 20 | DB: Ghtheen Gear |
| tyrite gauntlets | 1058 | hands | AC 9 | Stats: DPHY 4, DMEN 4 | 450 | Unknown |
| adamant crown | 875 | head | AC 15 | Stats: KMEC 10, MMEN 10 | 1100 | Unknown |
| azrite helm | 728 | head | AC 10 | Stats: DPHY 15 | 5000 | Unknown |
| blackened greathelm | 239 | head | AC 15 | Stats: STAT_CASTS_TODAY 10 | 1850 | Unknown |
| Blonde Wig | 1154 | head | AC 6 | Stats: DPHY 1, CAPP 20 | 350 | Unknown |
| camouflaged iron helmet | 13 | head | AC 8 | Stats: STAT_CASTS_TODAY 5 | 35 | DB: Camouflaged Armour |
| camouflaged leather helmet | 12 | head | AC 3 | Stats: STAT_CASTS_TODAY 2 | 8 | DB: Camouflaged Armour |
| coral headband | 975 | head | AC 12 | Stats: DPHY 5 | 2000 | DB: Emporium |
| crested sallet | 698 | head | AC 5 | Stats: DPHY 2 | 250 | DB: Bronzeware Unlimited |
| crown of greater telepathy | 265 | head | AC 3 | Stats: STAT_FAILS_TODAY 50, STAT_FAILS_TOTAL 50 | 10000 | Unknown |
| crown of the elements | 1288 | head | AC 3 | Stats: MELE 50, DENE 50 | 10000 | Unknown |
| crystalline halo | 934 | head | AC 10 | Stats: MDEF 20, CAPP 10 | 0 | Unknown |
| feather wreath | 1054 | head | Stats: MMEN 2 | 400 | Unknown |
| ferrite assault helmet | 599 | head | AC 10 | Stats: DPHY 5 | 400 | Unknown |
| four pointed antlers | 795 | head | AC 15 + int rand(5 | KJ 750 | 500 | Unknown |
| golden mantilla | 873 | head | AC 8 | Stats: CAPP 6, DPHY 6 | 800 | DB: Ladys Shop |
| horned helmet | 356 | head | AC 8 | Stats: STAT_CASTS_TODAY 7 | 250 | Unknown |
| Ivory helmet | 1328 | head | AC 15 | Stats: DPHY 40, MELE 30 | 10 | Unknown |
| Koalite Helmet | 1327 | head | AC 25 | Stats: DPHY 40, DENE 20 | 10 | Unknown |
| leather helmet | 94 | head | AC int(15 + rand(5 | KJ 2000 | Stats: STAT_BESTHIT_TODAY 2 | 165 | Unknown |
| miner\'s helmet | 570 | head | AC 3 | Stats: DPHY 2 | 65 | Unknown |
| onyx helm | 991 | head | AC 5 | Stats: DPHY 5, DMEN 5 | 1300 | Unknown |
| silvertone helmet | 441 | head | AC 6 | Stats: DPHY 2, DENE 2 | 350 | Unknown |
| Spectral Helmet | 1326 | head | AC 25 | Stats: DPHY 20, DENE 20, DMEN 25 | 10 | Unknown |
| steel pot helm | 493 | head | AC 5 | Stats: DPHY 2 | 200 | DB: Vastis: Armor |
| triangular glow | 1251 | head | AC 20 | Stats: DMEN 15, MMEN 15, DENE 15, MELE 15 | 1100 | Unknown |
| turquoise spherule helm | 1113 | head | AC 20 | 2000 | Unknown |
| two pointed antlers | 794 | head | AC 8 + int rand(3 | KJ 750 | 300 | Unknown |
| tyrite crown | 1061 | head | AC 15 | Stats: DPHY 10, KCOM 10, DMEN 5, MDEF 5 | 1200 | Unknown |
| tyrite helmet | 1064 | head | AC 2 | 450 | Unknown |
| visored hard helm | 357 | head | AC 5 | Stats: STAT_CASTS_TODAY 1 | 50 | Unknown |
| hug | 712 | hugzone | AC 7 | 1000 | Unknown |
| black garter and stockings | 864 | legs | AC 10 | Stats: CAPP 20 | 400 | Unknown |
| blackened leg plates | 276 | legs | AC 20 | Stats: STAT_CASTS_TODAY 10 | 1500 | Unknown |
| bone leg guards | 797 | legs | AC 10 + int rand(3 | KJ 750 | 400 | Unknown |
| burgundy garter and stockings | 866 | legs | AC 10 | Stats: CAPP 20 | 350 | Unknown |
| camouflaged cloth breeches | 15 | legs | AC 3 | Stats: STAT_CASTS_TODAY 2 | 15 | DB: Camouflaged Armour |
| coral leg plates | 973 | legs | AC 14 | Stats: DPHY 5, CATT 5 | 1800 | DB: Emporium |
| cream garter and stockings | 865 | legs | AC 10 | Stats: CAPP 20 | 400 | Unknown |
| crystalline leg plates | 938 | legs | AC 15 | Stats: DPHY 5, DMEN 5 | 1300 | Unknown |
| dazzling magical pants | 203 | legs | Stats: DMEN 1000, DENE 1000, DPHY 1000 | 1 | Unknown |
| dryad\'s breeches | 468 | legs | AC 3 | Stats: ALOW 3 | 130 | Unknown |
| ferrite leg plates | 601 | legs | AC 12 | Stats: DPHY 5 | 400 | Unknown |
| holo-skirt by <kw> | 681 | legs | Stats: CAPP 10 | 0 | Unknown |
| Ivory leggings | 1331 | legs | AC 20 | Stats: DPHY 30, MMEN 10 | 10 | Unknown |
| Koalite leggins | 1330 | legs | AC 25 | Stats: DPHY 40 | 10 | Unknown |
| leather leg pads | 367 | legs | AC 6 | Stats: STAT_CASTS_TODAY 3 | 25 | Unknown |
| onyx leggings | 994 | legs | AC 7 | Stats: DPHY 5, ALOW 3 | 1300 | Unknown |
| padded ghtheen leggings | 43 | legs | AC 5 | Stats: STAT_CASTS_TODAY 3 | 25 | DB: Ghtheen Gear |
| shabby breeches | 360 | legs | AC 3 | 5 | Unknown |
| sharkskin pants | 851 | legs | AC 20 | Stats: DPHY 7, SLOW 2 | 650 | Unknown |
| snakeskin leggings | 716 | legs | AC 22 | Stats: DPHY 25 | 1500 | Unknown |
| Spectral Leggings | 1329 | legs | AC 25 | Stats: DPHY 20, DENE 20, DMEN 25 | 10 | Unknown |
| steel legplates | 496 | legs | AC 6 | Stats: DPHY 4 | 300 | Unknown |
| adamant bracers | 877 | lower arms | AC 15 | Stats: SUPP 10, AUPP 10 | 1100 | Unknown |
| azrite bracers | 731 | lower arms | AC 10 | Stats: SUPP 10, SLOW 10, AUPP 10, ALOW 10 | 5000 | Unknown |
| bracers of forest coloring | 10 | lower arms | AC 3 | Stats: STAT_CASTS_TODAY 2 | 20 | Unknown |
| bracers of pain | 997 | lower arms | AC 7 | Stats: SUPP 7, SLOW 7 | 2000 | Quest reward: BRACERS_OF_PAIN_QUEST (City Protector) |
| bracers of strength | 21 | lower arms | KJ 1000 | Stats: STAT_EXPERTS_TODAY 3, STAT_CASTS_TODAY 5 | 800 | Unknown |
| enobracers | 153 | lower arms | Stats: STAT_SWINGS_TODAY 15 + int rand(10 | 8900 | Unknown |
| pair of bloodstone bracers | 272 | lower arms | AC 8 | Stats: STAT_EXPERTS_TODAY 20 | 3000 | Unknown |
| ringed ferrite bracers | 602 | lower arms | AC 17 | Stats: DPHY 6 | 900 | Unknown |
| tyrite bracers | 1055 | lower arms | AC 6 | Stats: SUPP 2, SLOW 2 | 600 | Unknown |
| a flesh amulet | 226 | neck | KJ 750 | 6000 | Unknown |
| a gray-matter amulet | 1278 | neck | KJ 750 | 6000 | Unknown |
| amulet of conviction | 574 | neck | WC 0 | AC 0 | 3000 | Unknown |
| amulet of haste | 998 | neck | AC 5 | Stats: AUPP 7, ALOW 6 | 2000 | Quest reward: HASTE_AMULET_QUEST (Mayor of Outcast City) |
| azral tooth necklace | 715 | neck | AC 10 | Stats: CAPP 10, CATT 10 | 1800 | Unknown |
| blood red sigil | 1127 | neck | AC 8 | Stats: KCOM 5 | 600 | Unknown |
| bloodcrest | 607 | neck | Stats: SUPP 10 | 2500 | Unknown |
| claw charm | 1057 | neck | Stats: CATT 5, CAPP 5, SUPP 5, SLOW 1 | 700 | Unknown |
| darkstone amulet | 511 | neck | Stats: MOFF 3, MDEF 3 | 750 | Unknown |
| diamond necklace | 872 | neck | AC 5 | Stats: CAPP 5, DPHY 8 | 1500 | Unknown |
| freedom amulet | 920 | neck | KJ 750 | Stats: AUPP 10 | 4000 | Unknown |
| frost talisman | 606 | neck | Stats: KMED 15 | 1500 | Unknown |
| Ivory  Carcanet | 1333 | neck | AC 20 | Stats: DPHY 0, DMEN 25, MELE 50, MMEN 50 | 10 | Unknown |
| Koalite Amulet | 1334 | neck | AC 30 | Stats: DPHY 50, DENE 35 | 10 | Unknown |
| pearl necklace | 871 | neck | AC 4 | Stats: CAPP 4, CATT 4 | 600 | Unknown |
| petrobeads | 84 | neck | WC 4 | AC int(2 + rand(2 | 4 | Unknown |
| quartz spherule necklace | 1116 | neck | AC 20 | 2800 | Unknown |
| sapphire medallion | 506 | neck | Stats: DMEN 5, MMEN 5 | 4000 | Quest reward: SULPHAX_THE_RED (King Edger) |
| sigil of knowledge | 1162 | neck | AC 7 | Stats: KCOM 15, KMEC 5 | 4000 | Unknown |
| Spectral Amulet | 1332 | neck | AC 25 | Stats: DPHY 0, DMEN 40, MDEF 40 | 10 | Unknown |
| string of yellowed incisors | 348 | neck | AC 1 | Stats: STAT_BESTHIT_OVERALL 5 | 50 | Unknown |
| tempest amulet | 826 | neck | KJ 750 | Stats: AUPP 4 | 7000 | Unknown |
| titanium amulet | 1027 | neck | Stats: MOFF 3, MDEF 3 | 75 | Unknown |
| tyrite neck guard | 1060 | neck | AC 10 | Stats: DPHY 5 | 550 | Unknown |
| water-root talisman | 352 | neck | AC 1 | 75 | Unknown |
| azrite tower shield | 726 | off-hand | AC 40 | Stats: DPHY 25 | 5000 | Unknown |
| biomesh shield | 413 | off-hand | AC 15 | Stats: STAT_EXPERTS_TODAY 5, STAT_CASTS_TODAY 8 | 3500 | Unknown |
| blessed book | 1258 | off-hand | AC 10 | Stats: KMED 15 | 2200 | Unknown |
| book of wabble-lore | 572 | off-hand | Stats: KMED 6 | 60 | Unknown |
| bronze kite shield | 700 | off-hand | AC 15 | Stats: DPHY 2 | 350 | Unknown |
| cracked hourglass | 608 | off-hand | Stats: DPHY 3 | 3000 | Unknown |
| dragon\'s guard | 824 | off-hand | AC 60 | Stats: DPHY 40, SLOW -2, MDEF 10 | 2500 | Quest reward: DRAGON_GUARD_QUEST (Ergin) |
| Ivory Enlaid Hourglass | 1337 | off-hand | AC 40 | Stats: DPHY 0, MELE 30, MMEN 50 | 10 | Unknown |
| Koalite Sword Breaker | 1336 | off-hand | AC 60 | Stats: DPHY 75, DENE 5 | 10 | Unknown |
| large milten shield | 79 | off-hand | AC int(45 + rand(15 | KJ 20000 | Stats: STAT_BESTHIT_TODAY 6, STAT_CASTS_TODAY 4 | 450 | Unknown |
| large wooden shield | 75 | off-hand | AC int(20 + rand(10 | Stats: STAT_BESTHIT_TODAY 3, STAT_CASTS_TODAY 3 | 175 | Unknown |
| leechbane | 314 | off-hand |  | 350 | Unknown |
| pure milten shield | 80 | off-hand | AC int(70 + rand(20 | KJ 50000 | Stats: STAT_BESTHIT_TODAY 12, STAT_CASTS_TODAY 6 | 1000 | Unknown |
| rounded shield | 364 | off-hand | AC 20 | None | Unknown |
| silvertone shield | 448 | off-hand | AC 25 | Stats: DPHY 2, DENE 2 | 700 | Unknown |
| skeletal shield | 799 | off-hand | AC 10 + int rand(3 | KJ 750 | Stats: STAT_CASTS_TODAY 20 | 500 | Unknown |
| small milten shield | 78 | off-hand | AC int(25 + rand(10 | KJ 10000 | Stats: STAT_BESTHIT_TODAY 5, STAT_CASTS_TODAY 3 | 300 | Unknown |
| small wooden shield | 74 | off-hand | AC int(10 + rand(5 | Stats: STAT_BESTHIT_TODAY 2, STAT_CASTS_TODAY 2 | 10 | Unknown |
| Spectral Book | 1335 | off-hand | AC 50 | Stats: DPHY 0, KMEC 30, KCOM 50 | 10 | Unknown |
| sunshield | 968 | off-hand | AC 30 | Stats: DPHY 20, DENE 20, DMEN 20 | 3000 | Unknown |
| troitian greatshield | 605 | off-hand | AC 45 | Stats: DPHY 20, ALOW -3 | 2500 | Quest reward: DRAGON_GUARD_QUEST (Ergin), GREATSHIELD_QUEST (Master Mechanic) |
| tyrite buckler | 1056 | off-hand | AC 5 | Stats: DPHY 8, DENE 5, DMEN 3 | 500 | Unknown |
| wooden buckler | 717 | off-hand | AC 10 | Stats: DPHY 15 | 1500 | Unknown |
| dragonscales | 1260 | skin | AC 50 | Stats: DENE 11, DPHY 11 | 3500 | Unknown |
| sleekscales | 1261 | skin | AC 100 | Stats: DENE 22, DPHY 22 | 4000 | Unknown |
| a ragged shawl | 41 | supertorso | Stats: STAT_CASTS_TODAY 1 | 1 | Unknown |
| adamant cape | 876 | supertorso | AC 15 | Stats: DPHY 10, DENE 10 | 1100 | Unknown |
| black leather cloak | 33 | supertorso | AC 6 | Stats: STAT_CASTS_TODAY 5 | 25 | Unknown |
| brown leather cloak | 11 | supertorso | AC 5 | Stats: STAT_CASTS_TODAY 3 | 25 | Unknown |
| celestial wings | 939 | supertorso | AC 5 | Stats: AUPP 10, ALOW 10, DPHY 5, DMEN 5 | 1300 | Unknown |
| cloak of incantations | 196 | supertorso | Stats: STAT_SWINGS_TOTAL 15, STAT_BESTHIT_TODAY 15, STAT_BESTHIT_OVERALL 5, STAT_FAILS_TODAY 15 | 5300 | Unknown |
| cloak of woodland-hues | 431 | supertorso | AC 10 | Stats: STAT_BESTHIT_TODAY 4, STAT_MISSES_TODAY 4, STAT_MISSES_TOTAL 4 | 7500 | Unknown |
| cloak of woven flesh | 280 | supertorso | AC 10 | Stats: STAT_MISSES_TODAY 3, STAT_MISSES_TOTAL 3, STAT_EXPERTS_TODAY 3, STAT_EXPERTS_TOTAL 3 | 800 | Unknown |
| ghtheen mantle | 596 | supertorso | AC 10 | Stats: DPHY 5 | 800 | Quest reward: GHTHEEN_MANTLE_QUEST (Troitian Seamstress) |
| Ivory Infused Cloak | 1339 | supertorso | AC 20 | Stats: DPHY 0, MELE 35, MMEN 35 | 10 | Unknown |
| Koalite Infused Cloak | 1340 | supertorso | AC 30 | Stats: DPHY 45, DENE 30, DMEN 25 | 10 | Unknown |
| lace shawl | 858 | supertorso | AC 8 | Stats: CAPP 10 | 800 | Unknown |
| lead-lined cloak | 593 | supertorso | AC 2 | Stats: DENE 3 | 300 | Unknown |
| mamoot hide | 568 | supertorso | AC 6 | Stats: DPHY 3, DENE 2 | 125 | Unknown |
| scaled cloak | 719 | supertorso | AC 10 | Stats: DPHY 30, DMEN 10 | 1500 | Unknown |
| sharkskin coat | 852 | supertorso | AC 25 | Stats: ALOW 5 | 650 | Unknown |
| Spectral Cloak | 1338 | supertorso | AC 30 | Stats: DPHY 20, DENE 20, DMEN 10 | 10 | Unknown |
| arachnid body plate | 1160 | torso | AC 65 | Stats: DPHY 27, MELE 20 | 4500 | Unknown |
| azrite splint mail | 725 | torso | AC 50 | Stats: DPHY 30, DENE 20 | 5000 | Unknown |
| black silk dress | 855 | torso | AC 12 | Stats: CAPP 10, DPHY 5 | 500 | Unknown |
| blackened platemail | 274 | torso | AC 55 | Stats: STAT_CASTS_TODAY 20 | 3000 | Unknown |
| blue dragonscale armor | 878 | torso | AC 15 | Stats: DPHY 15, DENE 15 | 1500 | Unknown |
| bomb suit | 709 | torso | AC int(10 + rand(2 | KJ 100 | Stats: STAT_CASTS_TOTAL 1 | 2 | Unknown |
| bonemail | 122 | torso | AC int(5 + rand(3 | Stats: STAT_BESTHIT_TODAY 4 | 14 | Unknown |
| bronze breastplate | 699 | torso | AC 23 | Stats: DPHY 4 | 350 | Unknown |
| burgundy silk dress | 857 | torso | AC 12 | Stats: CAPP 10, DPHY 5 | 400 | Unknown |
| camouflaged chainmail tunic | 9 | torso | AC 25 | Stats: STAT_CASTS_TODAY 8 | 75 | DB: Camouflaged Armour |
| camouflaged leather tunic | 8 | torso | AC 15 | Stats: STAT_CASTS_TODAY 3 | 15 | DB: Camouflaged Armour |
| chainmail | 76 | torso | AC int(50 + rand(15 | KJ 200 | Stats: STAT_BESTHIT_TODAY 3, STAT_CASTS_TODAY 3 | 250 | Unknown |
| chronoplate | 609 | torso | AC 120 | Stats: DPHY 30, MDEF 40 | 10000 | Unknown |
| coat of fun | 62 | torso |  | None | Unknown |
| coral body suit | 976 | torso | AC 50 | Stats: DPHY 15, CATT 10 | 3250 | DB: Emporium |
| cream silk dress | 856 | torso | AC 12 | Stats: CAPP 10, DPHY 5 | 500 | Unknown |
| crimson robes | 238 | torso | AC 10 | Stats: STAT_PLR_DEATHS_TOTAL 8, STAT_SWINGS_TODAY 8 | 1570 | Unknown |
| crude animal-hide vest | 353 | torso | AC 18 | Stats: STAT_CASTS_TODAY 3 | 20 | Unknown |
| crystalline breastplate | 936 | torso | AC 25 | Stats: DPHY 10, DENE 10, DMEN 10 | 1300 | Unknown |
| dryad\'s robes | 469 | torso | AC 10 | Stats: AUPP 3, ALOW 3 | 650 | Unknown |
| ferrite chainmail | 604 | torso | AC 30 | Stats: DPHY 10 | 1500 | Unknown |
| foibly skin | 83 | torso | AC int(10 + rand(2 | KJ 100 | Stats: STAT_CASTS_TOTAL 1 | 2 | Unknown |
| fools gold tunic | 120 | torso | AC int(7 + rand(5 | Stats: STAT_BESTHIT_TODAY 2 | 4 | Unknown |
| ghtheen body armor | 42 | torso | AC 20 | Stats: STAT_CASTS_TODAY 4 | 35 | DB: Ghtheen Gear |
| giant sprinky | 73 | torso | WC int(45 + rand(15 | AC int(30 + rand(10 | Stats: STAT_BESTHIT_TODAY 9, STAT_MISSES_TODAY -3, STAT_MISSES_TOTAL -3, STAT_CASTS_TODAY 3, STAT_CASTS_TOTAL 2 | 250 | Unknown |
| holo-blouse by <kw> | 680 | torso | Stats: CAPP 10 | 0 | Unknown |
| interwoven bones | 798 | torso | AC 10 + int rand(3 | KJ 750 | 400 | Unknown |
| Ivory Plate | 1343 | torso | AC 300 | Stats: DPHY 25, MELE 35, MMEN 35 | 10 | Unknown |
| Koalite Plate | 1342 | torso | AC 300 | Stats: DPHY 50, DENE 50, DMEN 50 | 10 | Unknown |
| leather vest | 90 | torso | AC int(10 + rand(5 | KJ 1000 | Stats: STAT_BESTHIT_TODAY 1, STAT_CASTS_TODAY 1 | 5 | Unknown |
| milte chainmail | 81 | torso | AC int(100 + rand(30 | KJ 200000 | Stats: STAT_BESTHIT_TODAY 15, STAT_CASTS_TODAY 8, STAT_CASTS_TOTAL 2 | 2500 | Unknown |
| milte platemail | 82 | torso | AC int(150 + rand(30 | KJ 200000 | Stats: STAT_BESTHIT_TODAY 20, STAT_CASTS_TODAY 10, STAT_CASTS_TOTAL 5 | 6000 | Unknown |
| onyx breastplate | 992 | torso | AC 9 | Stats: DPHY 10, DENE 10, DMEN 5 | 1500 | Unknown |
| orc skin | 121 | torso | AC int(14 + rand(2 | Stats: STAT_BESTHIT_TODAY 2 | 5 | Unknown |
| padded tunic | 603 | torso | AC 20 | Stats: DPHY 3 | 500 | Unknown |
| platemail | 77 | torso | AC int(70 + rand(20 | KJ 200 | Stats: STAT_BESTHIT_TODAY 4, STAT_CASTS_TODAY 4 | 400 | Unknown |
| ringmail shirt | 355 | torso | AC 28 | Stats: STAT_CASTS_TODAY 10 | 100 | Unknown |
| rotting cloth | 123 | torso | AC int(5 + rand(2 | Stats: STAT_BESTHIT_TODAY -2 | 2 | Unknown |
| shabby cloth tunic | 354 | torso | AC 8 | Stats: STAT_CASTS_TODAY 1 | 3 | Unknown |
| silk websuit | 119 | torso | AC int(15 + rand(6 | Stats: STAT_BESTHIT_TODAY 5 | 10 | Unknown |
| silvertone platemail | 453 | torso | AC 35 | Stats: STAT_CASTS_TODAY 6, STAT_CASTS_TOTAL 6 | 1250 | Unknown |
| skin-tight black goth dress by <kw> | 682 | torso | Stats: CAPP 25 | 0 | Unknown |
| Spectral Plate | 1341 | torso | AC 300 | Stats: DPHY 40, DENE 40, DMEN 40 | 10 | Unknown |
| spherule breastplate | 1118 | torso | AC 450 | Stats: DPHY 30, DENE 20 | 5000 | Unknown |
| stained cloth tunic | 30 | torso | AC 2 | Stats: STAT_CASTS_TODAY 2 | 5 | Unknown |
| stained labcoat | 590 | torso | AC 4 | 50 | Unknown |
| thick overcoat | 592 | torso | AC 5 | 150 | Unknown |
| wabble shirt | 573 | torso | AC 8 | Stats: CAPP 3 | 15 | Unknown |
| westland chainmail | 498 | torso | AC 25 | Stats: DPHY 5 | 400 | DB: Vastis: Armor |
| white t-shirt stating <Klerwear Rulez!> | 679 | torso | Stats: CAPP 5 | 0 | Unknown |
| azrite arm plates | 724 | upper arms | AC 20 | Stats: DPHY 15 | 5000 | Unknown |
| blackened arm plates | 275 | upper arms | AC 20 | Stats: STAT_CASTS_TODAY 10 | 1500 | Unknown |
| bone arm guards | 796 | upper arms | AC 10 + int rand(3 | KJ 750 | 400 | Unknown |
| coral arm plates | 974 | upper arms | AC 20 | Stats: DPHY 4, CATT 5 | 1800 | DB: Emporium |
| crystalline arm plates | 937 | upper arms | AC 15 | Stats: DPHY 5, DENE 5 | 1300 | Unknown |
| ferrite arm plates | 600 | upper arms | AC 12 | Stats: DPHY 5 | 400 | Unknown |
| gilded shoulder guard | 548 | upper arms | AC 6 | Stats: CAPP 4, DPHY 2, DENE 2, DMEN 2 | 4000 | Unknown |
| Ivory Armlet | 1346 | upper arms | AC 35 | Stats: DPHY 0, DMEN 10, MELE 20, MMEN 20 | 10 | Unknown |
| Koalite Armlet | 1345 | upper arms | AC 35 | Stats: DPHY 20, DENE 10, KMEC 10, KCOM 10 | 10 | Unknown |
| leather shoulder pads | 368 | upper arms | AC 4 | Stats: STAT_CASTS_TODAY 3 | 25 | Unknown |
| leather wristguards | 91 | upper arms | AC int(7 + rand(5 | KJ 150 | Stats: STAT_BESTHIT_TODAY 1 | 55 | Unknown |
| magic wristguards | 93 | upper arms | AC int(10 + rand(7 | Stats: STAT_BESTHIT_TODAY 2, STAT_EXPERTS_TODAY 10 | 1450 | Unknown |
| masamune | 173 | upper arms | WC 4 | AC 0 | KJ 20 | 900 | Unknown |
| onyx arm guards | 993 | upper arms | AC 9 | Stats: SUPP 3, AUPP 3, DPHY 7 | 1300 | Unknown |
| silvertone arm plates | 445 | upper arms | AC 10 | Stats: DPHY 2, DENE 2 | 250 | Unknown |
| Spectral Armlet | 1344 | upper arms | AC 35 | Stats: DPHY 30, KCOM 10 | 10 | Unknown |
| steel armplates | 497 | upper arms | AC 6 | Stats: DPHY 4 | 300 | Unknown |
| steel wristguards | 92 | upper arms | AC int(12 + rand(5 | Stats: STAT_BESTHIT_TODAY 1 | 115 | Unknown |
| armored girdle | 545 | waist | AC 5 | Stats: DPHY 3, DENE 3, DMEN 3 | 3500 | Unknown |
| beaver\'s tail | 802 | waist | AC 5 + int rand(20 | KJ 750 | 200 | Unknown |
| championship belt | 586 | waist | WC int(7 + rand(5 | AC 0 | KJ 100 | Stats: CAPP 15 | 6000 | Unknown |
| corset | 859 | waist | AC 2 | Stats: CAPP 8 | 200 | Unknown |
| crimson belt | 1273 | waist | AC 10 | Stats: STAT_PLR_DEATHS_TOTAL 8, STAT_SWINGS_TODAY 8 | 1570 | Unknown |
| flotation belt | 1138 | waist | WC 3 | AC 3 | 9500 | DB: Vastis: Armor |
| gnarled rope-belt | 342 | waist | AC 5 | 5 | Unknown |
| Ivory Belt Buckle | 1349 | waist | AC 15 | Stats: DPHY 0, MELE 20, MMEN 20 | 10 | Unknown |
| Koalite Belt buckle | 1348 | waist | AC 20 | Stats: DPHY 0, SUPP 20, AUPP 20 | 10 | Unknown |
| leather belt | 70 | waist | WC int(5 + rand(5 | AC 0 | KJ 100 | Stats: STAT_BESTHIT_TODAY 1 | 10 | Unknown |
| Spectral belt | 1347 | waist | AC 20 | Stats: DPHY 0, AUPP 20, ALOW 20 | 10 | Unknown |
| tigers tail belt | 721 | waist | AC 10 | Stats: DPHY 10, ALOW 10 | 1500 | Unknown |
| wide leather belt | 504 | waist | AC 4 | Stats: DPHY 2 | 75 | Unknown |
| a barbed wire bracelet | 223 | wrists | AC 20 | Stats: STAT_PLR_DEATHS_TOTAL 20 | 3500 | Unknown |
| a razorblade bracelet | 1275 | wrists | AC 20 | Stats: MELE 20 | 3500 | Unknown |
| azrite bracelet | 730 | wrists | AC 25 | Stats: SUPP 20, SLOW 20 | 5000 | Unknown |
| diamond bracelet | 869 | wrists | AC 4 | Stats: CAPP 10, CATT 5, DPHY 5 | 2500 | Unknown |
| doyomic watch | 227 | wrists | AC 5 | 125 | Unknown |
| goldleaf bracelet | 472 | wrists | Stats: MELE 5 | 1250 | Unknown |
| Ivory Charm | 1352 | wrists | AC 20 | Stats: DPHY 0, MMEN 30 | 10 | Unknown |
| Koalite wrist guard | 1351 | wrists | AC 30 | Stats: DPHY 0, SUPP 30 | 10 | Unknown |
| magnetic baffles | 598 | wrists | AC 15 | Stats: DENE 5, DPHY 3 | 1000 | Unknown |
| mithril manacles | 705 | wrists |  | 10000 | Unknown |
| official wabble wrist-emblem | 569 | wrists | AC 2 | Stats: CAPP 2, CATT 4 | 300 | Unknown |
| Spectral bracelet | 1350 | wrists | AC 25 | Stats: DPHY 30 | 10 | Unknown |
| woven tribal bracelet | 801 | wrists | AC 10 + int rand(3 | KJ 750 | 200 | Unknown |

## Collectibles

| Name | Rec | Details | Value | Source |
| --- | --- | --- | --- | --- |
| "frozen $type" | 376 | 'A severed body part | None | DB: OrcSwamps: Frozen Bodyparts |
| "game panel" | 692 | "It's a game. | None | Unknown |
| $main::grapemap[int rand($#main::grapemap+1 | 299 | These pitted grapes glitter like candy in your eye. (WC -20) | 5 | Unknown |
| &main::rand_ele('Pink Fuzzem' | 398 | 'A cuddly little creature (WC 2 | AC 3) | None | DB: Vastis: Fuzzem |
| &main::rand_ele('Plains Jackrabbit' | 654 | 'Much smaller than most of the other creatures of Troitia (WC 5 | AC 5) | None | DB: Troitia: Plains 1, Troitia: Plains 2 |
| a vial of blood | 156 | 'This small glass vial is about three inches long. | 50 | Unknown |
| a void sphere | 306 | 'A perfect sphere (WC 65 | KJ 4000) | 3000 | Unknown |
| adamant scepter | 879 | 'This massive scepter would make a formidable bludgeoning weapon. (WC 65) | 2000 | Unknown |
| Aesfuin | 1092 | The great djinn Aesfuin with dark red balls of flame where his eyes should have been. (WC 200 | AC 200) | None | Unknown |
| altar of weights and measures of cryl sacrifical offerings | 1263 | 'The simple-looking altar has several scales in which money may be put. | 10 | Unknown |
| amethyst dust | 1107 | This is a fine bag of amethyst dust. | 2750 | Unknown |
| amethyst shard | 405 | 'A simple shard of purple amethyst | 220 | Unknown |
| amethyst vial | 200 | 'While only containing simple clear liquid inside (WC 5) | 1500 | DB: Vials |
| an empty vial | 155 | 'A simple glass vial | 10 | Unknown |
| ansuz rune | 916 | This small blue pebble like rune has a sigil inscribed on one side and it seems to give the bearer a feeling of achievement and leadership | 1000 | Unknown |
| ant feelers | 134 | 'A blanket of fine (WC int(12 + rand(2) | 10 | Unknown |
| Antisin | 378 | 'A lovely young gal | None | Unknown |
| artemis bow | 941 | A bow made from an oak branch that has been sun-bleached to a white color. (WC 49) | 1200 | Unknown |
| avarice crank | 1249 | This large cryl blade gleams in the dim light giving off its own particularly evil glow. (WC 85) | 3000 | Unknown |
| Azral Outcast | 768 | 'This Azral looks to be down on his luck (WC 700 | AC 300) | None | Unknown |
| azrite flail | 736 | 'An Azrite flail. (WC 62) | 2000 | Unknown |
| azrite halberd | 737 | 'This massive halberd is nearly fourteen feet from end to end. (WC 68) | 2500 | Unknown |
| azrite morning star | 739 | 'This morning star is comprised of a six foot long wooden shaft (WC 80) | 3000 | Unknown |
| bag of dust | 1112 | 'A bag of fine precious dust | None | Unknown |
| bag of goodies | 1156 | 'This is a lucky bag of goodness | None | Unknown |
| bag of pixie dust | 466 | 'A tightly sealed satin bag | 65 | Unknown |
| beetle mandibles | 133 | 'Jaw parts as large as a Dryne\'s head (WC int(15 + rand(3) | 13 | Unknown |
| Beholder | 910 | This entity is made up of a mass of eyes all leering right at you. (WC 170 | AC 170) | None | DB: Catacombs: Blood Stained Corridor |
| bit of twisted wire | 270 | A few feet of rusted wire. | None | Unknown |
| black grapes | 64 | These pitted grapes glitter like candy in your eye. (WC -20) | 10 | DB: Clucky, Hillside Mons, Test NPC set |
| black staff | 932 | A tall staff | 3000 | Unknown |
| black tome | 1073 | A ancient tome with the symbol of death on the cover. | 5000 | Unknown |
| blessed dagger | 1257 | 'A brilliant dagger (WC 50) | 2200 | Unknown |
| Bloodlord | 258 | 'High Demon Lord (WC 200 | AC 200 | Stats: STAT_NPC_DEATHS_TOTAL 280, STAT_PLR_KILLS_TODAY 280, STAT_PLR_KILLS_TOTAL 280, STAT_PLR_DEATHS_TODAY 280, STAT_PLR_DEATHS_TOTAL 280, STAT_SWINGS_TODAY 280, STAT_SWINGS_TOTAL 280, STAT_BESTHIT_TODAY 280, STAT_BESTHIT_OVERALL 280, STAT_MISSES_TODAY 280, STAT_MISSES_TOTAL 280, STAT_EXPERTS_TODAY 280, STAT_EXPERTS_TOTAL 280, STAT_CASTS_TODAY 280, STAT_CASTS_TOTAL 280, STAT_FAILS_TODAY 280, STAT_FAILS_TOTAL 280) | None | Unknown |
| blue earthstone | 527 | 'A simple stone | 20 | Unknown |
| blue lagoon | 977 | A sparkling blue liquid bubbles energetically in this blue vial. (WC 5) | 250 | DB: Emporium |
| blue tome | 819 | 'This blue leather bound tome seems to be vibrating slightly in your hands | 1900 | Unknown |
| bone club | 1065 | The shaft of this giant club is made out of a small tree. (WC 43) | 450 | Unknown |
| bone key | 919 | This small key looks as if it has been made from human knuckle bones and is adorned with small perfect rubies. (KJ 500) | 1000 | Unknown |
| book of blood | 921 | This ancient book is bound in thick burgundy leather. | 1900 | Unknown |
| boomer | 384 | 'A large boomerang (WC -25) | 8500 | Unknown |
| bottle of exp reduction | 588 | 'On the round neck of the bottle is a paper label (WC 1) | 1000 | Unknown |
| brexus the broad-spear | 446 | 'Named after the first Vexian king (WC 75) | 10000 | Unknown |
| Bridge Guard | 303 | 'Proudly standing guard before the entrance to a drawbridge (Stats: STAT_NPC_DEATHS_TOTAL 50, STAT_PLR_KILLS_TODAY 50, STAT_PLR_KILLS_TOTAL 50, STAT_PLR_DEATHS_TODAY 50, STAT_PLR_DEATHS_TOTAL 50, STAT_SWINGS_TODAY 50, STAT_SWINGS_TOTAL 50, STAT_BESTHIT_TODAY 50, STAT_BESTHIT_OVERALL 50, STAT_MISSES_TODAY 50, STAT_MISSES_TOTAL 50, STAT_EXPERTS_TODAY 50, STAT_EXPERTS_TOTAL 50, STAT_CASTS_TODAY 50, STAT_CASTS_TOTAL 50, STAT_FAILS_TODAY 50, STAT_FAILS_TOTAL 50) | None | Unknown |
| broad-faced halberd | 696 | 'The pinnacle of versatility in a polearm (WC 45) | 2500 | Unknown |
| broken handle | 980 | This small golden handle looks as if it has been broken off from other parts of a large locking mechanism. | None | Unknown |
| brown earthstone | 526 | 'A circular stone | 20 | Quest required: EARTHSTONE_QUEST (Elder Treant) |
| bullwhip | 150 | This rather long whip appears so worn-down that it could very well have been used by an elder Taer slavemaster. | 50 | Unknown |
| calamine the cleaver | 1070 | A large katana made of the famous Tyrenin alloy. (WC 80) | 850 | Unknown |
| can of tuna-safe dolphin | 579 | 'This is a can of succulent dolphin meat (WC .0001 | AC 0) | 100 | Unknown |
| Candlesquad | 23 | 'Candlesquad carries three candles in his right arm and still another sticks out what used to be his left. | None | Unknown |
| carsack lizard fangs | 191 | 'A set of small (WC 30) | 10 | Unknown |
| carsack lizard tooth | 189 | 'The front tooth of a carsack lizard | 800 | Unknown |
| channel scanner | 575 | This scanner sends and receives ultrasonic AYT signals to determine which users are on a particular channel. (WC 0 | AC 0) | 150 | DB: The Blinking Diode |
| chartreuse vial | 145 | 'Most of this yellow-green liquid has already solidified along the walls of the vial. (WC 5) | 250 | DB: Vials |
| cheap knife | 36 | 'The blade of this knife is about four inches long. (WC 1) | 1 | Unknown |
| chocolate doughnut | 137 | 'The roll is filled with a chocolate pudding (WC -50) | 20 | DB: Doughnuts |
| Chuck of Koalite | 1377 | A large piece of Ferrite. (WC 12) | 6000 | Unknown |
| chunk of diseased skin | 224 | 'A large slab of diseased flesh. | 0 | Unknown |
| chunk of ice | 635 | 'A chunk of ice | 10 | DB: Troitia: Icy Valley |
| chunk of infected skin | 1276 | 'A large slab of infected flesh. | 0 | Unknown |
| chunk of iron | 633 | 'A large chunk of rusted iron | 10 | Unknown |
| chunk of meat | 289 | 'A large chunk of juicy meat (WC -300) | 50 | DB: Doughnuts, Ye Olde Doughnut Shoppe |
| chunk of sapphire | 406 | 'A large chunk of sapphire. | 450 | Unknown |
| chunk of stone | 634 | 'A large shard of red feldspar. | 10 | Unknown |
| clay bowl | 89 | This fragile bowl has just enough room in it for one serving of just about any treat. (WC -8) | 30 | DB: Doughnuts, Ye Olde Doughnut Shoppe |
| clay rod | 86 | 'The brown clay of which this rod is composed reflects no light (WC int(30 + rand(20 | KJ 1000) | 10 | Unknown |
| cluckle | 57 | 'The bottle of cluckle reads (WC -2) | 30 | DB: Clucky |
| coffee | 138 | 'Marked with the symbol of Friendly Coffee (tm (WC -10) | 30 | DB: Bob\, Doughnuts |
| complimentary coffee | 302 | 'A ceramic mug | 0 | Unknown |
| Cook | 1043 | This round jolly cook is singing away in the farmhouse kitchen. | None | Unknown |
| crillium nugget | 309 | 'A large nugget | 5 | Unknown |
| crimson tapestry | 959 | 'Crimson Advocate: This huge entity is a master of lycanthropy and blood-sucking creatures of the night and is a mass of swirling energy. (AC 20) | 0 | Unknown |
| crude axe | 805 | The wood for this axe is selected from the smaller trees. (WC 30) | 200 | Unknown |
| crude bow | 804 | The wood for this bow is selected from the smaller trees. (WC 35) | 200 | Unknown |
| cruel dagger | 369 | 'A twisted dagger (WC 5) | 30 | Unknown |
| cruel flog | 619 | 'A vicious whip (WC 57) | 3000 | Unknown |
| crumbling mold | 553 | 'A chunk of yellow mold | 5 | Unknown |
| crystalline javelin | 942 | This javelin has been fashioned from a piece of crystal. (WC 58) | 1300 | Unknown |
| crystallized opti-scanner | 199 | This small data pad is embedded with three rows of three crystals. (WC -1000) | 3400 | Unknown |
| curved sabre | 617 | 'A thin sabre (WC 55) | 2200 | Unknown |
| dagaz rune | 917 | This green pebble like rune has a sigil inscribed on one side and it seems to give the bearer a feeling of satisfaction that a goal is well on the way to being completed | 1000 | Unknown |
| dagger | 125 | 'A single piece of worked metal (WC int(3 + rand(1) | 6 | Unknown |
| dancing scimitar | 546 | 'Slender and light (WC 65) | 3500 | Unknown |
| darplant | 296 | 'A hardy plant (WC -2000) | 550 | DB: Academy Supply Shop |
| deck of teron cards | 161 | 'A deck of cards | 3000 | DB: Spell-like Affectors & mystical cards |
| Demon Lord | 1091 | A red translucent demon summoned to this plane to serve Aesfuin. (WC 220 | AC 180) | None | Unknown |
| Desert Protector | 829 | 'This small but perfectly formed guardian can hardly been seen against the desert backdrop. (WC 400 | AC 300) | None | Unknown |
| desert tapestry | 958 | 'Desert Protector: This small but perfectly formed guardian can hardly been seen against the desert backdrop. (AC 20) | 0 | Unknown |
| detonator | 170 | A small black box with a plunger handle used to detonate explosive devices. (KJ 100) | 1500 | Unknown |
| diamond dust | 1104 | This is a fine bag of diamond dust. | 2750 | Unknown |
| Diamond Turtle Shell | 1373 | A large shell made of diamonds. | 2100 | Unknown |
| Diary | 1384 | An old diary that when read takes about this strange adventure. | None | Unknown |
| Dillfrog | 4 | 'Dillfrog jumps about in its own hip-hoppity way | 7 | DB: Edible Frogs, Hillside Mons, Test NPC set |
| dimensional gremlin | 95 | 'A disgusting stench emanates from this massive metallic structure. | 165 | Unknown |
| dimensional gremlin | 193 | 'A disgusting stench emanates from this massive metallic structure. | 165 | Unknown |
| dimensional gremlin | 194 | 'A disgusting stench emanates from this massive metallic structure. | 165 | Unknown |
| Dimensional Shambler | 282 | 'This creature consists of an eye about four feet across (AC 40 | Stats: STAT_NPC_DEATHS_TOTAL 250, STAT_PLR_KILLS_TODAY 250, STAT_PLR_KILLS_TOTAL 250, STAT_PLR_DEATHS_TODAY 250, STAT_PLR_DEATHS_TOTAL 250, STAT_SWINGS_TODAY 250, STAT_SWINGS_TOTAL 250, STAT_BESTHIT_TODAY 250, STAT_BESTHIT_OVERALL 250, STAT_MISSES_TODAY 250, STAT_MISSES_TOTAL 250, STAT_EXPERTS_TODAY 250, STAT_EXPERTS_TOTAL 250, STAT_CASTS_TODAY 250, STAT_CASTS_TOTAL 250, STAT_FAILS_TODAY 250, STAT_FAILS_TOTAL 250) | None | Unknown |
| dna sensor | 172 | This tiny black optic sphere is used in the detection of the the different DNA strains present in a multitude of different races. | 5000 | Unknown |
| dog teeth | 127 | 'Two eye-catching (WC int(8 + rand(3) | 6 | Unknown |
| dolphin jerky | 581 | 'At Delta we have a saying (WC .0001 | AC 0) | 100 | Unknown |
| double-bladed butter knife | 339 | 'A shiny (WC int(4 + rand(2) | 70 | DB: Treehouse: Kreaph Store |
| double-edged battleaxe | 288 | 'This massive (WC 35) | None | Unknown |
| dragon\'s scale | 822 | An dragon\'s scale which is stronger than anything you have come across so far. | 400 | Quest required: DRAGON_GUARD_QUEST (Ergin) |
| dragons egg | 820 | This enormous dragon\'s egg is very heavy and every now and then you can feel movement from the inside. (KJ 500) | None | Quest required: DRAGON_EGG_QUEST (Angry Dragon) |
| Drendal | 1292 | 'The spectral dragon lies sprawled out inside his cramped throne room (WC 250 | AC 300 | Stats: STAT_NPC_DEATHS_TOTAL 225, STAT_PLR_KILLS_TODAY 225, STAT_PLR_KILLS_TOTAL 225, STAT_PLR_DEATHS_TODAY 225, STAT_PLR_DEATHS_TOTAL 225, STAT_SWINGS_TODAY 225, STAT_SWINGS_TOTAL 225, STAT_BESTHIT_TODAY 225, STAT_BESTHIT_OVERALL 225, STAT_MISSES_TODAY 250, STAT_MISSES_TOTAL 225, STAT_EXPERTS_TODAY 250, STAT_EXPERTS_TOTAL 225, STAT_CASTS_TODAY 275, STAT_CASTS_TOTAL 250, STAT_FAILS_TODAY 200, STAT_FAILS_TOTAL 250) | None | Unknown |
| ebon wand | 683 | TPSHD (WC 18) | 100 | Unknown |
| ebony feather | 152 | This amazingly dark feather is about two fingers\' widths long and presents itself to be in horrible shape. (WC -500) | 200 | Unknown |
| ebony vial | 162 | Whatever sludge is contained within this vial appears to render all sparks of light impassable. (WC 10) | 1800 | DB: Vials |
| egg shell | 821 | A piece of fresh dragon\'s egg shell; this was once the home of the cutest baby dragon that is now running wildly into the cavern walls and is trying to ignite your ankles. | 300 | Quest required: DRAGON_GUARD_QUEST (Ergin); Quest reward: DRAGON_EGG_QUEST (Angry Dragon) |
| eldar baby | 271 | 'A young eldar infant | None | Quest required: ELDAR_NOBLEWOMAN (Eldar Noblewoman) |
| Eldar Noblewoman | 256 | 'The once sapphire eyes of this beautiful Eldar have been stained red with grief (WC 25 | AC 10) | None | Unknown |
| elongated tanspot | 195 | This tanspot is appended with carefully-prepared instructions: "Do not eat. (KJ 500000) | 5000 | Unknown |
| emerald dust | 1106 | This is a fine bag of emerald dust. | 2750 | Unknown |
| Emerald Elemental | 400 | 'A tall creature (WC 100 | KJ 1000000) | None | DB: Vastis: Crystal 1 |
| emerald shard | 407 | 'A slender shard of deep green emerald. | 400 | Unknown |
| empty jar | 1136 | 'This small jar is made from very durable thick glass (WC 6) | 800 | Unknown |
| enchanted razor blade | 176 | This gleaming piece of sharp metel appears to be very capable of slicing off a body part in one stroke. (WC 25) | 2500 | Unknown |
| Enchanted String | 1378 | A string that glows with the light of magic. | 100 | Unknown |
| Energetic foal | 1036 | 'This small foal stands about four feet tall and has a shaggy light brown coat. (WC 2 | AC 10) | None | Unknown |
| engraved sabre | 618 | 'A sabre similar in weight and size to those issued to high Troitian commanders. (WC 52) | 2500 | Unknown |
| falcon\'s feather | 435 | A single feather from a sungold falcon. | 10 | Unknown |
| Firesquad | 237 | Firesquad carries three burning oaks as his right arm while his left is covered with white pine. (KJ 200000) | None | Unknown |
| Firesquad | 584 | Firesquad carries three. (KJ 10_000_000) | None | Unknown |
| flagon of silk essence | 1163 | A small flagon filled with magical silk essence. | 75 | DB: Vrean Shop |
| flask of iridescent liquid | 640 | 'Glowing liquid swirls around in this thick glass flask. | 600 | Unknown |
| Flax | 1375 | A piece of flax about three feet long. | 50 | Unknown |
| flesh book | 374 | 'An yellowed tome | 1250 | Unknown |
| fluxblade | 620 | 'This shimmering longsword is composed primarily of iron (WC 61) | 4500 | Unknown |
| forged blade | 900 | 'This blade is still rough and unfinished. (WC 4) | 1 | Quest required: OBSIDIAN_BLADE_QUEST (Obsidian Protector) |
| formaldehyde flask | 677 | 'Even the cork sealing this flask reeks of thick chemicals. | 600 | Unknown |
| fragile spear | 129 | 'While the blade is sharp and well-kept (WC int(7 + rand(6) | 5 | Unknown |
| freshly molded hilt | 898 | 'This hilt is made of hardened steel | 1 | Quest required: OBSIDIAN_BLADE_QUEST (Obsidian Protector) |
| frog soup | 88 | 'Although the broth is considerably cold after being left out for perhaps centuries (WC -4) | 70 | Unknown |
| frost ghtheen hide | 637 | 'A large chunk of frost ghtheen hide. | 100 | Quest required: GHTHEEN_MANTLE_QUEST (Troitian Seamstress) |
| Fuzzem Runt | 399 | 'This young fuzzem stands barely a foot high (WC 1 | AC 3) | None | DB: Vastis: Fuzzem |
| fuzzfruit | 415 | 'A peach-like fruit | 10 | Unknown |
| fuzzfruit pie | 854 | 'This pie Has been baked in the fuzzem village using only the finest fuzzfruit. (WC 5) | 300 | DB: Ladys Shop |
| Ghost Warriors | 1029 | 'A gloomy warrior with a featureless face (WC 35 | AC 60 | Stats: DMEN 1000) | None | DB: Ghost Warriors |
| Ghtheen Hide | 1380 | A ruff leather from a tamed Gtheen. | 50 | Unknown |
| ghtheen whip | 197 | This long brown length of ghtheen has been treated with hardeners to make it a deadly weapon. (KJ 100) | 430 | Unknown |
| golden pear | 379 | 'A shiny golden pear | 10 | DB: Hillside Mons; Quest required: ANTISIN (Antisin) |
| granite tapestry | 960 | 'Granite Vitalizer: This huge stone-like entity towers above you (AC 20) | 0 | Unknown |
| gray putty | 163 | This pale grey substance has been collected and formed into a small ball. (KJ 100) | 225 | Unknown |
| greataxe of bloodlust | 279 | 'Even looking at this four foot  long massive great-axe fills someone with dread. (WC 90) | 8000 | Unknown |
| greatstaff of ichor | 1279 | 'Even looking at this twelve foot long massive great-staff fills someone with dread. (WC 90) | 8000 | Unknown |
| green earthstone | 529 | 'This slender stone is oval shaped | 20 | Quest required: EARTHSTONE_QUEST (Elder Treant) |
| green tome | 524 | 'A small book | 500 | Unknown |
| green-colored scimitar | 14 | 'The scimitar consists of a slender three foot blade (WC 5) | 25 | Unknown |
| gridded web | 67 | 'This is a gridded | None | Unknown |
| grub juice | 565 | 'A handful of green bug-ichor. | 35 | Unknown |
| Guardian Hound | 263 | 'This vicious beast guards the entrance into the Plane of Damnation. (WC 30 | AC 30) | None | DB: Gate Dogs of Damnation |
| gunpowder | 167 | A small pile of a greyish sandlike substance. (KJ 10000) | 400 | Unknown |
| gutrippa | 346 | 'A curved scimitar (WC 59) | 4000 | Unknown |
| handful of grape seeds | 297 | 'A dozen of so small grape seeds of high quality. (WC -3000) | 125 | Unknown |
| headbasha | 358 | 'This vicious looking battle hammer is nearly four feet long. (WC 50) | 2500 | Unknown |
| heaping mound of cryl | 389 | 'A collection of coins | None | Unknown |
| heavy cutlass | 28 | 'Consisting of a thick blade and leather bound hilt (WC 12) | 50 | Unknown |
| heavy oak post | 703 | 'An extremely heavy oak post (WC 120) | 400 | Unknown |
| heavy-headed mace | 499 | 'Forged from a darkened metal (WC 48) | 3000 | DB: Vastis: Weapons |
| hoard of cryl | 547 | An overflowing hoard of cyan-colored cryl. | None | Unknown |
| hoarg battleplan | 1006 | This is a large piece of paper with a layout of an attack plan. (AC 0 | Stats: AUPP 10, KCOM 10) | 0 | Quest required: HASTE_AMULET_QUEST (Mayor of Outcast City) |
| hoarg signet ring | 1005 | A non-specific ring. (AC 0 | Stats: AUPP 10, KCOM 10) | 0 | Quest required: HASTE_AMULET_QUEST (Mayor of Outcast City) |
| hobgoblin fist | 128 | 'To say that this severed Hobgoblin\'s hand with its yellowed fingernails and gray (WC int(4 + rand(1) | 1 | Unknown |
| hooked scythe | 697 | 'A long sabre-like blade affixed to the end of a cedar shaft. (WC 50) | 3500 | DB: Thor\ |
| horn of fear | 350 | 'A jet black horn (WC 85) | 5000 | Unknown |
| hq range-extender | 577 | 'This high-quality broadcasting unit widens your broadcast channel range to a maximum channel of 100 (WC 0 | AC 0) | 5000 | Unknown |
| Ice Assassin | 1293 | 'Cloaked in the deepest of living shadows (WC 150 | AC 150 | Stats: STAT_NPC_DEATHS_TOTAL 180, STAT_PLR_KILLS_TODAY 180, STAT_PLR_KILLS_TOTAL 180, STAT_PLR_DEATHS_TODAY 200, STAT_PLR_DEATHS_TOTAL 180, STAT_SWINGS_TODAY 180, STAT_SWINGS_TOTAL 180, STAT_BESTHIT_TODAY 180, STAT_BESTHIT_OVERALL 180, STAT_MISSES_TODAY 200, STAT_MISSES_TOTAL 200, STAT_EXPERTS_TODAY 150, STAT_EXPERTS_TOTAL 150, STAT_CASTS_TODAY 100, STAT_CASTS_TOTAL 100, STAT_FAILS_TODAY 80, STAT_FAILS_TOTAL 180) | None | Unknown |
| ice disc | 1290 | 'This small round disc is perhaps half a foot across. (KJ 500) | 800 | Unknown |
| Ice Mage | 1294 | 'Master of shadow magic (WC 120 | AC 120 | Stats: STAT_NPC_DEATHS_TOTAL 180, STAT_PLR_KILLS_TODAY 180, STAT_PLR_KILLS_TOTAL 180, STAT_PLR_DEATHS_TODAY 150, STAT_PLR_DEATHS_TOTAL 200, STAT_SWINGS_TODAY 200, STAT_SWINGS_TOTAL 200, STAT_BESTHIT_TODAY 180, STAT_BESTHIT_OVERALL 180, STAT_MISSES_TODAY 125, STAT_MISSES_TOTAL 125, STAT_EXPERTS_TODAY 125, STAT_EXPERTS_TOTAL 125, STAT_CASTS_TODAY 100, STAT_CASTS_TOTAL 175, STAT_FAILS_TODAY 175, STAT_FAILS_TOTAL 200) | None | DB: Icefort Boss |
| Ichor | 1268 | 'High Demon Lordess (WC 200 | AC 200 | Stats: STAT_NPC_DEATHS_TOTAL 280, STAT_PLR_KILLS_TODAY 280, STAT_PLR_KILLS_TOTAL 280, STAT_PLR_DEATHS_TODAY 280, STAT_PLR_DEATHS_TOTAL 280, STAT_SWINGS_TODAY 280, STAT_SWINGS_TOTAL 280, STAT_BESTHIT_TODAY 280, STAT_BESTHIT_OVERALL 280, STAT_MISSES_TODAY 280, STAT_MISSES_TOTAL 280, STAT_EXPERTS_TODAY 280, STAT_EXPERTS_TOTAL 280, STAT_CASTS_TODAY 280, STAT_CASTS_TOTAL 280, STAT_FAILS_TODAY 280, STAT_FAILS_TOTAL 280) | None | Unknown |
| imperial plasma pistol | 46 | 'This small pistol is designed to be used by the Imperial Thrakian soldiers. (WC 39 | KJ 3500) | 500 | Unknown |
| insta-salp | 385 | 'A sealed package of powdered dillfrogs and black grapes. | 20 | DB: Clucky |
| intestines of a demon | 268 | 'A collection of stringy intestines | 10 | Unknown |
| Intoxicated Demon | 261 | 'Muck covers the face of this demon (WC 25 | AC 15 | Stats: STAT_NPC_DEATHS_TOTAL 120, STAT_PLR_KILLS_TODAY 120, STAT_PLR_KILLS_TOTAL 120, STAT_PLR_DEATHS_TODAY 120, STAT_PLR_DEATHS_TOTAL 120, STAT_SWINGS_TODAY 120, STAT_SWINGS_TOTAL 120, STAT_BESTHIT_TODAY 120, STAT_BESTHIT_OVERALL 120, STAT_MISSES_TODAY 120, STAT_MISSES_TOTAL 120, STAT_EXPERTS_TODAY 120, STAT_EXPERTS_TOTAL 120, STAT_CASTS_TODAY 120, STAT_CASTS_TOTAL 120, STAT_FAILS_TODAY 120, STAT_FAILS_TOTAL 120) | None | DB: Drunken Demon |
| iridescent vial | 148 | 'The particles contained within this vial change colors so much that it often emits a constant (WC 30) | 3500 | DB: Vials |
| iron pike | 694 | 'A hooked iron spearhead (WC 28) | 280 | Unknown |
| ironoak bark | 298 | 'This small piece of bark is about six inches long (WC -2000) | 250 | DB: Academy Supply Shop |
| ironplate | 159 | 'This skillfully crafted armour is composed of thick metal plates (Stats: STAT_SWINGS_TODAY 2, STAT_BESTHIT_TODAY 8, STAT_MISSES_TODAY -10, STAT_MISSES_TOTAL -14, STAT_EXPERTS_TODAY 1, STAT_EXPERTS_TOTAL 1, STAT_CASTS_TODAY 12, STAT_CASTS_TOTAL 4) | 3800 | Unknown |
| item-rename certificate | 687 | 'This certificate entitles the holder to the renaming of one item (given developer-approval of the new name | 500 | Unknown |
| ithenian trunk | 903 | 'A wooden trunk | 5000 | Unknown |
| Ivory | 1376 | A hard cream white material. (WC 12) | 6000 | Unknown |
| ivory-hilted bullwhip | 198 | This long black whip is adorned with an ivory hilt. (WC 40) | 1700 | Unknown |
| jellied eels | 978 | 'This long slimy eel (WC 2) | 350 | DB: Emporium |
| juicy apple | 1051 | This round green apple is ripe and bursting with goodness. | 1 | DB: Apple Grove |
| kenaz rune | 918 | This small red pebble like rune has a sigil inscribed on one side and it seems to give the bearer a feeling that of warmth and a sense of moving out of the darkness | 1000 | Unknown |
| knife of the reaper | 284 | 'The knife (WC 30) | 7600 | Unknown |
| Lady Ladur | 510 | 'Queen Ladur (WC 200 | AC 300 | Stats: DMEN 1000) | None | Unknown |
| large lock | 981 | This large lock is useless on its own. | None | Unknown |
| large pile of cryl | 388 | 'A collection of coins | None | Unknown |
| large rough onyx | 1008 | This is a large piece of onyx that could be made into something. (AC 0 | Stats: AUPP 10, KCOM 10) | 0 | Unknown |
| large ruby | 1074 | 'This piece of ruby is a deep dark red color | 375 | Unknown |
| length of chain | 149 | These half inch links of corrugated steel form a chain of about 2 feet\'s length. | 75 | Unknown |
| long elmwood stick | 1134 | This simple stick is made from smooth polished elmwood. (WC 6) | 800 | Unknown |
| long spear | 69 | 'A razor-sharp blade tops this very long (WC int(30 + rand(20 | KJ 1250) | 250 | Unknown |
| long wick | 169 | A long wick used for linking multiple explosives together. (KJ 100) | 150 | Unknown |
| longsword | 126 | 'Durability must be one virtue of this longsword if it has indeed been used as much as the stained (WC int(10 + rand(2) | 15 | Unknown |
| loose panel | 315 | The panel is loosely attached to a nearby wall. | None | Unknown |
| loose panel | 316 | The panel is loosely attached to a nearby wall. | None | Unknown |
| loose panel | 317 | The panel is loosely attached to a nearby wall. | None | Unknown |
| luminous mushroom | 554 | 'A large mushroom | None | DB: Wabble: Caves |
| magenta vial | 312 | 'This is a wide vial | 200 | Unknown |
| Majik Periwinkle Fuzzem | 582 | 'This Periwinkle coloured fuzzem also has a majikcal sparkle to it\'s fur that glows like some type of aurora when it\'s gently petted. (WC 2 | AC 3 | Stats: STAT_NPC_DEATHS_TOTAL 7, STAT_PLR_KILLS_TODAY 7, STAT_PLR_KILLS_TOTAL 7, STAT_PLR_DEATHS_TODAY 7, STAT_PLR_DEATHS_TOTAL 7, STAT_SWINGS_TODAY 7, STAT_SWINGS_TOTAL 7, STAT_BESTHIT_TODAY 7, STAT_BESTHIT_OVERALL 7, STAT_MISSES_TODAY 7, STAT_MISSES_TOTAL 7, STAT_EXPERTS_TODAY 7, STAT_EXPERTS_TOTAL 7, STAT_CASTS_TODAY 7, STAT_CASTS_TOTAL 7, STAT_FAILS_TODAY 7, STAT_FAILS_TOTAL 7) | None | Unknown |
| mammoth club | 174 | The mammoth club is hard and heavy with a handle for easy use. (WC 42 | AC 0 | KJ 100) | 190 | Unknown |
| mammoth tusk | 611 | 'A massive mammoth tusk (WC 17) | 2200 | Unknown |
| mana leech | 711 | 'Hungry for knowledge | 2 | Unknown |
| Marauder Leader | 1084 | The leader of the group of marauders that terrorize the nearby tyrinian empire. (WC 165 | AC 30) | None | Unknown |
| marauder tapestry | 957 | 'Optical Marauder: This magnificent figure stands at around eight feet tall. (AC 20) | 0 | Unknown |
| marked slab | 530 | 'A tablet carved from a rough stone. | 1 | Unknown |
| marked slab | 531 | 'A tablet carved from a rough stone. | 1 | Unknown |
| marked slab | 532 | 'A tablet carved from a rough stone. | 1 | Unknown |
| Massive Dillfrog | 383 | 'Dillfrog jumps about in its own hip-hoppity way | 50 | DB: OrcSwamps: Water |
| Massive Door | 1119 | The door is preventing anyone traveling further into the castle. | None | Unknown |
| massive piece of steal | 713 | this chunk of steel must weigh a ton!. (WC int(88 + rand(3 | KJ 1250) | 15000 | Unknown |
| matus\'alem staff | 1069 | The ancient staves of the arcane order of mages known as the Matus. (WC 70) | 1100 | Unknown |
| mauve vial | 146 | 'A sparkling purple liquid rests calmly in this short (WC 5) | 1250 | DB: Vials |
| medical salve | 638 | 'A small tin of medical-grade salve. | 600 | Unknown |
| metal bar | 1125 | This medium sized metal bar is severed at either end making it a reasonably effective weapon. (WC 48) | 1200 | Unknown |
| miner\'s pick | 613 | 'This pick looks like it has been through hell and back. (WC 28) | 300 | Unknown |
| miner\'s shovel | 571 | 'This metal spade has a reinforced handle (WC 18) | 60 | Unknown |
| mq range-extender | 576 | 'This medium-quality broadcasting unit widens your broadcast channel range to a maximum channel of 1 (WC 0 | AC 0) | 2500 | Unknown |
| My Pet Hamster | 1155 | This hamster\'s fur is soft and smooth and striped brown and white. | None | Unknown |
| nightsky flower | 688 | 'A simple flower | 20 | DB: OrcSwamps: Level 1-Strong, OrcSwamps: Level 1-Weak; Quest required: WESTLAND_BARD (Westland Bard) |
| nuts and bolts | 982 | This collection of nuts and bolts could have numerous uses. | None | Unknown |
| oak spear | 693 | 'This spear is designed to be more of an offensive thrusting weapon than a defensive parrying weapon. (WC 20) | 200 | DB: Thor\ |
| obsidian blade | 341 | 'This light blue longsword glitters blindingly (WC 85) | 5000 | Quest reward: OBSIDIAN_BLADE_QUEST (Obsidian Protector) |
| obsidian dirk | 1068 | A small dagger with a hilt made of tyrite. (WC 51) | 350 | Unknown |
| oily crankshaft | 610 | 'A massive (WC 15) | 100 | Quest required: GREATSHIELD_QUEST (Master Mechanic) |
| Old Diary | 1383 | An old beat up diray with what appears to be pages missing out of it. | None | Unknown |
| Old man Jeza | 1370 | 'An old man (WC 200 | Stats: DPHY 1400, DENE 2000, DMEN 2000, MOFF 1250, MDEF 2000, MELE 1250, MMEN 1250, SUPP 1250, SLOW 1250, AUPP 1250, ALOW 1250, KMEC 1250, KCOM 1250, KMED 1250, KSOC 1250, CAPP 1250, CATT 1250) | None | DB: East Road, West Road |
| olive vial | 143 | A sparkling liquid rests calmly in this green vial. (WC 5) | 250 | DB: Vials |
| onyx greatsword | 1009 | This massive onyx blade gleams in the dim light giving off its own particularly evil glow. (WC 85) | 3000 | Unknown |
| optical lact | 347 | 'A hand-sized lact | 200 | Unknown |
| orange vial | 311 | 'A vial of orange liquid | 100 | Unknown |
| Orc Fanatic | 325 | 'Eyes wide with madness (WC 75 | AC 60) | None | DB: OrcSwamps: Fanatics |
| oversized wrench | 344 | 'Nearly four feet long and weighing fifty pounds (WC 22) | None | Quest required: GREATSHIELD_QUEST (Master Mechanic) |
| oxblood vial | 236 | 'This slender glass vial is approximately four inches long. (WC 10) | 192 | DB: Vials |
| Padding | 1379 | A fluffy feathery down padding. | 3000 | Unknown |
| peach | 52 | A fine coat of hair covers this cute orange peach. (WC -2) | 30 | DB: Ye Olde Doughnut Shoppe |
| peach doughnut | 136 | 'This popular pastry is filled with a peach jelly (WC -50) | 20 | DB: Doughnuts, Ye Olde Doughnut Shoppe |
| peach mush | 382 | A collection of mashed peaches stain up the clay bowl which encloses them. (WC -4) | 70 | Unknown |
| pearl monolith | 543 | 'A vast tower of milky stone | None | Unknown |
| Pearled Averter | 539 | 'A white behemoth (WC 400) | None | Unknown |
| piece of the skyblade | 488 | 'The upper half of a gleaming blade of metal. (WC 65) | 3500 | Quest required: SULPHAX_THE_RED (King Edger) |
| pile of cryl | 390 | 'A collection of coins | None | Unknown |
| pile of fresh muck | 269 | 'Fresh muck | 10 | Unknown |
| pink vial | 313 | 'A long slender vial | 50 | Unknown |
| plague ball | 267 | 'A ball of putrid muck and bits of diseased flesh. | 500 | Unknown |
| planar clock | 287 | 'This clock\'s design resembles much of the modern clocky-clock frame | None | Unknown |
| poisoned dart | 501 | 'A slender dart (WC 3) | 200 | DB: Vastis: Weapons |
| poleaxe | 695 | 'Like most axes (WC 30) | 300 | Unknown |
| portable teleporter | 972 | A small hexagon shaped box with many inscriptions on the side. | 3000 | DB: Emporium |
| potion of defense | 393 | 'A wide rimmed beaker | 75 | Unknown |
| potion of deftness | 396 | 'A slender tube-like vial | 75 | Unknown |
| potion of healing | 392 | 'Labeled as a potion of healing | 160 | Unknown |
| potion of hearing | 1141 | 'This small potion is contained in a ceramic vial which is around an inch long. (WC 5) | 2000 | Unknown |
| potion of remedy | 1144 | This small wide vial is filled with a colorless liquid. (WC 5) | 2000 | Unknown |
| potion of replenishment | 1143 | The murky sludge contained in this vial has a very thick consistency and is light brown in color. (WC 5) | 1000 | Unknown |
| potion of stealth | 1145 | this glass bottle has a glass lid and contains a colorless liquid. (WC 5) | 4000 | DB: Wanda\ |
| potion of strength | 395 | 'A corked vial of blue liquid | 75 | Unknown |
| potion of vision | 1140 | 'This simple potion is contained in a dark blue glass bottle. (WC 5) | 3500 | DB: Wanda\ |
| potion of vitalization | 391 | 'This small vial contains a sparkling liquid | 175 | Unknown |
| potion of wisdom | 394 | 'An oval flask | 75 | Unknown |
| pound of chocolate | 141 | A mouthwatering brick of pure chocolate lies before you. (WC 7) | 100 | DB: Doughnuts, Ye Olde Doughnut Shoppe |
| pound of flour | 139 | A white powder is enclosed within a medium-sized plastic sack. (WC 5) | 100 | DB: Doughnuts |
| pound of sugar | 140 | Millions of clear crystals are enclosed within a medium-sized plastic sack. (WC 5) | 100 | DB: Doughnuts |
| preservation solution | 988 | 'This holds a small bottle of solution | None | Quest required: ADAMANT_QUEST (Baine) |
| proboscis | 131 | 'The funnel shape tapers off to a very narrow tube that serves two purposes: first to puncture the skin of the victim (WC int(5 + rand(5) | 5 | Unknown |
| Pufferfish | 834 | ' The Pufferfish has a rotund body (WC 80 | AC 130 | Stats: DMEN 200) | None | DB: Sea Bed |
| pulse carbine | 614 | 'A stubby (WC 34) | 400 | Unknown |
| pumpkin | 933 | In your hot little hand is a sparkly glowing orange plastic pumpkin container. | None | Unknown |
| quartz dust | 1108 | This is a fine bag of quartz dust. | 2750 | Unknown |
| Quartz Elemental | 404 | 'This elemental is crafted from rose-hued quartz (WC 110 | AC 100) | None | DB: Vastis: Crystal 3 |
| quartz orb | 381 | 'A pure lump of quartz (WC int(12 + rand(2 | KJ 2000) | 500 | Unknown |
| quiet avenger | 340 | 'This small rod provides for swift (WC int(5 + rand(10) | 540 | DB: Treehouse: Kreaph Store |
| race-change certificate | 1149 | "This certificate entitles the holder to change their race under the restrictions given by Morbis. | 500 | Unknown |
| Rattle Snake | 1080 | This deadly snake warns its enemies of its attack by rattling its tail. (WC 115 | AC 30) | None | Unknown |
| razor blade | 175 | This gleaming piece of sharp metel appears to be capable of slicing off a body part in one stroke. | 20 | Unknown |
| red earthstone | 528 | 'A reddish stone | 20 | Unknown |
| red tome | 523 | 'A leather bound tome | 15000 | Unknown |
| reeker | 535 | 'A slender tube | 125 | Unknown |
| ribsticka | 359 | 'A long spear (WC 38) | 300 | Unknown |
| ripped pouch | 904 | 'A small sack | 5000 | Unknown |
| rokil | 1026 | 'The hilt of this magnificent shortsword is crafted of etched titanium. (WC 45) | 1000 | Unknown |
| rolled parchment | 214 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 215 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 216 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 217 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 1284 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 1285 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 1286 | "A yellowed parchment | 100 | Unknown |
| rolled parchment | 1287 | "A yellowed parchment | 100 | Unknown |
| rosewood wand | 467 | 'Barely a foot long | 400 | Unknown |
| rough piece of obisdian | 899 | This rough obsidian was formed in a hot lava flow. | 1 | Quest required: OBSIDIAN_BLADE_QUEST (Obsidian Protector) |
| rounded diamond | 408 | 'A diamond | 1000 | Unknown |
| ruby dust | 1110 | This is a fine bag of ruby dust. | 2750 | Unknown |
| ruby orb | 338 | 'The ruby red surface of this orb gleams with magical and technological energies. (WC int(12 + rand(2 | KJ 2000) | 500 | Unknown |
| russet vial | 144 | A bubbling brownish-red sludge dominates the interior of the glass vial. (WC 5) | 250 | DB: Vials |
| rusted dagger | 612 | 'Long exposed to the elements (WC 18) | 100 | Unknown |
| rusted sprocket | 631 | 'A small sprocket | 100 | Quest required: GREATSHIELD_QUEST (Master Mechanic) |
| rusty cabinet | 39 | "The filing cabinet is about three and a half feet tall | 1 | Unknown |
| rusty padlock | 848 | 'The mechanics of this padlock has long since rusted away | None | Unknown |
| salmon vial | 201 | A bubbling pink potion is contained within this oblong vial. (WC 5) | 560 | DB: Vials |
| sapphire dust | 1109 | This is a fine bag of sapphire dust. | 2750 | Unknown |
| Sapphire Elemental | 401 | 'A hulking elemental of pure sapphire (WC 90 | Stats: MMEN 500) | None | DB: Vastis: Crystal 4 |
| sapphire orb | 380 | 'A deep blue orb (WC int(12 + rand(2 | KJ 2000) | 500 | Unknown |
| Saprin | 97 | 'Saprin\'s cold blue eyes are bulbously large | None | Unknown |
| Scarab Amulet | 1071 | A large amulet in the shape of a beetle. | 600 | Unknown |
| set of wires | 164 | 'A small handful of multicolored wires (KJ 100) | 300 | Unknown |
| sewing machine | 300 | 'This useful machine can be used for many a mending needs. | 2500 | Unknown |
| Shade Conservator | 351 | 'A towering silhouette (WC 220) | None | Unknown |
| Shadow Assassin | 207 | 'Cloaked in the deepest of living shadows (WC 150 | AC 150 | Stats: STAT_NPC_DEATHS_TOTAL 180, STAT_PLR_KILLS_TODAY 180, STAT_PLR_KILLS_TOTAL 180, STAT_PLR_DEATHS_TODAY 200, STAT_PLR_DEATHS_TOTAL 180, STAT_SWINGS_TODAY 180, STAT_SWINGS_TOTAL 180, STAT_BESTHIT_TODAY 180, STAT_BESTHIT_OVERALL 180, STAT_MISSES_TODAY 200, STAT_MISSES_TOTAL 200, STAT_EXPERTS_TODAY 150, STAT_EXPERTS_TOTAL 150, STAT_CASTS_TODAY 100, STAT_CASTS_TOTAL 100, STAT_FAILS_TODAY 80, STAT_FAILS_TOTAL 180) | None | DB: Spectral Dragon |
| Shadow Mage | 208 | 'Master of shadow magic (WC 120 | AC 120 | Stats: STAT_NPC_DEATHS_TOTAL 180, STAT_PLR_KILLS_TODAY 180, STAT_PLR_KILLS_TOTAL 180, STAT_PLR_DEATHS_TODAY 150, STAT_PLR_DEATHS_TOTAL 200, STAT_SWINGS_TODAY 200, STAT_SWINGS_TOTAL 200, STAT_BESTHIT_TODAY 180, STAT_BESTHIT_OVERALL 180, STAT_MISSES_TODAY 125, STAT_MISSES_TOTAL 125, STAT_EXPERTS_TODAY 125, STAT_EXPERTS_TOTAL 125, STAT_CASTS_TODAY 100, STAT_CASTS_TOTAL 175, STAT_FAILS_TODAY 175, STAT_FAILS_TOTAL 200) | None | DB: Spectral Dragon |
| Shadow Thing | 307 | 'A horrible mutation (Stats: STAT_NPC_DEATHS_TOTAL 100, STAT_PLR_KILLS_TODAY 100, STAT_PLR_KILLS_TOTAL 100, STAT_PLR_DEATHS_TODAY 100, STAT_PLR_DEATHS_TOTAL 100, STAT_SWINGS_TODAY 100, STAT_SWINGS_TOTAL 100, STAT_BESTHIT_TODAY 100, STAT_BESTHIT_OVERALL 100, STAT_MISSES_TODAY 100, STAT_MISSES_TOTAL 100, STAT_EXPERTS_TODAY 100, STAT_EXPERTS_TOTAL 100, STAT_CASTS_TODAY 100, STAT_CASTS_TOTAL 100, STAT_FAILS_TODAY 100, STAT_FAILS_TOTAL 100) | None | Unknown |
| shadowed monolith | 542 | 'Blotting out the sky like a dark cloud | None | Unknown |
| shark tooth | 847 | This long white razor-sharp shark\'s tooth is incredibly sharp. (WC 20) | 1400 | Unknown |
| sharpened handaxe | 345 | 'A nasty handaxe (WC 25) | 160 | Unknown |
| Shifty-eyed beggar | 1372 | 'A man sits crouched (WC 200 | Stats: DPHY 1250, DENE 1250, DMEN 1250, MOFF 1250, MDEF 1250, MELE 1250, MMEN 1250, SUPP 1250, SLOW 1250, AUPP 1250, ALOW 1250, KMEC 1250, KCOM 1250, KMED 1250, KSOC 1250, CAPP 1250, CATT 1250) | None | DB: East Road, West Road |
| shortsword | 65 | 'The shortsword looks hastily crafted with a common iron base (WC 15) | None | Unknown |
| shortsword of vapors | 212 | 'The hilt of this magnificent shortsword is crafted of etched mithril. (WC 75) | 8000 | Unknown |
| shruggle | 1259 | 'A brilliant dagger (WC 60) | 2200 | Unknown |
| skeleton bone | 130 | 'This club-like weapon is obviously made of bone (WC int(7 + rand(5) | 2 | Unknown |
| sledge hammer | 72 | 'An anvil-like block of iron firmly attached to a long (WC int(80 + rand(40 | KJ 10) | 350 | Unknown |
| slot machine | 66 | The simple-looking machine has several slots in which money may be put. | 10 | Unknown |
| small pile of cryl | 387 | 'A collection of coins | None | Unknown |
| small quartz | 409 | 'This piece of quartz in rose colored | 275 | Unknown |
| smelly paste | 564 | 'A glob of yellowish paste. | 20 | Unknown |
| smooth disc | 213 | 'This small round disc is perhaps half a foot across. (KJ 500) | 800 | Quest reward: ELDAR_NOBLEWOMAN (Eldar Noblewoman) |
| Snow White Feather | 1374 | A beautful pure white feather. | 1000 | Unknown |
| sonic bolt repeater | 616 | 'A long (WC 54) | 1600 | Unknown |
| sonic grenade | 639 | 'About the size of a softball (KJ 100000) | 800 | Unknown |
| sonic rifle | 615 | 'A black rifle (WC 44) | 700 | Unknown |
| sparkling topaz | 823 | 'A topaz with an amazingly deep color | 1300 | Quest required: DRAGON_GUARD_QUEST (Ergin) |
| spear | 68 | 'A razor-sharp blade tops this long (WC int(20 + rand(10 | KJ 1000) | 150 | Unknown |
| Spectral Chakram | 1354 | TEST (WC 180 | Stats: DPHY 0, SUPP 15, SLOW 15, AUPP 15, ALOW 15) | 5000 | Unknown |
| Spectral Chest | 1386 | A simple box with a round lid sits in front of you. | None | Unknown |
| Spectral Dragon | 206 | 'The spectral dragon lies sprawled out inside his cramped throne room (WC 250 | AC 300 | Stats: STAT_NPC_DEATHS_TOTAL 225, STAT_PLR_KILLS_TODAY 225, STAT_PLR_KILLS_TOTAL 225, STAT_PLR_DEATHS_TODAY 225, STAT_PLR_DEATHS_TOTAL 225, STAT_SWINGS_TODAY 225, STAT_SWINGS_TOTAL 225, STAT_BESTHIT_TODAY 225, STAT_BESTHIT_OVERALL 225, STAT_MISSES_TODAY 250, STAT_MISSES_TOTAL 225, STAT_EXPERTS_TODAY 250, STAT_EXPERTS_TOTAL 225, STAT_CASTS_TODAY 275, STAT_CASTS_TOTAL 250, STAT_FAILS_TODAY 200, STAT_FAILS_TOTAL 250) | None | DB: Spectral Dragon |
| Spectral Guard | 1389 | 'A shadowy guard standing eight feet tall (WC 185 | Stats: DPHY 1000, DENE 750, DMEN 750, MOFF 1000, MDEF 750, MELE 1000, MMEN 1000, SUPP 1000, SLOW 1000, AUPP 1000, ALOW 1000, KMEC 1000, KCOM 1000, KMED 1000, KSOC 1000, CAPP 1000, CATT 1000) | None | DB: Court Yard |
| Spectral Longsword | 1353 | TEST (WC 140 | Stats: DPHY 50, SUPP 50) | 50 | Unknown |
| Spectral Transplanter | 1299 | 'A towering silhouette (WC 1000) | None | Unknown |
| Spectral Watch | 1390 | 'A shadowy guard standing eight feet tall (WC 185 | Stats: DPHY 1000, DENE 1500, DMEN 1500, MOFF 500, MDEF 1500, MELE 500, MMEN 1000, SUPP 1000, SLOW 1000, AUPP 1000, ALOW 1000, KMEC 1000, KCOM 1000, KMED 1000, KSOC 1000, CAPP 1000, CATT 500) | None | DB: Court Yard |
| Spectrite Citizen | 1013 | 'Spectrites are humanoid in form (WC 125 | AC 550 | Stats: MMEN 650, MOFF 200, DPHY 300, DMEN 300) | None | DB: City of Outcasts |
| sphere of disorientation | 708 | 'A large orb | None | Unknown |
| spherule orb | 1117 | 'The surface of this orb gleams in shades of turqoise | 5000 | Unknown |
| staff of the storm | 235 | 'This staff is shining with a light so bright that you can barely look at it. | 4800 | Unknown |
| staff of tree-talking | 18 | 'This staff is approximately four and a half feet long (WC 3 | KJ 3000) | 750 | DB: Academy Supply Shop |
| stained shortsword | 124 | A short blade of nicked and dirty steel and a handle of the same quality comprise this weapon of the outcasts. (WC int(8 + rand(2) | 10 | Unknown |
| stamped chain link | 636 | 'A cheap piece of drivechain link | 100 | Quest required: GREATSHIELD_QUEST (Master Mechanic) |
| starfire jewel | 541 | 'A brilliantly flashing jewel | 1500 | Unknown |
| Starved Vampire | 158 | 'Dressed in black tattered clothing | None | Unknown |
| statuette of a griffon | 490 | 'A tiny stone statue | 20000 | Quest reward: SULPHAX_THE_RED (King Edger) |
| steel longsword | 500 | 'This well-balanced blade is four and a half feet long. (WC 35) | 350 | DB: Vastis: Weapons |
| stick of dynamite | 168 | A tightly packed case of gunpowder. (KJ 20000) | 900 | Unknown |
| sturdy golden handle | 983 | This lock is a large golden lock which has been wonderfully mended so it is as good as new. | 8000 | Unknown |
| super-duper planar clock | 540 | 'This clock\'s design resembles much of the modern clocky-clock frame | None | Unknown |
| super-sized insta-salp | 587 | 'A large (WC 1) | 1000 | Unknown |
| Swamp Leech | 304 | 'A long slug-like creature (Stats: STAT_NPC_DEATHS_TOTAL 1, STAT_PLR_KILLS_TODAY 1, STAT_PLR_KILLS_TOTAL 1, STAT_PLR_DEATHS_TODAY 1, STAT_PLR_DEATHS_TOTAL 1, STAT_SWINGS_TODAY 1, STAT_SWINGS_TOTAL 1, STAT_BESTHIT_TODAY 1, STAT_BESTHIT_OVERALL 1, STAT_MISSES_TODAY 50, STAT_MISSES_TOTAL 50, STAT_EXPERTS_TODAY 50, STAT_EXPERTS_TOTAL 50, STAT_CASTS_TODAY 75, STAT_CASTS_TOTAL 50, STAT_FAILS_TODAY 25, STAT_FAILS_TOTAL 1) | None | DB: OrcSwamps: Water |
| tadet | 192 | 'With only a tiny wick to trigger its explosive contents (KJ 1000000) | 30 | Unknown |
| taflare | 48 | 'The taflare is relatively small (KJ 4000) | 30 | DB: Bloodbath and Beyond |
| tamount | 49 | 'Tamount resembles a huge box with a stick in the corner (KJ 500000) | 2000 | DB: Bloodbath and Beyond |
| tanspot | 2 | This tanspot is appended with carefully-prepared instructions: "Do not eat. | 200 | DB: Bloodbath and Beyond |
| tassalfolx | 686 | 'With only a tiny wick to trigger its explosive contents (KJ 200_000_000) | 30 | Unknown |
| tasstick | 3 | 'The tasstick seems to have been crafted carefully with an outer shell to prevent accidental explosions. | 150 | DB: Bloodbath and Beyond |
| tasty worm | 971 | 'This tasty work is a small pink worm (WC -300) | 50 | DB: Emporium |
| tatertot | 583 | 'With only a tiny wick to trigger its explosive contents (KJ 2000000) | 30 | Unknown |
| tendrelian battleplan | 1007 | This is a large piece of paper with a layout of an attack plan. (AC 0 | Stats: AUPP 10, KCOM 10) | 0 | Quest required: HASTE_AMULET_QUEST (Mayor of Outcast City) |
| tendrelian noble ring | 1004 | A plain steel ring with the Tendrelian Noble Families crest on it. (AC 0 | Stats: AUPP 10, KCOM 10) | 0 | Quest required: HASTE_AMULET_QUEST (Mayor of Outcast City) |
| timer | 171 | A small digital clock used to set off explosives after a preset interval. (KJ 100) | 2500 | Unknown |
| Tiny Tuna | 845 | 'This baby tuna fish look very young and tender. | 250 | DB: Sea Bed |
| tome of palingenesis | 632 | 'A massive book | 10000 | Unknown |
| topaz dust | 1105 | This is a fine bag of topaz dust. | 2750 | Unknown |
| Transparent Guard | 534 | 'A gloomy disposition dominates the features of this ghostly guardian (WC 170 | AC 180 | Stats: DMEN 1000) | None | DB: Vastis: Eastland |
| triangular decay | 1262 | 'Slender and light (WC 70) | 3500 | Unknown |
| Tribal Maiden | 793 | This maiden is very fair and beautiful. (WC 50 | AC 150) | None | DB: Copeland: Forgotten Tribe |
| trimoral suffering | 1250 | This massive onyx blade gleams in the dim light giving off its own particularly evil glow. (WC 10) | 3000 | Unknown |
| turquoise dust | 1111 | This is a fine bag of turquoise dust. | 2750 | Unknown |
| turquoise orb | 135 | 'The greenish-blue surface of this turquoise orb gleams with magical and technological energies. (WC int(12 + rand(2 | KJ 2000) | 500 | Unknown |
| tv dinner | 685 | 'Sitting before you is perhaps the most appetizing television you have ever seen. (WC .0001 | AC 0) | 100 | Unknown |
| twisted branch | 343 | 'This branch seems to have recently been broken off from one of the local swamp trees. (WC 8) | None | DB: OrcSwamps: Level 1-Twoheaded Forest |
| two by four | 71 | A piece of lumber specially designed for use in beatings. (WC int(25 + rand(10 | KJ 1000) | 100 | Unknown |
| two-handed azrite broadsword | 738 | 'This balanced blade is six and a half feet long. (WC 63) | 1500 | Unknown |
| tyrian twin flail | 1066 | This Large flail has two spiked balls attached by like tyrite chains. (WC 53) | 600 | Unknown |
| tyrite claws | 1067 | 'These claws are made of the famous metal mined in Tyrenin (WC 44) | 400 | Unknown |
| uq range-extender | 578 | 'This ultra-quality broadcasting unit widens your broadcast channel range to a maximum channel of 100 (WC 0 | AC 0) | 8000 | DB: The Blinking Diode |
| Vampire Bat | 905 | 'This tiny creature has a very small body (WC 100 | AC 60) | None | DB: Catacombs: Pitch Black |
| vermilion vial | 147 | Orange particles dance around this abnormally large vial. (WC 5) | 890 | DB: Vials |
| vexian broadsword | 449 | 'A large sword (WC 38) | 325 | Unknown |
| vexian lance | 454 | 'A lance (WC 53) | 3500 | Unknown |
| vexian spear | 440 | 'A wooden spear (WC 45) | 1250 | Unknown |
| vial of monster lure | 266 | 'Thick sludge rolls around in this fragile vial | 850 | Unknown |
| vindicator tapestry | 961 | 'Hill Vindicator: This tall tree-like being is well hidden from the predators that roam around this area. (AC 20) | 0 | Unknown |
| vocal enhancer | 1142 | This bright green liquid is quietly bubbling away on its own in this slender vial. (WC 5) | 2000 | Unknown |
| voice analyzer | 22 | 'The voice analyzer looks as if it has been here for centuries | None | Unknown |
| vornine blade | 264 | 'This magnificent blade appears to be very valuable (KJ 500) | 21000 | Unknown |
| wabble mallet | 559 | 'A heavy wooden mallet (WC 20) | 67 | Unknown |
| Wandering Gypsy | 160 | 'This ancient woman is dressed in an assortment of fine silks (Stats: STAT_NPC_DEATHS_TOTAL 20, STAT_PLR_KILLS_TODAY 20, STAT_PLR_KILLS_TOTAL 20, STAT_PLR_DEATHS_TODAY 20, STAT_PLR_DEATHS_TOTAL 65, STAT_SWINGS_TODAY 65, STAT_SWINGS_TOTAL 65, STAT_BESTHIT_TODAY 20, STAT_BESTHIT_OVERALL 60, STAT_MISSES_TODAY 8, STAT_MISSES_TOTAL 8, STAT_EXPERTS_TODAY 7, STAT_EXPERTS_TOTAL 7, STAT_CASTS_TODAY 10, STAT_CASTS_TOTAL 10, STAT_FAILS_TODAY 40, STAT_FAILS_TOTAL 65) | None | Unknown |
| whip of tangled barbed wires | 277 | 'Several metal wires lined with tiny barbs have been woven together into a rope-like whip. (WC 48) | 3000 | Unknown |
| white tome | 1096 | 'This well bound tome is totally white in colour | 2900 | Unknown |
| wolf teeth | 132 | 'No longer the shining white they once must have been (WC int(7 + rand(5) | 4 | Unknown |
| wooden spear | 735 | 'A simple wooden spear. (WC 62) | 1000 | Unknown |
| wooden splinter | 734 | 'A petrified splinter of wood from the massive tree (WC 30) | 50000 | Unknown |
| wooden stick | 142 | 'Judging from the toothmarks and rugged stains (WC -8) | 4 | Unknown |
| yellow tome | 525 | 'An ancient tome | 1250 | Unknown |
| zeode shard | 417 | 'A shard of brightly colored crystal. | 2500 | Unknown |
| zeode staff | 418 | 'A staff (WC 65) | 10000 | Unknown |

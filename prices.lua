-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

-- Prices List
local prices = {
	-----------------------------
	-------- Molten Core --------
	-----------------------------
	[16665] = { 65, "Tome of Tranquilizing Shot", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16795] = { 0, "Arcanist Crown", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16796] = { 65, "Arcanist Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16797] = { 65, "Arcanist Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16798] = { 86, "Arcanist Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16799] = { 43, "Arcanist Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16800] = { 65, "Arcanist Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16801] = { 65, "Arcanist Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16802] = { 43, "Arcanist Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16803] = { 65, "Felheart Slippers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16804] = { 43, "Felheart Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16805] = { 65, "Felheart Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16806] = { 43, "Felheart Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16807] = { 65, "Felheart Shoulder Pads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16808] = { 65, "Felheart Horns", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16809] = { 86, "Felheart Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16810] = { 65, "Felheart Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16811] = { 65, "Boots of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16812] = { 65, "Gloves of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16813] = { 65, "Circlet of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16814] = { 65, "Pants of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16815] = { 86, "Robes of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16816] = { 65, "Mantle of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16817] = { 43, "Girdle of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16819] = { 43, "Vambraces of Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16820] = { 86, "Nightslayer Chestpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16821] = { 65, "Nightslayer Cover", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16822] = { 65, "Nightslayer Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16823] = { 65, "Nightslayer Shoulder Pads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16824] = { 65, "Nightslayer Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16825] = { 43, "Nightslayer Bracelets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16826] = { 65, "Nightslayer Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16827] = { 43, "Nightslayer Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16828] = { 43, "Cenarion Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16829] = { 65, "Cenarion Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16830] = { 43, "Cenarion Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16831] = { 65, "Cenarion Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16833] = { 86, "Cenarion Vestments", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16834] = { 65, "Cenarion Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16835] = { 65, "Cenarion Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16836] = { 65, "Cenarion Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16837] = { 65, "Earthfury Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16838] = { 43, "Earthfury Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16839] = { 65, "Earthfury Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16840] = { 43, "Earthfury Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16841] = { 86, "Earthfury Vestments", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16842] = { 65, "Earthfury Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16843] = { 65, "Earthfury Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16844] = { 65, "Earthfury Epaulets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16845] = { 86, "Giantstalker's Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16846] = { 65, "Giantstalker's Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16847] = { 65, "Giantstalker's Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16848] = { 65, "Giantstalker's Epaulets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16849] = { 65, "Giantstalker's Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16850] = { 43, "Giantstalker's Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16851] = { 43, "Giantstalker's Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16852] = { 65, "Giantstalker's Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16853] = { 86, "Lawbringer Chestguard", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16854] = { 65, "Lawbringer Helm", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16855] = { 65, "Lawbringer Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16856] = { 65, "Lawbringer Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16857] = { 43, "Lawbringer Bracers", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee"}, ["phase"] = 1 };
	[16858] = { 43, "Lawbringer Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16859] = { 65, "Lawbringer Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16860] = { 65, "Lawbringer Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16861] = { 43, "Bracers of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16862] = { 65, "Sabatons of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16863] = { 65, "Gauntlets of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16864] = { 43, "Belt of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16865] = { 86, "Breastplate of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16866] = { 65, "Helm of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16867] = { 65, "Legplates of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16868] = { 65, "Pauldrons of Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16901] = { 100, "Stormrage Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16909] = { 150, "Bloodfang Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16915] = { 150, "Netherwind Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16922] = { 150, "Leggings of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16930] = { 150, "Nemesis Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16938] = { 150, "Dragonstalker's Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16946] = { 96, "Legplates of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16954] = { 100, "Judgement Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 1 };
	[16962] = { 150, "Legplates of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17063] = { 346, "Band of Accuria", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };
	[17065] = { 194, "Medallion of Steadfast Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17066] = { 130, "Drillborer Disk", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17069] = { 288, "Striker's Mark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17071] = { 0, "Gutgore Ripper", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17072] = { 119, "Blastershot Launcher", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17073] = { 65, "Earthshaker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17074] = { 0, "Shadowstrike", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17076] = { 158, "Bonereaver's Edge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17077] = { 0, "Crimson Shocker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17082] = { 0, "Shard of the Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17102] = { 108, "Cloak of the Shrouded Mists", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17103] = { 202, "Azuresong Mageblade", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[17104] = { 108, "Spinal Reaper", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17105] = { 119, "Aurastone Hammer", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[17106] = { 0, "Malistar's Defender", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[17107] = { 86, "Dragon's Blood Cape", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17109] = { 43, "Choker of Enlightenment", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17110] = { 43, "Seal of the Archmagus", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17204] = { 0, "Eye of Sulfuras", ["class"] = { "Warrior", "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[18203] = { 86, "Eskhandar's Right Claw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18563] = { 250, "Bindings of the Windseeker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18564] = { 250, "Bindings of the Windseeker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18646] = { 0, "The Eye of Divinity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18703] = { 0, "Ancient Petrified Leaf", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18803] = { 65, "Finkle's Lava Dredger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18805] = { 230, "Core Hound Tooth", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18806] = { 22, "Core Forged Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18808] = { 0, "Gloves of the Hypnotic Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18809] = { 86, "Sash of Whispered Secrets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18810] = { 259, "Wild Growth Spaulders", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[18811] = { 0, "Fireproof Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18812] = { 151, "Wristguards of True Flight", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18814] = { 302, "Choker of the Fire Lord", ["class"] = { "Paladin", "Shaman", "Druid", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[18815] = { 0, "Essence of the Pure Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18816] = { 288, "Perdition's Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18817] = { 216, "Crown of Destruction", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18820] = { 259, "Talisman of Ephemeral Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18821] = { 259, "Quick Strike Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[18822] = { 65, "Obsidian Edged Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18823] = { 86, "Aged Core Leather Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18824] = { 43, "Magma Tempered Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18829] = { 108, "Deep Earth Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18832] = { 173, "Brutality Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18842] = { 130, "Staff of Dominance", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18861] = { 0, "Flamewaker Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18870] = { 43, "Helm of the Lifegiver", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18872] = { 0, "Manastorm Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18875] = { 227, "Salamander Scale Pants", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[18878] = { 86, "Sorcerous Dagger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18879] = { 162, "Heavy Dark Iron Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19136] = { 202, "Mana Igniting Cord", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19137] = { 346, "Onslaught Girdle", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };
	[19138] = { 0, "Band of Sulfuras", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19139] = { 0, "Fireguard Shoulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19140] = { 202, "Cauterizing Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[19142] = { 65, "Fire Runed Grimoire", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19143] = { 101, "Flameguard Gauntlets", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };
	[19144] = { 65, "Sabatons of the Flamewalker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19145] = { 302, "Robe of Volatile Power", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[19146] = { 58, "Wristguards of Stability", ["class"] = { "Warrior", "Paladin", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[19147] = { 202, "Ring of Spell Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	--------------------------------
	-------- Outdoor Bosses --------
	--------------------------------
	[16900] = { 100, "Stormrage Cover", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16908] = { 150, "Bloodfang Hood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16914] = { 100, "Netherwind Crown", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16921] = { 150, "Halo of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16929] = { 100, "Nemesis Skullcap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16939] = { 150, "Dragonstalker's Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16947] = { 120, "Helmet of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[16955] = { 100, "Judgement Crown", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 1 };
	[16963] = { 100, "Helm of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17064] = { 234, "Shard of the Scale", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[17067] = { 54, "Ancient Cornerstone Grimoire", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17068] = { 144, "Deathbringer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17070] = { 162, "Fang of the Mystics", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[17075] = { 108, "Vis'kag the Bloodletter", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17078] = { 90, "Sapphiron Drape", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[17111] = { 72, "Blazefury Medallion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[17112] = { 90, "Empyrean Demolisher", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[17113] = { 108, "Amberseal Keeper", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18202] = { 90, "Eskhandar's Left Claw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18204] = { 54, "Eskhandar's Pelt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18205] = { 72, "Eskhandar's Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18208] = { 54, "Drape of Benediction", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18403] = { 216, "Dragonslayer's Signet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18404] = { 216, "Onyxia Tooth Pendant", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee", "Caster" }, ["phase"] = 1 };
	[18406] = { 216, "Onyxia Blood Talisman", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18422] = { 0, "Head of Onyxia", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18423] = { 216, "Head of Onyxia", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18541] = { 234, "Puissant Cape", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18542] = { 54, "Typhoon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18543] = { 54, "Ring of Entropy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18544] = { 90, "Doomhide Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18545] = { 18, "Leggings of Arcane Supremacy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18546] = { 108, "Infernal Headcage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18547] = { 18, "Unmelting Ice Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[18665] = { 0, "The Eye of Shadow", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1};
	[18704] = { 0, "Mature Blue Dragon Sinew", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18705] = { 0, "Mature Black Dragon Sinew", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[18813] = { 18, "Ring of Binding", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 1 };
	[19130] = { 207, "Cold Snap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[19131] = { 252, "Snowblind Shoes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[19132] = { 270, "Crystal Adorned Crown", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 2 };
	[19133] = { 243, "Fel Infused Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[19134] = { 72, "Flayed Doomguard Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[19135] = { 54, "Blacklight Bracer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 2};
	[20577] = { 162, "Nightmare Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20578] = { 162, "Emerald Dragonfang", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20579] = { 18, "Green Dragonskin Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20580] = { 144, "Hammer of Bestial Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20581] = { 180, "Staff of Rampant Growth", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20582] = { 90, "Trance Stone", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20599] = { 126, "Polished Ironwood Crossbow", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20600] = { 18, "Malfurion's Signet Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20615] = { 72, "Dragonspur Wraps", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20616] = { 72, "Dragonbone Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20617] = { 126, "Ancient Corroded Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20618] = { 180, "Gloves of Delusional Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20619] = { 18, "Acid Inscribed Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20621] = { 108, "Boots of the Endless Moor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20622] = { 90, "Dragonheart Necklace", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20623] = { 144, "Circlet of Restless Dreams", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20624] = { 108, "Ring of the Unliving", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20625] = { 18, "Belt of the Dark Bog", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20626] = { 90, "Black Bark Wristbands", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20627] = { 225, "Dark Heart Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20628] = { 243, "Deviate Growth Cap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20629] = { 54, "Malignant Footguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20630] = { 45, "Gauntlets of the Shining Light", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20631] = { 180, "Mendicant's Slippers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20632] = { 90, "Mindtear Band", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20633] = { 18, "Unnatural Leather Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20634] = { 108, "Boots of Fright", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20635] = { 162, "Jade Inlaid Vestments", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20636] = { 234, "Hibernation Crystal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20637] = { 18, "Acid Inscribed Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20638] = { 144, "Leggings of the Demented Mind", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20639] = { 54, "Strangely Glyphed Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	[20644] = { 18, "Nightmare Engulfed Object", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 4};
	--------------------------------
	-------- Blackwing Lair --------
	--------------------------------
	[16818] = { 100, "Netherwind Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16832] = { 100, "Bloodfang Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16897] = { 100, "Stormrage Chestguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16898] = { 150, "Stormrage Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16899] = { 150, "Stormrage Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16902] = { 100, "Stormrage Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16903] = { 100, "Stormrage Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16904] = { 150, "Stormrage Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16905] = { 150, "Bloodfang Chestpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16906] = { 100, "Bloodfang Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16907] = { 100, "Bloodfang Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16908] = { 150, "Bloodfang Hood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16910] = { 150, "Bloodfang Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16911] = { 150, "Bloodfang Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16912] = { 100, "Netherwind Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16913] = { 150, "Netherwind Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16916] = { 100, "Netherwind Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16917] = { 100, "Netherwind Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16918] = { 100, "Netherwind Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16919] = { 100, "Boots of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16920] = { 150, "Handguards of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16923] = { 150, "Robes of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16924] = { 150, "Pauldrons of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16925] = { 150, "Belt of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16926] = { 150, "Bindings of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16927] = { 100, "Nemesis Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16928] = { 100, "Nemesis Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16931] = { 150, "Nemesis Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16932] = { 100, "Nemesis Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16933] = { 150, "Nemesis Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16934] = { 100, "Nemesis Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16935] = { 150, "Dragonstalker's Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16936] = { 150, "Dragonstalker's Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16937] = { 150, "Dragonstalker's Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16940] = { 150, "Dragonstalker's Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16941] = { 150, "Dragonstalker's Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16942] = { 150, "Dragonstalker's Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16943] = { 84, "Bracers of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16944] = { 96, "Belt of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16945] = { 120, "Epaulets of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16948] = { 96, "Gauntlets of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16949] = { 96, "Greaves of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16950] = { 144, "Breastplate of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16951] = { 100, "Judgement Bindings", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16952] = { 100, "Judgement Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16953] = { 100, "Judgement Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16956] = { 100, "Judgement Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16957] = { 100, "Judgement Sabatons", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16958] = { 100, "Judgement Breastplate", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16959] = { 150, "Bracelets of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16960] = { 100, "Waistband of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16961] = { 100, "Pauldrons of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16964] = { 150, "Gauntlets of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16965] = { 150, "Sabatons of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[16966] = { 150, "Breastplate of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19002] = { 0, "Head of Nefarian", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19003] = { 156, "Head of Nefarian", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19334] = { 220, "The Untamed Blade", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19335] = { 96, "Spineshatter", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19336] = { 0, "Arcane Infused Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19337] = { 0, "The Black Book", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19339] = { 240, "Mind Quickening Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19340] = { 0, "Rune of Metamorphosis", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19341] = { 160, "Lifegiving Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19342] = { 0, "Venomous Totem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19343] = { 0, "Scrolls of Blinding Light", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19344] = { 0, "Natural Alignment Crystal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19345] = { 0, "Aegis of Preservation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19346] = { 144, "Dragonfang Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19347] = { 240, "Claw of Chromaggus", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19348] = { 160, "Red Dragonscale Protector", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[19349] = { 170, "Elementium Reinforced Bulwark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19350] = { 60, "Heartstriker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19351] = { 228, "Maladath, Runed Blade of the Black Flight", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19352] = { 288, "Chromatically Tempered Sword", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19353] = { 48, "Drake Talon Cleaver", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19354] = { 48, "Draconic Avenger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19355] = { 106, "Shadow Wing Focus Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19356] = { 372, "Staff of the Shadow Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19357] = { 48, "Herald of Woe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19358] = { 96, "Draconic Maul", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19360] = { 296, "Lok'amir il Romathis", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19361] = { 296, "Ashjre'thul, Crossbow of Smiting", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19362] = { 120, "Doom's Edge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19363] = { 216, "Crul'shorukh, Edge of Chaos", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19364] = { 192, "Ashkandi, Greatsword of the Brotherhood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19365] = { 120, "Claw of the Black Drake", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19366] = { 0, "Master Dragonslayer's Orb", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19367] = { 48, "Dragon's Touch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19368] = { 96, "Dragonbreath Hand Cannon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19369] = { 0, "Gloves of Rapid Evolution", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19370] = { 252, "Mantle of the Blackwing Cabal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19371] = { 0, "Pendant of the Fallen Dragon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19372] = { 156, "Helm of Endless Rage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19373] = { 0, "Black Brood Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19374] = { 280, "Bracers of Arcane Accuracy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19375] = { 325, "Mish'undare, Circlet of the Mind Flayer", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19376] = { 60, "Archimtiros' Ring of Reckoning", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19377] = { 248, "Prestor's Talisman of Connivery", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19378] = { 84, "Cloak of the Brood Lord", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19379] = { 482, "Neltharion's Tear", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19380] = { 0, "Therazane's Link", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19381] = { 156, "Boots of the Shadow Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19382] = { 324, "Pure Elementium Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19383] = { 0, "Master Dragonslayer's Medallion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19384] = { 0, "Master Dragonslayer's Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19385] = { 300, "Empowered Leggings", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19386] = { 96, "Elementium Threaded Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19387] = { 252, "Chromatic Boots", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 3 };
	[19388] = { 48, "Angelista's Grasp", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19389] = { 132, "Taut Dragonhide Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19390] = { 132, "Taut Dragonhide Gloves", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19390] = { 48, "Taut Dragonhide Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19391] = { 0, "Shimmering Geta", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19392] = { 0, "Girdle of the Fallen Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19393] = { 0, "Primalist's Linked Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19394] = { 216, "Drake Talon Pauldrons", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 3 };
	[19395] = { 425, "Rejuvenating Gem", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19396] = { 108, "Taut Dragonhide Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19397] = { 96, "Ring of Blackrock", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19398] = { 136, "Cloak of Firemaw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19399] = { 0, "Black Ash Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19400] = { 216, "Firemaw's Clutch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19401] = { 0, "Primalist's Linked Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19402] = { 226, "Legguards of the Fallen Crusader", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19403] = { 226, "Band of Forced Concentration", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19405] = { 180, "Malfurion's Blessed Bulwark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19406] = { 348, "Drake Fang Talisman", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19407] = { 192, "Ebony Flame Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19430] = { 96, "Shroud of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19431] = { 192, "Styleen's Impeding Scarab", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19432] = { 148, "Circle of Applied Force", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19433] = { 0, "Emberweave Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19434] = { 148, "Band of Dark Dominion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19435] = { 24, "Essence Gatherer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19436] = { 120, "Cloak of Draconic Might", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19437] = { 196, "Boots of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19438] = { 124, "Ringo's Blizzard Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[19439] = { 0, "Interlaced Shadow Jerkin", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	[20383] = { 0, "Head of the Broodlord Lashlayer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 3};
	----------------------
	-------- AQ40 --------
	----------------------
	[20926] = { 0, "Vek'nilash's Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20927] = { 0, "Ouro's Intact Hide", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20928] = { 0, "Qiraji Bindings of Command", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20929] = { 0, "Carapace of the Old God", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20930] = { 0, "Vek'lor's Diadem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20931] = { 0, "Skin of the Great Sandworm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20932] = { 0, "Qiraji Bindings of Dominance", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[20933] = { 0, "Husk of the Old God", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21126] = { 0, "Death's Sting", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21128] = { 0, "Staff of the Qiraji Prophets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21134] = { 0, "Dark Edge of Insanity", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21221] = { 0, "Eye of C'Thun", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21232] = { 0, "Imperial Qiraji Armaments", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21237] = { 0, "Imperial Qiraji Regalia", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21242] = { 0, "Blessed Qiraji War Axe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21244] = { 0, "Blessed Qiraji Pugio", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21268] = { 0, "Blessed Qiraji War Hammer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21269] = { 0, "Blessed Qiraji Bulwark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21272] = { 0, "Blessed Qiraji Musket", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21273] = { 0, "Blessed Qiraji Acolyte Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21275] = { 0, "Blessed Qiraji Augur Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21329] = { 0, "Conqueror's Crown", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21330] = { 0, "Conqueror's Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21331] = { 0, "Conqueror's Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21332] = { 0, "Conqueror's Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21333] = { 0, "Conqueror's Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21334] = { 0, "Doomcaller's Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21335] = { 0, "Doomcaller's Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21336] = { 0, "Doomcaller's Trousers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21337] = { 0, "Doomcaller's Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21338] = { 0, "Doomcaller's Footwraps", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21343] = { 0, "Enigma Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21344] = { 0, "Enigma Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21345] = { 0, "Enigma Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21346] = { 0, "Enigma Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21347] = { 0, "Enigma Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21348] = { 0, "Tiara of the Oracle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21349] = { 0, "Footwraps of the Oracle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21350] = { 0, "Mantle of the Oracle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21351] = { 0, "Vestments of the Oracle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21352] = { 0, "Trousers of the Oracle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21353] = { 0, "Genesis Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21354] = { 0, "Genesis Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21355] = { 0, "Genesis Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21356] = { 0, "Genesis Trousers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21357] = { 0, "Genesis Vest", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21359] = { 0, "Deathdealer's Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21360] = { 0, "Deathdealer's Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21361] = { 0, "Deathdealer's Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21362] = { 0, "Deathdealer's Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21364] = { 0, "Deathdealer's Vest", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21365] = { 0, "Striker's Footguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21366] = { 0, "Striker's Diadem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21367] = { 0, "Striker's Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21368] = { 0, "Striker's Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21370] = { 0, "Striker's Hauberk", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21372] = { 0, "Stormcaller's Diadem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21373] = { 0, "Stormcaller's Footguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21374] = { 0, "Stormcaller's Hauberk", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21375] = { 0, "Stormcaller's Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21376] = { 0, "Stormcaller's Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21387] = { 0, "Avenger's Crown", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21388] = { 0, "Avenger's Greaves", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21389] = { 0, "Avenger's Breastplate", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21390] = { 0, "Avenger's Legguards", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21391] = { 0, "Avenger's Pauldrons", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21579] = { 0, "Vanquished Tentacle of C'Thun", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21581] = { 0, "Gauntlets of Annihilation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21582] = { 0, "Grasp of the Old God", ["class"] = { "Paladin", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21583] = { 0, "Cloak of Clarity", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21585] = { 0, "Dark Storm Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21586] = { 0, "Belt of Never-ending Agony", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21596] = { 0, "Ring of the Godslayer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21597] = { 0, "Royal Scepter of Vek'lor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21598] = { 0, "Royal Qiraji Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21599] = { 0, "Vek'lor's Gloves of Devastation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21600] = { 0, "Boots of Epiphany", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21601] = { 0, "Ring of Emperor Vek'lor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21602] = { 0, "Qiraji Execution Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21603] = { 0, "Wand of Qiraji Nobility", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21604] = { 0, "Bracelets of Royal Redemption", ["class"] = { "Paladin", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21605] = { 0, "Gloves of the Hidden Temple", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21606] = { 0, "Belt of the Fallen Emperor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21607] = { 0, "Grasp of the Fallen Emperor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21608] = { 0, "Amulet of Vek'nilash", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21609] = { 0, "Regenerating Belt of Vek'nilash", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21610] = { 0, "Wormscale Blocker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21611] = { 0, "Burrower Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21615] = { 0, "Don Rigoberto's Lost Hat", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21616] = { 0, "Huhuran's Stinger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21617] = { 0, "Wasphide Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21618] = { 0, "Hive Defiler Wristguards", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21619] = { 0, "Gloves of the Messiah", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21620] = { 0, "Ring of the Martyr", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21621] = { 0, "Cloak of the Golden Hive", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21622] = { 0, "Sharpened Silithid Femur", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21623] = { 0, "Gauntlets of the Righteous Champion", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21624] = { 0, "Gauntlets of Kalimdor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21625] = { 0, "Scarab Brooch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21626] = { 0, "Slime-coated Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21627] = { 0, "Cloak of Untold Secrets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21635] = { 0, "Barb of the Sand Reaver", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21639] = { 0, "Pauldrons of the Unrelenting", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21645] = { 0, "Hive Tunneler's Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21647] = { 0, "Fetish of the Sand Reaver", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21648] = { 0, "Recomposed Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21650] = { 0, "Ancient Qiraji Ripper", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21651] = { 0, "Scaled Sand Reaver Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21652] = { 0, "Silithid Carapace Chestguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21663] = { 0, "Robes of the Guardian Saint", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21664] = { 0, "Barbed Choker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21665] = { 0, "Mantle of Wicked Revenge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21666] = { 0, "Sartura's Might", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21667] = { 0, "Legplates of Blazing Light", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21668] = { 0, "Scaled Leggings of Qiraji Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21669] = { 0, "Creeping Vine Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21670] = { 0, "Badge of the Swarmguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21671] = { 0, "Robes of the Battleguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21672] = { 0, "Gloves of Enforcement", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21673] = { 0, "Silithid Claw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21674] = { 0, "Gauntlets of Steadfast Determination", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21675] = { 0, "Thick Qirajihide Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21676] = { 0, "Leggings of the Festering Swarm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21677] = { 0, "Ring of the Qiraji Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21678] = { 0, "Necklace of Purity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21679] = { 0, "Kalimdor's Revenge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21680] = { 0, "Vest of Swift Execution", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21681] = { 0, "Ring of the Devoured", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21682] = { 0, "Bile-Covered Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21683] = { 0, "Mantle of the Desert Crusade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21684] = { 0, "Mantle of the Desert's Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21685] = { 0, "Petrified Scarab", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21686] = { 0, "Mantle of Phrenic Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21687] = { 0, "Ukko's Ring of Darkness", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21688] = { 0, "Boots of the Fallen Hero", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21689] = { 0, "Gloves of Ebru", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21690] = { 0, "Angelista's Charm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21691] = { 0, "Ooze-ridden Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21692] = { 0, "Triad Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21693] = { 0, "Guise of the Devourer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21694] = { 0, "Ternary Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21695] = { 0, "Angelista's Touch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21696] = { 0, "Robes of the Triumvirate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21697] = { 0, "Cape of the Trinity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21698] = { 0, "Leggings of Immersion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21699] = { 0, "Barrage Shoulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21700] = { 0, "Pendant of the Qiraji Guardian", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21701] = { 0, "Cloak of Concentrated Hatred", ["class"] = { "Warrior", "Paladin", "Rogue", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21702] = { 0, "Amulet of Foul Warding", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21703] = { 0, "Hammer of Ji'zhi", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21704] = { 0, "Boots of the Redeemed Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21705] = { 0, "Boots of the Fallen Prophet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21706] = { 0, "Boots of the Unwavering Will", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21707] = { 0, "Ring of Swarming Thought", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21708] = { 0, "Beetle Scaled Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21709] = { 0, "Ring of the Fallen God", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21710] = { 0, "Cloak of the Fallen God", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21712] = { 0, "Amulet of the Fallen God", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21814] = { 0, "Breastplate of Annihilation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21836] = { 0, "Ritssyn's Ring of Chaos", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21837] = { 0, "Anubisath Warhammer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21838] = { 0, "Garb of Royal Ascension", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21839] = { 0, "Scepter of the False Prophet", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21856] = { 0, "Neretzek, The Blood Drinker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21888] = { 0, "Gloves of the Immortal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21889] = { 0, "Gloves of the Redeemed Prophecy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[21891] = { 0, "Shard of the Fallen Star", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[22396] = { 0, "Totem of Life", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[22399] = { 0, "Idol of Health", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[22402] = { 0, "Libram of Grace", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[22730] = { 0, "Eyestalk Waist Cord", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[22731] = { 0, "Cloak of the Devoured", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[22732] = { 0, "Mark of C'Thun", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[23557] = { 0, "Larvae of the Great Worm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[23558] = { 0, "The Burrower's Shell", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	[23570] = { 0, "Jom Gabbar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 5};
	---------------------------
	-------- Naxxramas --------
	---------------------------
	[22349] = { 0, "Desecrated Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22350] = { 0, "Desecrated Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22351] = { 0, "Desecrated Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22352] = { 0, "Desecrated Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22353] = { 0, "Desecrated Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22354] = { 0, "Desecrated Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22355] = { 0, "Desecrated Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22356] = { 0, "Desecrated Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22357] = { 0, "Desecrated Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22358] = { 0, "Desecrated Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22359] = { 0, "Desecrated Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22360] = { 0, "Desecrated Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22361] = { 0, "Desecrated Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22362] = { 0, "Desecrated Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22363] = { 0, "Desecrated Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22364] = { 0, "Desecrated Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22365] = { 0, "Desecrated Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22366] = { 0, "Desecrated Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22367] = { 0, "Desecrated Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22368] = { 0, "Desecrated Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22369] = { 0, "Desecrated Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22370] = { 0, "Desecrated Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22371] = { 0, "Desecrated Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22372] = { 0, "Desecrated Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22416] = { 0, "Dreadnaught Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22417] = { 0, "Dreadnaught Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22418] = { 0, "Dreadnaught Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22419] = { 0, "Dreadnaught Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22420] = { 0, "Dreadnaught Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22421] = { 0, "Dreadnaught Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22422] = { 0, "Dreadnaught Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22423] = { 0, "Dreadnaught Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22424] = { 0, "Redemption Wristguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22425] = { 0, "Redemption Tunic", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22426] = { 0, "Redemption Handguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22427] = { 0, "Redemption Legguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22428] = { 0, "Redemption Headpiece", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22429] = { 0, "Redemption Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22430] = { 0, "Redemption Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22431] = { 0, "Redemption Girdle", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22436] = { 0, "Cryptstalker Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22437] = { 0, "Cryptstalker Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22438] = { 0, "Cryptstalker Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22439] = { 0, "Cryptstalker Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22440] = { 0, "Cryptstalker Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22441] = { 0, "Cryptstalker Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22442] = { 0, "Cryptstalker Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22443] = { 0, "Cryptstalker Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22464] = { 0, "Earthshatter Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22465] = { 0, "Earthshatter Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22466] = { 0, "Earthshatter Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22467] = { 0, "Earthshatter Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22468] = { 0, "Earthshatter Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22469] = { 0, "Earthshatter Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22470] = { 0, "Earthshatter Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22471] = { 0, "Earthshatter Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22476] = { 0, "Bonescythe Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22477] = { 0, "Bonescythe Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22478] = { 0, "Bonescythe Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22479] = { 0, "Bonescythe Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22480] = { 0, "Bonescythe Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22481] = { 0, "Bonescythe Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22482] = { 0, "Bonescythe Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22483] = { 0, "Bonescythe Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22488] = { 0, "Dreamwalker Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22489] = { 0, "Dreamwalker Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22490] = { 0, "Dreamwalker Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22491] = { 0, "Dreamwalker Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22492] = { 0, "Dreamwalker Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22493] = { 0, "Dreamwalker Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22494] = { 0, "Dreamwalker Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22495] = { 0, "Dreamwalker Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22496] = { 0, "Frostfire Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22497] = { 0, "Frostfire Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22498] = { 0, "Frostfire Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22499] = { 0, "Frostfire Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22500] = { 0, "Frostfire Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22501] = { 0, "Frostfire Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22502] = { 0, "Frostfire Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22503] = { 0, "Frostfire Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22504] = { 0, "Plagueheart Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22505] = { 0, "Plagueheart Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22506] = { 0, "Plagueheart Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22507] = { 0, "Plagueheart Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22508] = { 0, "Plagueheart Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22509] = { 0, "Plagueheart Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22510] = { 0, "Plagueheart Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22511] = { 0, "Plagueheart Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22512] = { 0, "Robe of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22513] = { 0, "Leggings of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22514] = { 0, "Circlet of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22515] = { 0, "Shoulderpads of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22516] = { 0, "Sandals of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22517] = { 0, "Gloves of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22518] = { 0, "Belt of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22519] = { 0, "Bindings of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22520] = { 0, "The Phylactery of Kel'Thuzad", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22691] = { 0, "Corrupted Ashbringer", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[22733] = { 0, "Staff Head of Atiesh", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22798] = { 0, "Might of Menethil", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22799] = { 0, "Soulseeker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22800] = { 0, "Brimstone Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22801] = { 0, "Spire of Twilight", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22802] = { 0, "Kingsfall", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22803] = { 0, "Midnight Haze", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22804] = { 0, "Maexxna's Fang", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22806] = { 0, "Widow's Remorse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22807] = { 0, "Wraith Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22808] = { 0, "The Castigator", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22809] = { 0, "Maul of the Redeemed Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22810] = { 0, "Toxin Injector", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22811] = { 0, "Soulstring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22812] = { 0, "Nerubian Slavemaker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22813] = { 0, "Claymore of Unholy Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22815] = { 0, "Severance", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22816] = { 0, "Hatchet of Sundered Bone", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22818] = { 0, "The Plague Bearer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22819] = { 0, "Shield of Condemnation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22820] = { 0, "Wand of Fates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22821] = { 0, "Doomfinger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22935] = { 0, "Touch of Frost", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22936] = { 0, "Wristguards of Vengeance", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[22937] = { 0, "Gem of Nerubis", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22938] = { 0, "Cryptfiend Silk Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22939] = { 0, "Band of Unanswered Prayers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22940] = { 0, "Icebane Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22941] = { 0, "Polar Shoulder Pads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22942] = { 0, "The Widow's Embrace", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22943] = { 0, "Malice Stone Pendant", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22947] = { 0, "Pendant of Forgotten Names", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22954] = { 0, "Kiss of the Spider", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22960] = { 0, "Cloak of Suturing", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22961] = { 0, "Band of Reanimation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22967] = { 0, "Icy Scale Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22968] = { 0, "Glacial Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22981] = { 0, "Gluth's Missing Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22983] = { 0, "Rime Covered Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22988] = { 0, "The End of Dreams", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[22994] = { 0, "Digested Hand of Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23000] = { 0, "Plated Abomination Ribcage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23001] = { 0, "Eye of Diminution", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23004] = { 0, "Idol of Longevity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23005] = { 0, "Totem of Flowing Water", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23006] = { 0, "Libram of Light", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23009] = { 0, "Wand of the Whispering Dead", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23014] = { 0, "Iblis, Blade of the Fallen Seraph", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23017] = { 0, "Veil of Eclipse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23018] = { 0, "Signet of the Fallen Defender", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23019] = { 0, "Icebane Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23020] = { 0, "Polar Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23021] = { 0, "The Soul Harvester's Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23023] = { 0, "Sadist's Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23025] = { 0, "Seal of the Damned", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23027] = { 0, "Warmth of Forgiveness", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23028] = { 0, "Hailstone Band", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23029] = { 0, "Noth's Frigid Heart", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23030] = { 0, "Cloak of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23031] = { 0, "Band of the Inevitable", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23032] = { 0, "Glacial Headdress", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23033] = { 0, "Icy Scale Coif", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23035] = { 0, "Preceptor's Hat", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23036] = { 0, "Necklace of Necropsy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23037] = { 0, "Ring of Spiritual Fervor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23038] = { 0, "Band of Unnatural Forces", ["class"] = { "Warrior", "Paladin", "Rogue" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[23039] = { 0, "The Eye of Nerub", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23040] = { 0, "Glyph of Deflection", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23041] = { 0, "Slayer's Crest", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23042] = { 0, "Loatheb's Reflection", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23043] = { 0, "The Face of Death", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23044] = { 0, "Harbinger of Doom", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23045] = { 0, "Shroud of Dominion", ["class"] = { "Warrior", "Paladin", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[23046] = { 0, "The Restrained Essence of Sapphiron", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23047] = { 0, "Eye of the Dead", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23048] = { 0, "Sapphiron's Right Eye", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23049] = { 0, "Sapphiron's Left Eye", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23050] = { 0, "Cloak of the Necropolis", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 6 };
	[23053] = { 0, "Stormrage's Talisman of Seething", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23054] = { 0, "Gressil, Dawn of Ruin", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23056] = { 0, "Hammer of the Twisting Nether", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23057] = { 0, "Gem of Trapped Innocents", ["class"] = { "Paladin", "Mage", "Warlock" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 6 };
	[23059] = { 0, "Ring of the Dreadnaught", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23060] = { 0, "Bonescythe Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23061] = { 0, "Ring of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23062] = { 0, "Frostfire Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23063] = { 0, "Plagueheart Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23064] = { 0, "Ring of the Dreamwalker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23065] = { 0, "Ring of the Earthshatterer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23066] = { 0, "Ring of Redemption", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23067] = { 0, "Ring of the Cryptstalker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23068] = { 0, "Legplates of Carnage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23069] = { 0, "Necro-Knight's Garb", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23070] = { 0, "Leggings of Polarity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23071] = { 0, "Leggings of Apocalypse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23073] = { 0, "Boots of Displacement", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23075] = { 0, "Death's Bargain", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23219] = { 0, "Girdle of the Mentor", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[23220] = { 0, "Crystal Webbed Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23221] = { 0, "Misplaced Servo Arm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23226] = { 0, "Ghoul Skin Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23237] = { 0, "Ring of the Eternal Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23238] = { 0, "Stygian Buckler", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23242] = { 0, "Claw of the Frost Wyrm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23545] = { 0, "Power of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23547] = { 0, "Resilience of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23548] = { 0, "Might of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23549] = { 0, "Fortitude of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23577] = { 0, "The Hungering Cold", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23663] = { 0, "Girdle of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23664] = { 0, "Pauldrons of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23665] = { 0, "Leggings of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23666] = { 0, "Belt of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23667] = { 0, "Spaulders of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
	[23668] = { 0, "Leggings of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = 6};
}
GoodEPGP.prices = prices

-- Class List
local classList = {"All Classes", "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid", "Priest", "Warlock", "Mage"}

-- Role List
local roleList = {"All Roles", "Tank", "Healer", "Caster", "Melee"}

-- Phase List
local phaseList = {1, 2, 3, 4, 5, 6}

-- Combo lists for role sorting
local validRoleCombos = {
    ["Tank"] = { "Warrior", "Paladin", "Druid" },
    ["Healer"] = { "Paladin", "Shaman", "Druid", "Priest" },
    ["Caster"] = { "Shaman", "Druid", "Priest", "Warlock", "Mage" },
    ["Melee"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid" }
}

local validClassCombos = {
	["Warrior"] = { "Tank", "Melee" },
	["Paladin"] = { "Tank", "Healer", "Melee" },
	["Shaman"] = { "Healer", "Caster", "Melee" },
	["Hunter"] = { "Melee" },
	["Rogue"] = { "Melee" },
	["Druid"] = { "Tank", "Healer", "Melee" },
	["Priest"] = { "Healer", "Caster" },
	["Warlock"] = { "Caster" },
	["Mage"] = { "Caster" },
}

-- Combo lists for role sorting
local validCombos = {
    ["Tank"] = {
        {["class"] = "Warrior", ["spec"] = "Protection"},
        {["class"] = "Druid", ["spec"] = "Feral"},
    },
    ["Healer"] = {
        {["class"] = "Priest", ["spec"] = "Holy"},
        {["class"] = "Priest", ["spec"] = "Discipline"},
        {["class"] = "Druid", ["spec"] = "Restoration"},
        {["class"] = "Paladin", ["spec"] = "Holy"},
    },
    ["Caster"] = {
        {["class"] = "Priest", ["spec"] = "Shadow"},
        {["class"] = "Mage", ["spec"] = "Frost"},
        {["class"] = "Mage", ["spec"] = "Fire"},
        {["class"] = "Mage", ["spec"] = "Arcane"},
        {["class"] = "Warlock", ["spec"] = "Demonology"},
        {["class"] = "Warlock", ["spec"] = "Affliction"},
        {["class"] = "Warlock", ["spec"] = "Destruction"},
        {["class"] = "Druid", ["spec"] = "Balance"},
    },
    ["Melee"] = {
        {["class"] = "Druid", ["spec"] = "Feral"},
        {["class"] = "Warrior", ["spec"] = "Arms"},
        {["class"] = "Warrior", ["spec"] = "Fury"},
        {["class"] = "Rogue", ["spec"] = "Combat"},
        {["class"] = "Rogue", ["spec"] = "Subtlety"},
        {["class"] = "Rogue", ["spec"] = "Assassination"},
    }
}

-- Date format
local dateFormat = "%m/%d/%y @ %I:%M:%S %p"

-- Toggle the display of our prices window
function GoodEPGP:TogglePrices()
    if (GoodEPGP.pricesFrame:IsVisible()) then
        GoodEPGP.pricesFrame:Hide()
    else
		if (GoodEPGP.menuFrame:IsVisible()) then
			GoodEPGP.menuFrame:Hide()
		end
		if (GoodEPGP.standingsFrame:IsVisible()) then
			GoodEPGP:ToggleStandings()
		end

		-- Clear all filters
		GoodEPGP.pricesFrame.roleSelectDropdown:SetValue()
		GoodEPGP.pricesFrame.roleSelectDropdown:SetText("All Roles")
		GoodEPGP.pricesFrame.classSelectDropdown:SetValue()
		GoodEPGP.pricesFrame.classSelectDropdown:SetText("All Classes")

		GoodEPGP:LoadAllPrices(GoodEPGPphase)
        GoodEPGP.pricesFrame:Show()
    end
end

-- Query server for data missing from the local client ItemCache then build cached price list
function GoodEPGP:BuildPrices()
	GoodEPGPCachedPrices = {}
	for itemID, itemVars in pairs(GoodEPGP.prices) do

		-- Checks local cache for item and askes server for data if it doesn't exsist
		if (GetItemInfo(itemID) == nil) then
			local item = Item:CreateFromItemID(itemID)
			item:ContinueOnItemLoad(function()
				local itemName = select(1, GetItemInfo(itemID))
				local itemLink = select(2, GetItemInfo(itemID))
				local itemIcon = select(10, GetItemInfo(itemID))
				local itemSetID = select(16, GetItemInfo(itemID))
				local price = itemVars[1]
				local osprice = tonumber(price) / 4
				local class = itemVars.class
				local spec = itemVars.role
				local phase = itemVars.phase
				local priceInfo = {
					["itemID"] = itemID,
					["itemName"] = itemName,
					["itemLink"] = itemLink,
					["itemIcon"] = itemIcon,
					["itemSetID"] = itemSetID,
					["itemMSprice"] = price,
					["itemOSprice"] = osprice,
					["itemClass"] = class,
					["itemSpec"] = spec,
					["itemPhase"] = phase,
				};
				table.insert(GoodEPGPCachedPrices, priceInfo)
			end)
		else

			-- Item exsists in local cache and data will be pulled from there
			local itemName = select(1, GetItemInfo(itemID))
			local itemLink = select(2, GetItemInfo(itemID))
			local itemIcon = select(10, GetItemInfo(itemID))
			local itemSetID = select(16, GetItemInfo(itemID))
			local price = itemVars[1]
			local osprice = tonumber(price) / 4
			local class = itemVars.class
			local spec = itemVars.role
			local phase = itemVars.phase
			local priceInfo = {
				["itemID"] = itemID,
				["itemName"] = itemName,
				["itemLink"] = itemLink,
				["itemIcon"] = itemIcon,
				["itemSetID"] = itemSetID,
				["itemMSprice"] = price,
				["itemOSprice"] = osprice,
				["itemClass"] = class,
				["itemSpec"] = spec,
				["itemPhase"] = phase,
			};
			table.insert(GoodEPGPCachedPrices, priceInfo)
		end
	end
	GoodEPGP:CreatePricesFrame()
	GoodEPGP:PricesSort("name")
end

-- Create pricesFrame if it doesn't exist.
function GoodEPGP:CreatePricesFrame()
	if (GoodEPGP.pricesFrame == nil) then

		-- Create parent frame
		GoodEPGP.pricesFrame = AceGUI:Create("Frame")
		GoodEPGP.pricesFrame:SetTitle("GoodEPGP - Price List")
		GoodEPGP.pricesFrame:SetStatusText("Last Updated: " .. date(dateFormat))
		GoodEPGP.pricesFrame:SetLayout("Flow")
		GoodEPGP.pricesFrame:EnableResize(false)

		--[[
		GoodEPGP.pricesFrame:SetCallback("OnClose", function()
			-- Wipe the standingsLinesFrames and release all widgets (prevents memory bloat)
			GoodEPGP.pricesScrollFrame:ReleaseChildren()
			GoodEPGP.pricesLinesFrames = {}
		end)
		--]]

        -- Add class filter dropdown
        GoodEPGP.pricesFrame.classSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.pricesFrame.classSelectDropdown:SetLabel(" Class")
        GoodEPGP.pricesFrame.classSelectDropdown:SetList(classList)
		GoodEPGP.pricesFrame.classSelectDropdown:SetText("All Classes")
        GoodEPGP.pricesFrame.classSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedClass = classList[widget:GetValue()];
            GoodEPGP:PricesFilter("class", selectedClass)
        end)
        GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.classSelectDropdown)

		-- Add role filter dropdown
        GoodEPGP.pricesFrame.roleSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.pricesFrame.roleSelectDropdown:SetLabel(" Role")
        GoodEPGP.pricesFrame.roleSelectDropdown:SetList(roleList)
		GoodEPGP.pricesFrame.roleSelectDropdown:SetText("All Roles")
		GoodEPGP.pricesFrame.roleSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedRole = roleList[widget:GetValue()];
            GoodEPGP:PricesFilter("role", selectedRole)
        end)
        GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.roleSelectDropdown)

		-- Add phase filter dropdown
        GoodEPGP.pricesFrame.phaseSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.pricesFrame.phaseSelectDropdown:SetLabel(" Phase")
        GoodEPGP.pricesFrame.phaseSelectDropdown:SetList(phaseList)
		GoodEPGP.pricesFrame.phaseSelectDropdown:SetValue(GoodEPGPphase)
        GoodEPGP.pricesFrame.phaseSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedPhase = phaseList[widget:GetValue()];
			GoodEPGP:PricesFilter("phase", selectedPhase)
        end)
        GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.phaseSelectDropdown)

		-- Add 4px left side padding for the headers
		GoodEPGP.pricesFrame.padding = AceGUI:Create("Label")
		GoodEPGP.pricesFrame.padding:SetWidth(4)
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.padding)

		-- Generate table headers
		local headers = {
		  {["label"] = "Item", ["width"] = 300, ["sortColumn"] = "name"},
		  {["label"] = "Main Spec", ["width"] = 100, ["sortColumn"] = "itemMSprice"},
		  {["label"] = "Off Spec", ["width"] = 100, ["sortColumn"] = "itemOSprice"},
		}

		-- Add headers and set sorting function
		GoodEPGP:AddHeaderLine(headers, GoodEPGP.pricesFrame, "PricesSort")

		-- Create a container for the scrolling frame
		GoodEPGP.pricesScrollContainer = AceGUI:Create("SimpleGroup")
		GoodEPGP.pricesScrollContainer:SetFullWidth(true)
		GoodEPGP.pricesScrollContainer:SetFullHeight(true)
		GoodEPGP.pricesScrollContainer:SetLayout("Fill")
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesScrollContainer)

		-- Create scrolling frame for prices list to go into with 4px padding
		GoodEPGP.pricesScrollFrame = AceGUI:Create("ScrollFrame")
		GoodEPGP.pricesScrollFrame:SetLayout("Flow")
		GoodEPGP.pricesScrollFrame:ClearAllPoints()
		GoodEPGP.pricesScrollFrame:SetPoint("TOP", GoodEPGP.pricesScrollContainer.frame, "TOP", 0, -4)
		GoodEPGP.pricesScrollFrame:SetPoint("BOTTOM", 0, 4)

		-- Hide the prices frame
		GoodEPGP.pricesFrame:Hide()

		-- Allows closing hitting ESC
		_G["GoodEPGP_Prices"] = GoodEPGP.pricesFrame
		table.insert(UISpecialFrames, "GoodEPGP_Prices")
	end
end

-- Load prices from our cache
function GoodEPGP:LoadAllPrices(phase)

	-- Clear all filters
	GoodEPGP.pricesFrame.roleSelectDropdown:SetValue()
	GoodEPGP.pricesFrame.roleSelectDropdown:SetText("All Roles")
	GoodEPGP.pricesFrame.classSelectDropdown:SetValue()
	GoodEPGP.pricesFrame.classSelectDropdown:SetText("All Classes")

	-- Go through our standings and display them by phase
	if phase then

		-- Wipe the standingsLinesFrames and release all widgets (prevents memory bloat)
		GoodEPGP.pricesScrollFrame:ReleaseChildren()
		GoodEPGP.pricesLinesFrames = {}

		local counter = 1
		for key, item in pairs(GoodEPGPCachedPrices) do
			if item.itemPhase == phase then
				GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, counter)
				counter = counter + 1
			end
		end

	-- No phase selected - show all prices
	else
		for key, item in pairs(GoodEPGPCachedPrices) do
			if item.itemPhase == phase then
				GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, key)
			end
		end
	end

	-- Add prices scroll frame to scroll container
	GoodEPGP.pricesScrollContainer:AddChild(GoodEPGP.pricesScrollFrame)
end

-- Create a single line of prices
function GoodEPGP:AddPriceLine(item, frame, index)

	-- Set up a table of pricesFrame lines
	if (GoodEPGP.pricesLinesFrames == nil) then
		GoodEPGP.pricesLinesFrames = {}
	end

	-- Our list of fields and related widths
	local fields = {
		{["field"] = "itemLink", ["width"] = 300},
		{["field"] = "itemMSprice", ["width"] = 100},
		{["field"] = "itemOSprice", ["width"] = 100},
	}

	-- If the key for this index exists, modify it with possible changes to prices and icons. Usually triggered by sorting.
	if (GoodEPGP.pricesLinesFrames[index]) then
		local pricesLine = GoodEPGP.pricesLinesFrames[index]
		for key, field in pairs(fields) do
			local pricesLabel = pricesLine[field.field]

			-- Add tooltips to changed prices list
			if (field.field == "itemLink") then
				pricesLabel:SetCallback("OnClick", function()
					local link = item[field.field]
					if IsControlKeyDown() then
						DressUpItemLink(link)
					elseif IsShiftKeyDown() then
						local chat = ChatEdit_GetLastActiveWindow()
						if chat:IsShown() then
							chat:Insert(link)
						end
					else
						ItemRefTooltip:SetOwner(GoodEPGP.pricesFrame.frame, "ANCHOR_LEFT", 0, -400)
						ItemRefTooltip:SetHyperlink(link)
						ItemRefTooltip:Show()
					end
				end)

				-- Add icons to changed prices list
				local itemIcon = tonumber(item.itemIcon)
				pricesLabel:SetImage(itemIcon)
			end

			-- Add text to changed prices list
			pricesLabel:SetText(item[field.field])
		end
	else

		-- Our frames didn't already exist - create group
		local pricesLine = {};
		labelGroup = AceGUI:Create("SimpleGroup")
		labelGroup:SetLayout("Flow")
		labelGroup:SetRelativeWidth(1)

		-- Add 4px padding to label group (hacks!)
		pricesPadding = AceGUI:Create("Label")
		pricesPadding:SetWidth(4)
		labelGroup:AddChild(pricesPadding)

		-- Create label
		for key, field in pairs(fields) do
			if (field.field == "itemLink") then
				label = AceGUI:Create("InteractiveLabel")
				label:SetCallback("OnClick", function()
					local link = item[field.field]
					if IsControlKeyDown() then
						DressUpItemLink(link)
					elseif IsShiftKeyDown() then
						local chat = ChatEdit_GetLastActiveWindow()
						if chat:IsShown() then
							chat:Insert(link)
						end
					else
						ItemRefTooltip:SetOwner(GoodEPGP.pricesFrame.frame, "ANCHOR_LEFT", 0, -400)
						ItemRefTooltip:SetHyperlink(link)
						ItemRefTooltip:Show()
					end
				end)

				-- Add icons to prices list
				local itemIcon = tonumber(item.itemIcon)
				label:SetImage(itemIcon)
			else
				label = AceGUI:Create("Label")
			end
			label:SetWidth(field.width)
			label:SetText(item[field.field])
			label:SetHeight(14)

			-- add label to label group
			labelGroup:AddChild(label)

			-- Add the new label frame to the pricesLine table for re-use later
			pricesLine[field.field] = label
		end

		-- Add label group to standingsScrollFrame
		frame:AddChild(labelGroup)

		-- Set a quick alias
		pricesLine["group"] = labelGroup

		-- Add our new pricesLine table to the pricesFrames table for later use
		GoodEPGP.pricesLinesFrames[index] = pricesLine

		-- Set the initial background color on all lines
		pricesLine["group"].frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
		pricesLine["group"].frame:SetBackdropColor(0, 0, 0, 1)

		-- Add contrasting background to every other line
        if (index % 2 == 1) then
		else
			pricesLine["group"].frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
            pricesLine["group"].frame:SetBackdropColor(.2, .2, .2, .8)
        end
	end
end

-- Sort the EPGP prices tables
function GoodEPGP:PricesSort(sortColumn)

	-- Sort based on previous sort (ASC => DESC => ASC)
    local sortOrder = "ASC"
    if (GoodEPGP.pricesFrame ~= nil) then
        if (GoodEPGP.pricesFrame.sort == sortColumn) then
            if (GoodEPGP.pricesFrame.sortOrder == "ASC") then
                GoodEPGP.pricesFrame.sortOrder = "DESC"
            else
                GoodEPGP.pricesFrame.sortOrder = "ASC"
            end
        else
            GoodEPGP.pricesFrame.sort = sortColumn
            GoodEPGP.pricesFrame.sortOrder = "ASC"
        end

        -- Fill in our sortOrder var
        sortOrder = GoodEPGP.pricesFrame.sortOrder
    end

    -- Sort numerically when using a numeric column
    local numeric = false
    if (sortColumn == 'itemMSprice' or sortColumn == 'itemOSprice') then
        numeric = true
    end

    -- Custom sort function
    table.sort(GoodEPGPCachedPrices, function(a, b)

		-- If column data is a number then convert raw text to number
        if (numeric) then
            a[sortColumn] = tonumber(a[sortColumn])
            b[sortColumn] = tonumber(b[sortColumn])
        else
            local a = a[sortColumn]
            local b = b[sortColumn]
        end

		-- Sort by itemName column else sort by number column Ascending or Descending
        if (sortOrder == "ASC") then
			if (sortColumn == "name") then
				return b.itemName > a.itemName
			else
				return b[sortColumn] > a[sortColumn]
			end
        else
			if (sortColumn == "name") then
				return a.itemName > b.itemName
			else
	            return a[sortColumn] > b[sortColumn]
			end
        end
    end)

	-- Check filter state and load accordingly
	local selectedClass = classList[GoodEPGP.pricesFrame.classSelectDropdown:GetValue()]
	local selectedRole = roleList[GoodEPGP.pricesFrame.roleSelectDropdown:GetValue()]
	local selectedPhase = phaseList[GoodEPGP.pricesFrame.phaseSelectDropdown:GetValue()]
    if (selectedClass ~= nil) then
        GoodEPGP:PricesFilter("class", selectedClass)
	elseif (selectedRole ~= nil) then
        GoodEPGP:PricesFilter("role", selectedRole)
	elseif (selectedPhase ~= nil) then
		GoodEPGP:PricesFilter("phase", selectedPhase)
	else
		GoodEPGP:LoadAllPrices()
	end
end

-- Filter the EPGP price list
function GoodEPGP:PricesFilter(type, filterValue)
	local selectedClass = classList[GoodEPGP.pricesFrame.classSelectDropdown:GetValue()]
	local selectedRole = roleList[GoodEPGP.pricesFrame.roleSelectDropdown:GetValue()]
	local selectedPhase = phaseList[GoodEPGP.pricesFrame.phaseSelectDropdown:GetValue()]

	-- Wipe the standingsLinesFrames and release all widgets (prevents memory bloat)
	GoodEPGP.pricesScrollFrame:ReleaseChildren()
	GoodEPGP.pricesLinesFrames = {}

	-- If filters aren't set then load all prices
	if ((selectedRole == nil or selectedRole == "All Roles") and (selectedClass == nil or selectedClass == "All Classes") and selectedPhase ~= nil) then
		GoodEPGP:LoadAllPrices(selectedPhase)
	else

		-- Phase changed reset filters
		if (type == "phase") then
			GoodEPGP:LoadAllPrices(selectedPhase)
		end

		-- Go through our standings and display lines by role
		if (type == "role") then
			local counter = 1
			local roleCombos = validRoleCombos[filterValue]
			for key, item in pairs(GoodEPGPCachedPrices) do
				if item.itemPhase == selectedPhase then
					if item.itemSpec then
						for key, currentSpec in pairs(item.itemSpec) do
							if (selectedClass == nil or selectedClass == "All Classes") then
								if (currentSpec == filterValue) then
									GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, counter)
									counter = counter + 1
								end
							else
								if (selectedRole == nil or selectedRole == "All Roles") then
									GoodEPGP:PricesFilter("class", selectedClass)
									return
								end
								for key, classCombo in pairs(roleCombos) do
									if (selectedClass == classCombo and filterValue == currentSpec) then
										if item.itemClass then
											for key, currentClass in pairs(item.itemClass) do
												if (currentClass == selectedClass) then
													GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, counter)
													counter = counter + 1
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		-- Go through our standings and display filers by class
		if (type == "class") then
			local counter = 1
			local classCombos = validClassCombos[filterValue]
			for key, item in pairs(GoodEPGPCachedPrices) do
				if item.itemPhase == selectedPhase then
					if item.itemClass then
						for key, currentClass in pairs(item.itemClass) do
							if (selectedRole == nil or selectedRole == "All Roles") then
								if (currentClass == filterValue) then
									GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, counter)
									counter = counter + 1
								end
							else
								if (selectedClass == nil or selectedClass == "All Classes") then
									GoodEPGP:PricesFilter("role", selectedRole)
									return
								end
								for key, roleCombo in pairs(classCombos) do
									if (selectedRole == roleCombo and currentClass == filterValue) then
										if item.itemSpec then
											for key, currentSpec in pairs(item.itemSpec) do
												if (currentSpec == selectedRole) then
													GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, counter)
													counter = counter + 1
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		-- Add prices scroll frame to scroll container
		GoodEPGP.pricesScrollContainer:AddChild(GoodEPGP.pricesScrollFrame)
	end
end
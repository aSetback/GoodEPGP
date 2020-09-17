-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

-- Prices List
local prices = {
	-----------------------------
	-------- Molten Core --------
	-----------------------------
	[16665] = { 0, "Tome of Tranquilizing Shot", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16795] = { 0, "Arcanist Crown", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16796] = { 0, "Arcanist Leggings", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16797] = { 0, "Arcanist Mantle", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16798] = { 0, "Arcanist Robes", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16799] = { 0, "Arcanist Bindings", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16800] = { 0, "Arcanist Boots", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16801] = { 0, "Arcanist Gloves", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16802] = { 0, "Arcanist Belt", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16803] = { 0, "Felheart Slippers", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16804] = { 0, "Felheart Bracers", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16805] = { 0, "Felheart Gloves", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16806] = { 0, "Felheart Belt", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16807] = { 0, "Felheart Shoulder Pads", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16808] = { 0, "Felheart Horns", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16809] = { 0, "Felheart Robes", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16810] = { 0, "Felheart Pants", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16811] = { 0, "Boots of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16812] = { 0, "Gloves of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16813] = { 0, "Circlet of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16814] = { 0, "Pants of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16815] = { 0, "Robes of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16816] = { 0, "Mantle of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16817] = { 0, "Girdle of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16819] = { 0, "Vambraces of Prophecy", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16820] = { 0, "Nightslayer Chestpiece", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16821] = { 0, "Nightslayer Cover", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16822] = { 0, "Nightslayer Pants", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16823] = { 0, "Nightslayer Shoulder Pads", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16824] = { 0, "Nightslayer Boots", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16825] = { 0, "Nightslayer Bracelets", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16826] = { 0, "Nightslayer Gloves", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16827] = { 0, "Nightslayer Belt", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16828] = { 0, "Cenarion Belt", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16829] = { 0, "Cenarion Boots", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16830] = { 0, "Cenarion Bracers", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16831] = { 0, "Cenarion Gloves", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16833] = { 0, "Cenarion Vestments", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16834] = { 0, "Cenarion Helm", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16835] = { 0, "Cenarion Leggings", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16836] = { 0, "Cenarion Spaulders", ["class"] = { "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[16837] = { 0, "Earthfury Boots", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16838] = { 0, "Earthfury Belt", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16839] = { 0, "Earthfury Gauntlets", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16840] = { 0, "Earthfury Bracers", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16841] = { 0, "Earthfury Vestments", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16842] = { 0, "Earthfury Helmet", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16843] = { 0, "Earthfury Legguards", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16844] = { 0, "Earthfury Epaulets", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16845] = { 0, "Giantstalker's Breastplate", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16846] = { 0, "Giantstalker's Helmet", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16847] = { 0, "Giantstalker's Leggings", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16848] = { 0, "Giantstalker's Epaulets", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16849] = { 0, "Giantstalker's Boots", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16850] = { 0, "Giantstalker's Bracers", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16851] = { 0, "Giantstalker's Belt", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16852] = { 0, "Giantstalker's Gloves", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16853] = { 0, "Lawbringer Chestguard", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16854] = { 0, "Lawbringer Helm", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16855] = { 0, "Lawbringer Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16856] = { 0, "Lawbringer Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16857] = { 0, "Lawbringer Bracers", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee"}, ["phase"] = "One" };
	[16858] = { 0, "Lawbringer Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16859] = { 0, "Lawbringer Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16860] = { 0, "Lawbringer Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[16861] = { 0, "Bracers of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16862] = { 0, "Sabatons of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16863] = { 0, "Gauntlets of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16864] = { 0, "Belt of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16865] = { 0, "Breastplate of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16866] = { 0, "Helm of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16867] = { 0, "Legplates of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16868] = { 0, "Pauldrons of Might", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[16901] = { 100, "Stormrage Legguards", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16909] = { 150, "Bloodfang Pants", ["class"] = { "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[16915] = { 150, "Netherwind Pants", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[16922] = { 150, "Leggings of Transcendence", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[16930] = { 150, "Nemesis Leggings", ["class"] = { "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[16938] = { 150, "Dragonstalker's Legguards", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[16946] = { 100, "Legplates of Ten Storms", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[16954] = { 100, "Judgement Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "One" };
	[16962] = { 150, "Legplates of Wrath", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[17063] = { 346, "Band of Accuria", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Tank", "Melee" }, ["phase"] = "One" };
	[17065] = { 194, "Medallion of Steadfast Might", ["class"] = { "Warrior", "Druid", "Paladin" }, ["role"] = { "Tank" }, ["phase"] = "One" };
	[17066] = { 130, "Drillborer Disk", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank" }, ["phase"] = "One" };
	[17069] = { 288, "Striker's Mark", ["class"] = { "Warrior", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[17071] = { 0, "Gutgore Ripper", ["class"] = { "Warrior", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[17072] = { 119, "Blastershot Launcher", ["class"] = { "Warrior", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[17073] = { 65, "Earthshaker", ["class"] = { "Warrior", "Shaman", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[17074] = { 0, "Shadowstrike", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[17076] = { 158, "Bonereaver's Edge", ["class"] = { "Warrior" }, ["role"] = { "" }, ["phase"] = "One" };
	[17077] = { 0, "Crimson Shocker", ["class"] = { "Priest", "Warlock", "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[17082] = { 0, "Shard of the Flame", ["class"] = { "Warrior", "Druid", "Paladin" }, ["role"] = { "Tank" }, ["phase"] = "One" };
	[17102] = { 108, "Cloak of the Shrouded Mists", ["class"] = { "Hunter", "Warrior", "Druid", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[17103] = { 202, "Azuresong Mageblade", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "One" };
	[17104] = { 108, "Spinal Reaper", ["class"] = { "Warrior", "Shaman", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "One" };
	[17105] = { 119, "Aurastone Hammer", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = "One" };
	[17106] = { 0, "Malistar's Defender", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = "One" };
	[17107] = { 86, "Dragon's Blood Cape", ["class"] = { "Warrior", "Druid", "Paladin" }, ["role"] = { "Tank" }, ["phase"] = "One" };
	[17109] = { 43, "Choker of Enlightenment", ["class"] = { "Mage", "Warlock", "Priest", "Shaman", "Paladin", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[17110] = { 0, "Seal of the Archmagus", ["class"] = { "Mage", "Warlock", "Priest", "Shaman", "Paladin", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[17204] = { 0, "Eye of Sulfuras", ["class"] = { "Warrior", "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "One" };
	[18203] = { 86, "Eskhandar's Right Claw", ["class"] = { "Rogue", "Warrior", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18563] = { 250, "Bindings of the Windseeker", ["class"] = { "Warrior", "Rogue", "Hunter", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18564] = { 250, "Bindings of the Windseeker", ["class"] = { "Warrior", "Rogue", "Hunter", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18646] = { 0, "The Eye of Divinity", ["class"] = { "Priest" }, ["role"] = { "" }, ["phase"] = "One" };
	[18703] = { 0, "Ancient Petrified Leaf", ["class"] = { "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[18803] = { 0, "Finkle's Lava Dredger", ["class"] = { "Druid", "Paladin", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18805] = { 230, "Core Hound Tooth", ["class"] = { "Warrior", "Rogue", "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[18806] = { 0, "Core Forged Greaves", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18808] = { 0, "Gloves of the Hypnotic Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18809] = { 86, "Sash of Whispered Secrets", ["class"] = { "Mage" }, ["role"] = { "" }, ["phase"] = "One" };
	[18810] = { 259, "Wild Growth Spaulders", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer" }, ["phase"] = "One" };
	[18811] = { 0, "Fireproof Cloak", ["class"] = { "Priest", "Mage", "Warlock", "Paladin", "Shaman", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[18812] = { 151, "Wristguards of True Flight", ["class"] = { "Warrior", "Hunter", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18814] = { 302, "Choker of the Fire Lord", ["class"] = { "Paladin", "Shaman", "Druid", "Warlock", "Mage", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "One" };
	[18815] = { 0, "Essence of the Pure Flame", ["class"] = { "Warrior", "Druid", "Paladin" }, ["role"] = { "Tank" }, ["phase"] = "One" };
	[18816] = { 288, "Perdition's Blade", ["class"] = { "Warrior", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[18817] = { 0, "Crown of Destruction", ["class"] = { "Warrior", "Shaman", "Paladin", "Hunter" }, ["role"] = { "" }, ["phase"] = "One" };
	[18820] = { 259, "Talisman of Ephemeral Power", ["class"] = { "Mage", "Warlock", "Priest", "Druid" }, ["role"] = { "Caster" }, ["phase"] = "One" };
	[18821] = { 259, "Quick Strike Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "One" };
	[18822] = { 65, "Obsidian Edged Blade", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18823] = { 86, "Aged Core Leather Gloves", ["class"] = { "Warrior", "Rogue", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[18824] = { 43, "Magma Tempered Boots", ["class"] = { "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18829] = { 108, "Deep Earth Spaulders", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18832] = { 173, "Brutality Blade", ["class"] = { "Warrior", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[18842] = { 130, "Staff of Dominance", ["class"] = { "Mage", "Priest", "Druid", "Warlock" }, ["role"] = { "" }, ["phase"] = "One" };
	[18861] = { 0, "Flamewaker Legplates", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "" }, ["phase"] = "One" };
	[18870] = { 43, "Helm of the Lifegiver", ["class"] = { "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18872] = { 0, "Manastorm Leggings", ["class"] = { "Priest", "Paladin", "Druid", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[18875] = { 227, "Salamander Scale Pants", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = "One" };
	[18878] = { 86, "Sorcerous Dagger", ["class"] = { "Priest", "Mage", "Warlock", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[18879] = { 162, "Heavy Dark Iron Ring", ["class"] = { "Warrior", "Paladin", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[19136] = { 202, "Mana Igniting Cord", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[19137] = { 346, "Onslaught Girdle", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = "One" };
	[19138] = { 0, "Band of Sulfuras", ["class"] = { "Priest", "Warlock", "Mage", "Druid", "Paladin", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[19139] = { 0, "Fireguard Shoulders", ["class"] = { "Druid", "Rogue" }, ["role"] = { "" }, ["phase"] = "One" };
	[19140] = { 202, "Cauterizing Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "One" };
	[19142] = { 65, "Fire Runed Grimoire", ["class"] = { "Mage", "Warlock", "Priest", "Druid" }, ["role"] = { "" }, ["phase"] = "One" };
	[19143] = { 101, "Flameguard Gauntlets", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = "One" };
	[19144] = { 65, "Sabatons of the Flamewalker", ["class"] = { "Hunter", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	[19145] = { 302, "Robe of Volatile Power", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "One" };
	[19146] = { 58, "Wristguards of Stability", ["class"] = { "Warrior", "Paladin", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "One" };
	[19147] = { 202, "Ring of Spell Power", ["class"] = { "Mage", "Warlock", "Priest", "Druid", "Shaman" }, ["role"] = { "" }, ["phase"] = "One" };
	--------------------------------
	-------- Outdoor Bosses --------
	--------------------------------
	[16900] = { 100, "Stormrage Cover", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16908] = { 150, "Bloodfang Hood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16914] = { 100, "Netherwind Crown", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16921] = { 150, "Halo of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16929] = { 100, "Nemesis Skullcap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16939] = { 150, "Dragonstalker's Helm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16947] = { 120, "Helmet of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[16955] = { 100, "Judgement Crown", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "One" };
	[16963] = { 100, "Helm of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[17064] = { 234, "Shard of the Scale", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "One" };
	[17067] = { 54, "Ancient Cornerstone Grimoire", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[17068] = { 144, "Deathbringer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[17070] = { 162, "Fang of the Mystics", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[17075] = { 108, "Vis'kag the Bloodletter", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[17078] = { 90, "Sapphiron Drape", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[17111] = { 72, "Blazefury Medallion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[17112] = { 90, "Empyrean Demolisher", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[17113] = { 108, "Amberseal Keeper", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18202] = { 90, "Eskhandar's Left Claw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18204] = { 54, "Eskhandar's Pelt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18205] = { 72, "Eskhandar's Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18208] = { 54, "Drape of Benediction", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18403] = { 216, "Dragonslayer's Signet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18404] = { 216, "Onyxia Tooth Pendant", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee", "Caster" }, ["phase"] = "One" };
	[18406] = { 216, "Onyxia Blood Talisman", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18422] = { 0, "Head of Onyxia", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18423] = { 216, "Head of Onyxia", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18541] = { 234, "Puissant Cape", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18542] = { 54, "Typhoon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18543] = { 54, "Ring of Entropy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18544] = { 90, "Doomhide Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18545] = { 18, "Leggings of Arcane Supremacy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18546] = { 108, "Infernal Headcage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18547] = { 18, "Unmelting Ice Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[18665] = { 0, "The Eye of Shadow", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One"};
	[18704] = { 0, "Mature Blue Dragon Sinew", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18705] = { 0, "Mature Black Dragon Sinew", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[18813] = { 18, "Ring of Binding", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "One" };
	[19130] = { 207, "Cold Snap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[19131] = { 252, "Snowblind Shoes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[19132] = { 270, "Crystal Adorned Crown", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Two" };
	[19133] = { 243, "Fel Infused Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[19134] = { 72, "Flayed Doomguard Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[19135] = { 54, "Blacklight Bracer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Two"};
	[20577] = { 162, "Nightmare Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20578] = { 162, "Emerald Dragonfang", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20579] = { 18, "Green Dragonskin Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20580] = { 144, "Hammer of Bestial Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20581] = { 180, "Staff of Rampant Growth", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20582] = { 90, "Trance Stone", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20599] = { 126, "Polished Ironwood Crossbow", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20600] = { 18, "Malfurion's Signet Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20615] = { 72, "Dragonspur Wraps", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20616] = { 72, "Dragonbone Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20617] = { 126, "Ancient Corroded Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20618] = { 180, "Gloves of Delusional Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20619] = { 18, "Acid Inscribed Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20621] = { 108, "Boots of the Endless Moor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20622] = { 90, "Dragonheart Necklace", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20623] = { 144, "Circlet of Restless Dreams", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20624] = { 108, "Ring of the Unliving", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20625] = { 18, "Belt of the Dark Bog", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20626] = { 90, "Black Bark Wristbands", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20627] = { 225, "Dark Heart Pants", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20628] = { 243, "Deviate Growth Cap", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20629] = { 54, "Malignant Footguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20630] = { 45, "Gauntlets of the Shining Light", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20631] = { 180, "Mendicant's Slippers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20632] = { 90, "Mindtear Band", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20633] = { 18, "Unnatural Leather Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20634] = { 108, "Boots of Fright", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20635] = { 162, "Jade Inlaid Vestments", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20636] = { 234, "Hibernation Crystal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20637] = { 18, "Acid Inscribed Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20638] = { 144, "Leggings of the Demented Mind", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20639] = { 54, "Strangely Glyphed Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	[20644] = { 18, "Nightmare Engulfed Object", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Four"};
	--------------------------------
	-------- Blackwing Lair --------
	--------------------------------	
	[16818] = { 50, "Netherwind Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16832] = { 50, "Bloodfang Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16897] = { 50, "Stormrage Chestguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16898] = { 75, "Stormrage Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16899] = { 75, "Stormrage Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16902] = { 50, "Stormrage Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16903] = { 50, "Stormrage Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16904] = { 75, "Stormrage Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16905] = { 75, "Bloodfang Chestpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16906] = { 50, "Bloodfang Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16907] = { 50, "Bloodfang Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16908] = { 75, "Bloodfang Hood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16910] = { 75, "Bloodfang Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16911] = { 75, "Bloodfang Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16912] = { 50, "Netherwind Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16913] = { 75, "Netherwind Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16916] = { 50, "Netherwind Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16917] = { 50, "Netherwind Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16918] = { 50, "Netherwind Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16919] = { 50, "Boots of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16920] = { 75, "Handguards of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16923] = { 75, "Robes of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16924] = { 75, "Pauldrons of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16925] = { 75, "Belt of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16926] = { 75, "Bindings of Transcendence", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16927] = { 50, "Nemesis Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16928] = { 50, "Nemesis Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16931] = { 75, "Nemesis Robes", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16932] = { 50, "Nemesis Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16933] = { 75, "Nemesis Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16934] = { 50, "Nemesis Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16935] = { 75, "Dragonstalker's Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16936] = { 75, "Dragonstalker's Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16937] = { 75, "Dragonstalker's Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16940] = { 75, "Dragonstalker's Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16941] = { 75, "Dragonstalker's Greaves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16942] = { 75, "Dragonstalker's Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16943] = { 84, "Bracers of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16944] = { 96, "Belt of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16945] = { 120, "Epaulets of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16948] = { 96, "Gauntlets of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16949] = { 96, "Greaves of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16950] = { 144, "Breastplate of Ten Storms", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16951] = { 50, "Judgement Bindings", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16952] = { 50, "Judgement Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16953] = { 50, "Judgement Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16956] = { 50, "Judgement Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16957] = { 50, "Judgement Sabatons", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16958] = { 50, "Judgement Breastplate", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[16959] = { 75, "Bracelets of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16960] = { 50, "Waistband of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16961] = { 50, "Pauldrons of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16964] = { 75, "Gauntlets of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16965] = { 75, "Sabatons of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[16966] = { 75, "Breastplate of Wrath", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19002] = { 0, "Head of Nefarian", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19003] = { 94, "Head of Nefarian", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19334] = { 176, "The Untamed Blade", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19335] = { 77, "Spineshatter", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19336] = { 0, "Arcane Infused Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19337] = { 0, "The Black Book", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19339] = { 192, "Mind Quickening Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19340] = { 0, "Rune of Metamorphosis", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19341] = { 128, "Lifegiving Gem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19342] = { 0, "Venomous Totem", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19343] = { 0, "Scrolls of Blinding Light", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19344] = { 0, "Natural Alignment Crystal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19345] = { 0, "Aegis of Preservation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19346] = { 116, "Dragonfang Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19347] = { 192, "Claw of Chromaggus", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19348] = { 96, "Red Dragonscale Protector", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Melee" }, ["phase"] = "Three" };
	[19349] = { 136, "Elementium Reinforced Bulwark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19350] = { 36, "Heartstriker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19351] = { 182, "Maladath, Runed Blade of the Black Flight", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19352] = { 230, "Chromatically Tempered Sword", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19353] = { 38, "Drake Talon Cleaver", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19354] = { 38, "Draconic Avenger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19355] = { 85, "Shadow Wing Focus Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19356] = { 298, "Staff of the Shadow Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19357] = { 38, "Herald of Woe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19358] = { 77, "Draconic Maul", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19360] = { 237, "Lok'amir il Romathis", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "Three" };
	[19361] = { 237, "Ashjre'thul, Crossbow of Smiting", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19362] = { 96, "Doom's Edge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19363] = { 273, "Crul'shorukh, Edge of Chaos", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19364] = { 154, "Ashkandi, Greatsword of the Brotherhood", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19365] = { 96, "Claw of the Black Drake", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19366] = { 0, "Master Dragonslayer's Orb", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19367] = { 38, "Dragon's Touch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19368] = { 77, "Dragonbreath Hand Cannon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19369] = { 0, "Gloves of Rapid Evolution", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19370] = { 151, "Mantle of the Blackwing Cabal", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19371] = { 0, "Pendant of the Fallen Dragon", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19372] = { 94, "Helm of Endless Rage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19373] = { 0, "Black Brood Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19374] = { 168, "Bracers of Arcane Accuracy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19375] = { 260, "Mish'undare, Circlet of the Mind Flayer", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "Three" };
	[19376] = { 36, "Archimtiros' Ring of Reckoning", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19377] = { 198, "Prestor's Talisman of Connivery", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19378] = { 50, "Cloak of the Brood Lord", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19379] = { 386, "Neltharion's Tear", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19380] = { 0, "Therazane's Link", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19381] = { 125, "Boots of the Shadow Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19382] = { 259, "Pure Elementium Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Three" };
	[19383] = { 0, "Master Dragonslayer's Medallion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19384] = { 0, "Master Dragonslayer's Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19385] = { 240, "Empowered Leggings", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Three" };
	[19386] = { 58, "Elementium Threaded Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19387] = { 202, "Chromatic Boots", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = "Three" };
	[19388] = { 38, "Angelista's Grasp", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19389] = { 79, "Taut Dragonhide Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19390] = { 79, "Taut Dragonhide Gloves", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "Three" };
	[19390] = { 38, "Taut Dragonhide Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19391] = { 0, "Shimmering Geta", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19392] = { 0, "Girdle of the Fallen Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19393] = { 0, "Primalist's Linked Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19394] = { 130, "Drake Talon Pauldrons", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = "Three" };
	[19395] = { 340, "Rejuvenating Gem", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Three" };
	[19396] = { 65, "Taut Dragonhide Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19397] = { 58, "Ring of Blackrock", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19398] = { 82, "Cloak of Firemaw", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19399] = { 0, "Black Ash Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19400] = { 173, "Firemaw's Clutch", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19401] = { 0, "Primalist's Linked Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19402] = { 136, "Legguards of the Fallen Crusader", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19403] = { 136, "Band of Forced Concentration", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19405] = { 108, "Malfurion's Blessed Bulwark", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19406] = { 278, "Drake Fang Talisman", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19407] = { 115, "Ebony Flame Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19430] = { 58, "Shroud of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Three" };
	[19431] = { 115, "Styleen's Impeding Scarab", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19432] = { 89, "Circle of Applied Force", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19433] = { 0, "Emberweave Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19434] = { 89, "Band of Dark Dominion", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19435] = { 14, "Essence Gatherer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19436] = { 72, "Cloak of Draconic Might", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "Three" };
	[19437] = { 157, "Boots of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Three" };
	[19438] = { 74, "Ringo's Blizzard Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[19439] = { 0, "Interlaced Shadow Jerkin", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};
	[20383] = { 0, "Head of the Broodlord Lashlayer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Three"};

	----------------------
	-------- AQ40 --------
	----------------------
	[20926] = { 250, "Vek'nilash's Circlet", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20927] = { 250, "Ouro's Intact Hide", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20928] = { 250, "Qiraji Bindings of Command", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20929] = { 250, "Carapace of the Old God", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20930] = { 250, "Vek'lor's Diadem", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20931] = { 250, "Skin of the Great Sandworm", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20932] = { 250, "Qiraji Bindings of Dominance", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[20933] = { 250, "Husk of the Old God", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21126] = { 400, "Death's Sting", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21128] = { 0, "Staff of the Qiraji Prophets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21134] = { 200, "Dark Edge of Insanity", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21221] = { 300, "Eye of C'thun", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21232] = { 300, "Imperial Qiraji Armaments", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21237] = { 300, "Imperial Qiraji Regalia", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21579] = { 50, "Vanquished Tentacle of C'thun", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21581] = { 400, "Gauntlets of Annihilation", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21582] = { 400, "Grasp of the Old God", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21583] = { 250, "Cloak of Clarity", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21585] = { 400, "Dark Storm Gauntlets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21586] = { 400, "Belt of Never-ending Agony", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21596] = { 150, "Ring of the Godslayer", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21597] = { 250, "Royal Scepter of Vek'lor", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21598] = { 200, "Royal Qiraji Belt", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21599] = { 0, "Vek'lor's Gloves of Devastation", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21600] = { 300, "Boots of Epiphany", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21601] = { 300, "Ring of Emperor Vek'lor", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21602] = { 350, "Qiraji Execution Bracers", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21603] = { 200, "Wand of the Qiraji Nobility", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21604] = { 300, "Bracelets of Royal Redemption", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21605] = { 200, "Gloves of the Hidden Temple", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21606] = { 50, "Belt of the Fallen Emperor", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21607] = { 50, "Grasp of the Fallen Emperor", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21608] = { 350, "Amulet of Vek'nilash", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21609] = { 150, "Regenerating Belt of Vek'nilash", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21610] = { 200, "Wormscale Blocker", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21611] = { 150, "Burrower Bracers", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21615] = { 300, "Don Rigoberto's Lost Hat", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21616] = { 100, "Huhuran's Stinger", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21617] = { 150, "Wasphide Gauntlets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21618] = { 300, "Hive Defiler Wristguards", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21619] = { 50, "Gloves of the Messiah", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21620] = { 150, "Ring of the Martyr", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21621] = { 200, "Cloak of the Golden Hive", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21622] = { 300, "Sharpened Silithid Femur", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21623] = { 50, "Gauntlets of the Right. Champ", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21624] = { 50, "Gauntlets of Kalimdor", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21625] = { 200, "Scarab Brooch", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21626] = { 0, "Slime-coated Leggings", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21627] = { 0, "Cloak of Untold Secrets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21635] = { 250, "Barb of the Sand Reaver", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21639] = { 200, "Pauldrons of the Unrelenting", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21645] = { 250, "Hive Tunneler's Boots", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21647] = { 200, "Fetish of the Sand Reaver", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21648] = { 0, "Recomposed Boots", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21650] = { 300, "Ancient Qiraji Ripper", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21651] = { 150, "Scaled Sand Reaver Leggings", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21652] = { 0, "Silithid Carapace Chestguard", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21663] = { 300, "Robes of the Guardian Saint", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21664] = { 300, "Barbed Choker", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21665] = { 250, "Mantle of Wicked Revenge", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21666] = { 250, "Sartura's Might", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21667] = { 200, "Legplates of Blazing Light", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21668] = { 0, "Scaled Leggings of Qiraji Fury", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21669] = { 200, "Creeping Vine Helm", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21670] = { 150, "Badge of the Swarmguard", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21671] = { 100, "Robes of the Battleguard", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21672] = { 250, "Gloves of Enforcement", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21673] = { 100, "Silithid Claw", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21674] = { 200, "Gauntlets of Steadfast Determ..", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21675] = { 200, "Thick Qirajihide Belt", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21676] = { 50, "Leggings of the Festering Swa..", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21677] = { 200, "Ring of the Qiraji Fury", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21678] = { 0, "Necklace of Purity", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21679] = { 200, "Kalimdor's Revenge", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21680] = { 200, "Vest of Swift Execution", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21681] = { 50, "Ring of the Devoured", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21682] = { 0, "Bile-Covered Gauntlets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21683] = { 50, "Mantle of the Desert Crusade", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21684] = { 0, "Mantle of the Desert's Fury", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21685] = { 100, "Petrified Scarab", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21686] = { 50, "Mantle of Phrenic Power", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21687] = { 0, "Ukko's Ring of Darkness", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21688] = { 100, "Boots of the Fallen Hero", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21689] = { 50, "Gloves of Ebru", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21690] = { 100, "Angelista's Charm", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21691] = { 0, "Ooze-ridden Gauntlets", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21692] = { 50, "Triad Girdle", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21693] = { 300, "Guise of the Devourer", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21694] = { 150, "Ternary Mantle", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21695] = { 150, "Angelista's Touch", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21696] = { 0, "Robes of the Triumvirate", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21697] = { 0, "Cape of the Trinity", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21698] = { 50, "Leggings of Immersion", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21699] = { 50, "Barrage Shoulders", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21700] = { 150, "Pendant of the Qiraji Guardian", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21701] = { 350, "Cloak of the Concentrated Hatred", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21702] = { 0, "Amulet of Foul Warding", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21703] = { 50, "Hammer of Ji'zhi", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21704] = { 50, "Boots of the Redeemed Prophecy", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21705] = { 50, "Boots of the Fallen Prophet", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21706] = { 50, "Boots of the Unwavering Will", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21707] = { 100, "Ring of Swarming Thought", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21708] = { 0, "Beetle Scaled Wristguards", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21814] = { 300, "Breastplate of Annihilation", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21836] = { 150, "Ritssyn's Ring of Chaos", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21837] = { 300, "Anubisath Warhammer", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21838] = { 0, "Garb of Royal Ascension", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21839] = { 400, "Scepter of the False Prophet", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21856] = { 50, "Neretzek", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21888] = { 200, "Gloves of the Immortal", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21889] = { 50, "Gloves of the Redeemed Prophet", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[21891] = { 50, "Shard of the Fallen Star", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22396] = { 0, "Totem of Life", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22399] = { 100, "Idol of Health", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22402] = { 100, "Libram of Grace", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22730] = { 400, "Eyestalk Waist Cord", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22731] = { 300, "Cloak of the Devoured", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[22732] = { 250, "Mark of C'thun", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[23557] = { 300, "Larvae of the Great Worm", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[23558] = { 50, "The Burrower's Shell", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};
	[23570] = { 300, "Jom Gabbar", ["class"] = {""}, ["role"] = {""}, ["phase"] = "Five"};

	---------------------------
	-------- Naxxramas --------
	---------------------------
	[22349] = { 0, "Desecrated Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22350] = { 0, "Desecrated Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22351] = { 0, "Desecrated Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22352] = { 0, "Desecrated Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22353] = { 0, "Desecrated Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22354] = { 0, "Desecrated Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22355] = { 0, "Desecrated Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22356] = { 0, "Desecrated Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22357] = { 0, "Desecrated Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22358] = { 0, "Desecrated Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22359] = { 0, "Desecrated Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22360] = { 0, "Desecrated Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22361] = { 0, "Desecrated Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22362] = { 0, "Desecrated Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22363] = { 0, "Desecrated Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22364] = { 0, "Desecrated Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22365] = { 0, "Desecrated Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22366] = { 0, "Desecrated Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22367] = { 0, "Desecrated Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22368] = { 0, "Desecrated Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22369] = { 0, "Desecrated Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22370] = { 0, "Desecrated Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22371] = { 0, "Desecrated Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22372] = { 0, "Desecrated Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22416] = { 0, "Dreadnaught Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22417] = { 0, "Dreadnaught Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22418] = { 0, "Dreadnaught Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22419] = { 0, "Dreadnaught Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22420] = { 0, "Dreadnaught Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22421] = { 0, "Dreadnaught Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22422] = { 0, "Dreadnaught Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22423] = { 0, "Dreadnaught Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22424] = { 0, "Redemption Wristguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22425] = { 0, "Redemption Tunic", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22426] = { 0, "Redemption Handguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22427] = { 0, "Redemption Legguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22428] = { 0, "Redemption Headpiece", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22429] = { 0, "Redemption Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22430] = { 0, "Redemption Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22431] = { 0, "Redemption Girdle", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[22436] = { 0, "Cryptstalker Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22437] = { 0, "Cryptstalker Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22438] = { 0, "Cryptstalker Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22439] = { 0, "Cryptstalker Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22440] = { 0, "Cryptstalker Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22441] = { 0, "Cryptstalker Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22442] = { 0, "Cryptstalker Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22443] = { 0, "Cryptstalker Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22464] = { 0, "Earthshatter Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22465] = { 0, "Earthshatter Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22466] = { 0, "Earthshatter Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22467] = { 0, "Earthshatter Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22468] = { 0, "Earthshatter Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22469] = { 0, "Earthshatter Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22470] = { 0, "Earthshatter Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22471] = { 0, "Earthshatter Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22476] = { 0, "Bonescythe Breastplate", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22477] = { 0, "Bonescythe Legplates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22478] = { 0, "Bonescythe Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22479] = { 0, "Bonescythe Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22480] = { 0, "Bonescythe Sabatons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22481] = { 0, "Bonescythe Gauntlets", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22482] = { 0, "Bonescythe Waistguard", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22483] = { 0, "Bonescythe Bracers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22488] = { 0, "Dreamwalker Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22489] = { 0, "Dreamwalker Legguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22490] = { 0, "Dreamwalker Headpiece", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22491] = { 0, "Dreamwalker Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22492] = { 0, "Dreamwalker Boots", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22493] = { 0, "Dreamwalker Handguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22494] = { 0, "Dreamwalker Girdle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22495] = { 0, "Dreamwalker Wristguards", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22496] = { 0, "Frostfire Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22497] = { 0, "Frostfire Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22498] = { 0, "Frostfire Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22499] = { 0, "Frostfire Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22500] = { 0, "Frostfire Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22501] = { 0, "Frostfire Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22502] = { 0, "Frostfire Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22503] = { 0, "Frostfire Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22504] = { 0, "Plagueheart Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22505] = { 0, "Plagueheart Leggings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22506] = { 0, "Plagueheart Circlet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22507] = { 0, "Plagueheart Shoulderpads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22508] = { 0, "Plagueheart Sandals", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22509] = { 0, "Plagueheart Gloves", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22510] = { 0, "Plagueheart Belt", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22511] = { 0, "Plagueheart Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22512] = { 0, "Robe of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22513] = { 0, "Leggings of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22514] = { 0, "Circlet of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22515] = { 0, "Shoulderpads of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22516] = { 0, "Sandals of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22517] = { 0, "Gloves of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22518] = { 0, "Belt of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22519] = { 0, "Bindings of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22520] = { 0, "The Phylactery of Kel'Thuzad", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22691] = { 0, "Corrupted Ashbringer", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "Six" };
	[22733] = { 0, "Staff Head of Atiesh", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22798] = { 0, "Might of Menethil", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22799] = { 0, "Soulseeker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22800] = { 0, "Brimstone Staff", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22801] = { 0, "Spire of Twilight", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22802] = { 0, "Kingsfall", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22803] = { 0, "Midnight Haze", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22804] = { 0, "Maexxna's Fang", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22806] = { 0, "Widow's Remorse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22807] = { 0, "Wraith Blade", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22808] = { 0, "The Castigator", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22809] = { 0, "Maul of the Redeemed Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22810] = { 0, "Toxin Injector", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22811] = { 0, "Soulstring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22812] = { 0, "Nerubian Slavemaker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22813] = { 0, "Claymore of Unholy Might", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22815] = { 0, "Severance", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22816] = { 0, "Hatchet of Sundered Bone", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22818] = { 0, "The Plague Bearer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22819] = { 0, "Shield of Condemnation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22820] = { 0, "Wand of Fates", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22821] = { 0, "Doomfinger", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22935] = { 0, "Touch of Frost", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22936] = { 0, "Wristguards of Vengeance", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "Six" };
	[22937] = { 0, "Gem of Nerubis", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22938] = { 0, "Cryptfiend Silk Cloak", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22939] = { 0, "Band of Unanswered Prayers", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22940] = { 0, "Icebane Pauldrons", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22941] = { 0, "Polar Shoulder Pads", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22942] = { 0, "The Widow's Embrace", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22943] = { 0, "Malice Stone Pendant", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22947] = { 0, "Pendant of Forgotten Names", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22954] = { 0, "Kiss of the Spider", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22960] = { 0, "Cloak of Suturing", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22961] = { 0, "Band of Reanimation", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22967] = { 0, "Icy Scale Spaulders", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22968] = { 0, "Glacial Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22981] = { 0, "Gluth's Missing Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22983] = { 0, "Rime Covered Mantle", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22988] = { 0, "The End of Dreams", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[22994] = { 0, "Digested Hand of Power", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23000] = { 0, "Plated Abomination Ribcage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23001] = { 0, "Eye of Diminution", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23004] = { 0, "Idol of Longevity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23005] = { 0, "Totem of Flowing Water", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23006] = { 0, "Libram of Light", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[23009] = { 0, "Wand of the Whispering Dead", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23014] = { 0, "Iblis, Blade of the Fallen Seraph", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23017] = { 0, "Veil of Eclipse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23018] = { 0, "Signet of the Fallen Defender", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23019] = { 0, "Icebane Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23020] = { 0, "Polar Helmet", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23021] = { 0, "The Soul Harvester's Bindings", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23023] = { 0, "Sadist's Collar", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23025] = { 0, "Seal of the Damned", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23027] = { 0, "Warmth of Forgiveness", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23028] = { 0, "Hailstone Band", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23029] = { 0, "Noth's Frigid Heart", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23030] = { 0, "Cloak of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23031] = { 0, "Band of the Inevitable", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23032] = { 0, "Glacial Headdress", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23033] = { 0, "Icy Scale Coif", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23035] = { 0, "Preceptor's Hat", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23036] = { 0, "Necklace of Necropsy", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23037] = { 0, "Ring of Spiritual Fervor", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23038] = { 0, "Band of Unnatural Forces", ["class"] = { "Warrior", "Paladin", "Rogue" }, ["role"] = { "Melee" }, ["phase"] = "Six" };
	[23039] = { 0, "The Eye of Nerub", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23040] = { 0, "Glyph of Deflection", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23041] = { 0, "Slayer's Crest", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23042] = { 0, "Loatheb's Reflection", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23043] = { 0, "The Face of Death", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23044] = { 0, "Harbinger of Doom", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23045] = { 0, "Shroud of Dominion", ["class"] = { "Warrior", "Paladin", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = "Six" };
	[23046] = { 0, "The Restrained Essence of Sapphiron", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23047] = { 0, "Eye of the Dead", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[23048] = { 0, "Sapphiron's Right Eye", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23049] = { 0, "Sapphiron's Left Eye", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23050] = { 0, "Cloak of the Necropolis", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "Six" };
	[23053] = { 0, "Stormrage's Talisman of Seething", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23054] = { 0, "Gressil, Dawn of Ruin", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23056] = { 0, "Hammer of the Twisting Nether", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[23057] = { 0, "Gem of Trapped Innocents", ["class"] = { "Paladin", "Mage", "Warlock" }, ["role"] = { "Healer", "Caster" }, ["phase"] = "Six" };
	[23059] = { 0, "Ring of the Dreadnaught", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23060] = { 0, "Bonescythe Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23061] = { 0, "Ring of Faith", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23062] = { 0, "Frostfire Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23063] = { 0, "Plagueheart Ring", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23064] = { 0, "Ring of the Dreamwalker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23065] = { 0, "Ring of the Earthshatterer", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23066] = { 0, "Ring of Redemption", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[23067] = { 0, "Ring of the Cryptstalker", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23068] = { 0, "Legplates of Carnage", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23069] = { 0, "Necro-Knight's Garb", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23070] = { 0, "Leggings of Polarity", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23071] = { 0, "Leggings of Apocalypse", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23073] = { 0, "Boots of Displacement", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23075] = { 0, "Death's Bargain", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer" }, ["phase"] = "Six" };
	[23219] = { 0, "Girdle of the Mentor", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = "Six" };
	[23220] = { 0, "Crystal Webbed Robe", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23221] = { 0, "Misplaced Servo Arm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23226] = { 0, "Ghoul Skin Tunic", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23237] = { 0, "Ring of the Eternal Flame", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23238] = { 0, "Stygian Buckler", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23242] = { 0, "Claw of the Frost Wyrm", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23545] = { 0, "Power of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23547] = { 0, "Resilience of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23548] = { 0, "Might of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23549] = { 0, "Fortitude of the Scourge", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23577] = { 0, "The Hungering Cold", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23663] = { 0, "Girdle of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23664] = { 0, "Pauldrons of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23665] = { 0, "Leggings of Elemental Fury", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23666] = { 0, "Belt of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23667] = { 0, "Spaulders of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
	[23668] = { 0, "Leggings of the Grand Crusader", ["class"] = { "" }, ["role"] = { "" }, ["phase"] = "Six"};
}
GoodEPGP.prices = prices

-- Class List
local classList = {"All Classes", "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid", "Priest", "Warlock", "Mage"}

-- Role List
local roleList = {"All Roles", "Tank", "Healer", "Caster", "Melee"}

-- Phase List
local phaseList = {"All Phases", "One", "Two", "Three", "Four", "Five", "Six"}

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
	["Mage"] = { "Caster" }
}

-- Combo lists for role sorting
local validCombos = {
    ["Tank"] = {
        {["class"] = "Warrior", ["spec"] = "Protection"},
        {["class"] = "Druid", ["spec"] = "Feral"}
    },
    ["Healer"] = {
        {["class"] = "Priest", ["spec"] = "Holy"},
        {["class"] = "Priest", ["spec"] = "Discipline"},
        {["class"] = "Druid", ["spec"] = "Restoration"},
        {["class"] = "Paladin", ["spec"] = "Holy"}
    },
    ["Caster"] = {
        {["class"] = "Priest", ["spec"] = "Shadow"},
        {["class"] = "Mage", ["spec"] = "Frost"},
        {["class"] = "Mage", ["spec"] = "Fire"},
        {["class"] = "Mage", ["spec"] = "Arcane"},
        {["class"] = "Warlock", ["spec"] = "Demonology"},
        {["class"] = "Warlock", ["spec"] = "Affliction"},
        {["class"] = "Warlock", ["spec"] = "Destruction"},
        {["class"] = "Druid", ["spec"] = "Balance"}
    },
    ["Melee"] = {
        {["class"] = "Druid", ["spec"] = "Feral"},
        {["class"] = "Warrior", ["spec"] = "Arms"},
        {["class"] = "Warrior", ["spec"] = "Fury"},
        {["class"] = "Rogue", ["spec"] = "Combat"},
        {["class"] = "Rogue", ["spec"] = "Subtlety"},
        {["class"] = "Rogue", ["spec"] = "Assassination"}
    }
}

-- Date format
local dateFormat = "%m/%d/%y @ %I:%M:%S %p"

-- Toggle the display of our prices window
function GoodEPGP:TogglePrices()
	if (GoodEPGP.pricesFrame == nil) then
		GoodEPGP:CreatePricesFrame()
	end

    if (GoodEPGP.pricesFrame:IsVisible()) then
        GoodEPGP.pricesFrame:Hide()
    else
		if (GoodEPGP.menuFrame:IsVisible()) then
			GoodEPGP.menuFrame:Hide()
		end
		if (GoodEPGP.standingsFrame:IsVisible()) then
			GoodEPGP:ToggleStandings()
		end
        GoodEPGP.pricesFrame:Show()
    end
end

function GoodEPGP:ClearPrices() 
	if (GoodEPGP.pricesLinesFrames ~= nil) then
		for key, pricesLine in pairs(GoodEPGP.pricesLinesFrames) do
			for fieldKey, field in pairs(pricesLine) do
				pricesLine["group"].frame:Hide()
			end
		end
	end
end

function GoodEPGP:PriceSearch(item)
	GoodEPGP.ClearPrices()
    -- Attempt to pull up item data via link
    local itemID = GoodEPGP:GetItemID(item)

	GoodEPGPCachedPrices = {}
	
    -- If we couldn't find an item id, try a wildcard check against the price list
    if (itemID == nil) then
        local itemIDs = GoodEPGP:GetWildcardItemIDs(item)
        -- Display the price info for all matching items
        for key, value in pairs(itemIDs) do
            GoodEPGP:DisplayPrice(value, key)
        end
    else
        -- Display the price info for the single matching info.
        GoodEPGP:DisplayPrice(itemID, 0)
    end
end

-- Display the price of an item
function GoodEPGP:DisplayPrice(itemID, index)
    -- Verify we have a passed itemID
    if (itemID == nil) then
        return false
    end

    -- Verify itemID is numeric
    itemID = tonumber(itemID)

    -- Retrieve item info from the database asynchronously
    local item = Item:CreateFromItemID(itemID)
	item:ContinueOnItemLoad(function()
		local itemName, itemLink, _, _, _, _, _, _, _, itemIcon, _, _, _ , _, _, itemSetID = GetItemInfo(itemID)
		local itemPrice = GoodEPGP:GetPrice(itemID)
		local offSpecPrice = tonumber(itemPrice) / 4
		local priceInfo = {
			["itemID"] = itemID,
			["itemName"] = itemName,
			["itemLink"] = itemLink,
			["itemIcon"] = itemIcon,
			["itemSetID"] = itemSetID,
			["itemMSprice"] = itemPrice,
			["itemOSprice"] = offSpecPrice
		}
		table.insert(GoodEPGPCachedPrices, priceInfo)
        GoodEPGP:AddPriceLine(priceInfo, GoodEPGP.pricesScrollFrame, index)
    end)
end



-- Create pricesFrame if it doesn't exist.
function GoodEPGP:CreatePricesFrame()
	if (GoodEPGP.pricesFrame == nil) then

		-- Create parent frame
		GoodEPGP.pricesFrame = AceGUI:Create("Frame")
		GoodEPGP.pricesFrame:SetTitle("GoodEPGP - Item Prices")
		GoodEPGP.pricesFrame:SetLayout("Flow")
		GoodEPGP.pricesFrame:EnableResize(false)
		GoodEPGP.pricesFrame:SetRelativeWidth(1)

		GoodEPGP.priceSearch = AceGUI:Create("EditBox")
		GoodEPGP.priceSearch:SetFullWidth(true)
		GoodEPGP.priceSearch:SetLabel("Search")
		GoodEPGP.priceSearch:SetMaxLetters(30)
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.priceSearch)
		
		GoodEPGP.priceSearch:SetCallback("OnEnterPressed", function(widget)
			GoodEPGP:PriceSearch(widget:GetText())
		end)

		-- Generate table headers
		local headers = {
		  {["label"] = "Item", ["width"] = 300, ["sortColumn"] = "name"},
		  {["label"] = "Main Spec", ["width"] = 100, ["sortColumn"] = "itemMSprice"},
		  {["label"] = "Off Spec", ["width"] = 100, ["sortColumn"] = "itemOSprice"}
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
		GoodEPGP.pricesScrollContainer:AddChild(GoodEPGP.pricesScrollFrame)

		-- Hide the prices frame
		GoodEPGP.pricesFrame:Hide()

		-- Allows closing hitting ESC
		_G["GoodEPGP_Prices"] = GoodEPGP.pricesFrame
		table.insert(UISpecialFrames, "GoodEPGP_Prices")
	end
end

-- Create a single line of prices
function GoodEPGP:AddPriceLine(item, frame, index)

	-- Load more than 50 lines
	if (index > 50) then
		return
	end

	-- Set up a table of pricesFrame lines
	if (GoodEPGP.pricesLinesFrames == nil) then
		GoodEPGP.pricesLinesFrames = {}
	end

	-- Our list of fields and related widths
	local fields = {
		{["field"] = "itemLink", ["width"] = 300},
		{["field"] = "itemMSprice", ["width"] = 100},
		{["field"] = "itemOSprice", ["width"] = 100}
	}

	-- If the key for this index exists, modify it with possible changes to prices and icons. Usually triggered by sorting.
	if (GoodEPGP.pricesLinesFrames[index]) then
		local pricesLine = GoodEPGP.pricesLinesFrames[index]

		pricesLine["group"].frame:Show()

		-- Loop through each of the fields in our line and update them... if applicable
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

				-- Center and Justify Icon
				pricesLabel:ClearAllPoints()
				pricesLabel.frame:SetPoint("TOPLEFT", 4, -4)
			end

			-- Add text to changed prices list
			pricesLabel:SetText(item[field.field])
		end

		-- 2 px between header/status and top/bottom of scroll frame
		GoodEPGP.pricesScrollFrame:ClearAllPoints()
		GoodEPGP.pricesScrollFrame:SetPoint("TOP", GoodEPGP.pricesScrollContainer.frame, "TOP", 0, -2)
		GoodEPGP.pricesScrollFrame:SetPoint("BOTTOM", 0, 2)

		-- Add contrasting background to every other line
        if (index % 2 == 1) then
		else
			pricesLine["group"].frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
            pricesLine["group"].frame:SetBackdropColor(.2, .2, .2, .8)
        end
	else

		-- Our frames didn't already exist - create group
		local pricesLine = {};
		labelGroup = AceGUI:Create("SimpleGroup")
		labelGroup:SetLayout("Flow")
		labelGroup:SetRelativeWidth(1)

		-- Add padding to label group to force a static height
		pricesPadding = AceGUI:Create("Label")
		pricesPadding:SetWidth(1)
		pricesPadding:SetHeight(21)
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
	
	for key, item in pairs(GoodEPGPCachedPrices) do
		GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, key)
	end

end

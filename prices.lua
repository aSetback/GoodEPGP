-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

local prices = {
	-----------------------------
	-------- Molten Core --------
	-----------------------------
	[16826] = { 65, "Nightslayer Gloves" };
	[16830] = { 43, "Cenarion Bracers" };
	[16834] = { 65, "Cenarion Helm" };
	[16838] = { 43, "Earthfury Belt" };
	[16842] = { 65, "Earthfury Helmet" };
	[16846] = { 65, "Giantstalker's Helmet" };
	[16850] = { 43, "Giantstalker's Bracers" };
	[16854] = { 65, "Lawbringer Helm", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16858] = { 43, "Lawbringer Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16862] = { 65, "Sabatons of Might" };
	[16866] = { 65, "Helm of Might" };
	[18703] = { 0, "Ancient Petrified Leaf" };
	[18803] = { 65, "Finkle's Lava Dredger" };
	[18811] = { 0, "Fireproof Cloak" };
	[18815] = { 0, "Essence of the Pure Flame" };
	[18564] = { 250, "Bindings of the Windseeker" };
	[18823] = { 86, "Aged Core Leather Gloves" };
	[16795] = { 0, "Arcanist Crown" };
	[16799] = { 43, "Arcanist Bindings" };
	[16803] = { 65, "Felheart Slippers" };
	[16807] = { 65, "Felheart Shoulder Pads" };
	[16811] = { 65, "Boots of Prophecy" };
	[16815] = { 86, "Robes of Prophecy" };
	[16819] = { 43, "Vambraces of Prophecy" };
	[16823] = { 65, "Nightslayer Shoulder Pads" };
	[16827] = { 43, "Nightslayer Belt" };
	[16831] = { 65, "Cenarion Gloves" };
	[16835] = { 65, "Cenarion Leggings" };
	[16839] = { 65, "Earthfury Gauntlets" };
	[16843] = { 65, "Earthfury Legguards" };
	[16847] = { 65, "Giantstalker's Leggings" };
	[16851] = { 43, "Giantstalker's Belt" };
	[16855] = { 65, "Lawbringer Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16859] = { 65, "Lawbringer Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16863] = { 65, "Gauntlets of Might" };
	[16867] = { 65, "Legplates of Might" };
	[18808] = { 0, "Gloves of the Hypnotic Flame" };
	[18812] = { 151, "Wristguards of True Flight" };
	[18816] = { 288, "Perdition's Blade" };
	[18820] = { 259, "Talisman of Ephemeral Power" };
	[18824] = { 43, "Magma Tempered Boots" };
	[18832] = { 173, "Brutality Blade" };
	[16796] = { 65, "Arcanist Leggings" };
	[16800] = { 65, "Arcanist Boots" };
	[16804] = { 43, "Felheart Bracers" };
	[16808] = { 65, "Felheart Horns" };
	[16812] = { 65, "Gloves of Prophecy" };
	[16816] = { 65, "Mantle of Prophecy" };
	[16820] = { 86, "Nightslayer Chestpiece" };
	[16824] = { 65, "Nightslayer Boots" };
	[16828] = { 43, "Cenarion Belt" };
	[18872] = { 0, "Manastorm Leggings" };
	[16836] = { 65, "Cenarion Spaulders" };
	[16840] = { 43, "Earthfury Bracers" };
	[16844] = { 65, "Earthfury Epaulets" };
	[16848] = { 65, "Giantstalker's Epaulets" };
	[16852] = { 65, "Giantstalker's Gloves" };
	[16856] = { 65, "Lawbringer Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16860] = { 65, "Lawbringer Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16864] = { 43, "Belt of Might" };
	[16868] = { 65, "Pauldrons of Might" };
	[16665] = { 65, "Tome of Tranquilizing Shot" };
	[18203] = { 86, "Eskhandar's Right Claw" };
	[18805] = { 230, "Core Hound Tooth" };
	[18809] = { 86, "Sash of Whispered Secrets" };
	[18817] = { 216, "Crown of Destruction" };
	[18821] = { 259, "Quick Strike Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[18829] = { 108, "Deep Earth Spaulders" };
	[16797] = { 65, "Arcanist Mantle" };
	[16801] = { 65, "Arcanist Gloves" };
	[16805] = { 65, "Felheart Gloves" };
	[16809] = { 86, "Felheart Robes" };
	[16813] = { 65, "Circlet of Prophecy" };
	[16817] = { 43, "Girdle of Prophecy" };
	[16821] = { 65, "Nightslayer Cover" };
	[16825] = { 43, "Nightslayer Bracelets" };
	[16829] = { 65, "Cenarion Boots" };
	[16833] = { 86, "Cenarion Vestments" };
	[16837] = { 65, "Earthfury Boots" };
	[16841] = { 86, "Earthfury Vestments" };
	[16845] = { 86, "Giantstalker's Breastplate" };
	[16849] = { 65, "Giantstalker's Boots" };
	[16853] = { 86, "Lawbringer Chestguard", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[16857] = { 43, "Lawbringer Bracers", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee"}, ["phase"] = 1 };
	[16861] = { 43, "Bracers of Might" };
	[16865] = { 86, "Breastplate of Might" };
	[19147] = { 202, "Ring of Spell Power" };
	[19146] = { 58, "Wristguards of Stability", ["class"] = { "Warrior", "Paladin", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[19145] = { 302, "Robe of Volatile Power", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[19144] = { 65, "Sabatons of the Flamewalker" };
	[19143] = { 101, "Flameguard Gauntlets", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };
	[19142] = { 65, "Fire Runed Grimoire" };
	[19140] = { 202, "Cauterizing Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[19139] = { 0, "Fireguard Shoulders" };
	[19138] = { 0, "Band of Sulfuras" };
	[19137] = { 346, "Onslaught Girdle", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };
	[19136] = { 202, "Mana Igniting Cord" };
	[18879] = { 162, "Heavy Dark Iron Ring" };
	[18878] = { 86, "Sorcerous Dagger" };
	[18875] = { 227, "Salamander Scale Pants", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[18870] = { 43, "Helm of the Lifegiver" };
	[17204] = { 0, "Eye of Sulfuras", ["class"] = { "Warrior", "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 1 };
	[18861] = { 0, "Flamewaker Legplates" };
	[18842] = { 130, "Staff of Dominance" };
	[17072] = { 119, "Blastershot Launcher" };
	[17074] = { 0, "Shadowstrike" };
	[17076] = { 158, "Bonereaver's Edge" };
	[17077] = { 0, "Crimson Shocker" };
	[18646] = { 0, "The Eye of Divinity" };
	[17065] = { 194, "Medallion of Steadfast Might" };
	[17110] = { 43, "Seal of the Archmagus" };
	[17109] = { 43, "Choker of Enlightenment" };
	[17107] = { 86, "Dragon's Blood Cape" };
	[17106] = { 0, "Malistar's Defender", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[17105] = { 119, "Aurastone Hammer", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster", "Melee" }, ["phase"] = 1 };
	[17104] = { 108, "Spinal Reaper" };
	[17103] = { 202, "Azuresong Mageblade", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[17102] = { 108, "Cloak of the Shrouded Mists" };
	[17082] = { 0, "Shard of the Flame" };
	[18806] = { 22, "Core Forged Greaves" };
	[18810] = { 259, "Wild Growth Spaulders", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer" }, ["phase"] = 1 };
	[18814] = { 302, "Choker of the Fire Lord", ["class"] = { "Paladin", "Shaman", "Druid", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[18563] = { 250, "Bindings of the Windseeker" };
	[18822] = { 65, "Obsidian Edged Blade" };
	[17071] = { 0, "Gutgore Ripper" };
	[17069] = { 288, "Striker's Mark" };
	[17066] = { 130, "Drillborer Disk" };
	[16798] = { 86, "Arcanist Robes" };
	[16802] = { 43, "Arcanist Belt" };
	[16806] = { 43, "Felheart Belt" };
	[16810] = { 65, "Felheart Pants" };
	[16814] = { 65, "Pants of Prophecy" };
	[16954] = { 100, "Judgement Legplates", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 1 };
	[17073] = { 65, "Earthshaker" };
	[16822] = { 65, "Nightslayer Pants" };
	[17063] = { 346, "Band of Accuria", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 1 };

	--------------------------------
	-------- Outdoor Bosses --------
	--------------------------------
	[18403] = { 216, "Dragonslayer's Signet" };
	[18665] = { 0, "The Eye of Shadow" };
	[18542] = { 54, "Typhoon" };
	[18544] = { 90, "Doomhide Gauntlets" };
	[18546] = { 108, "Infernal Headcage" };
	[20580] = { 144, "Hammer of Bestial Fury" };
	[18423] = { 216, "Head of Onyxia" };
	[20600] = { 18, "Malfurion's Signet Ring" };
	[18705] = { 0, "Mature Black Dragon Sinew" };
	[20616] = { 72, "Dragonbone Wristguards" };
	[18205] = { 72, "Eskhandar's Collar" };
	[17064] = { 234, "Shard of the Scale", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 1 };
	[20622] = { 90, "Dragonheart Necklace" };
	[17068] = { 144, "Deathbringer" };
	[17070] = { 162, "Fang of the Mystics" };
	[20628] = { 243, "Deviate Growth Cap" };
	[20630] = { 45, "Gauntlets of the Shining Light" };
	[20632] = { 90, "Mindtear Band" };
	[17078] = { 90, "Sapphiron Drape" };
	[20636] = { 234, "Hibernation Crystal" };
	[20638] = { 144, "Leggings of the Demented Mind" };
	[20644] = { 18, "Nightmare Engulfed Object" };
	[19130] = { 207, "Cold Snap" };
	[19132] = { 270, "Crystal Adorned Crown", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 2 };
	[19134] = { 72, "Flayed Doomguard Belt" };
	[17112] = { 90, "Empyrean Demolisher" };
	[18404] = { 216, "Onyxia Tooth Pendant", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Druid" }, ["role"] = { "Melee", "Caster" }, ["phase"] = 1 };
	[16955] = { 100, "Judgement Crown", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 1 };
	[18406] = { 216, "Onyxia Blood Talisman" };
	[18541] = { 234, "Puissant Cape" };
	[18543] = { 54, "Ring of Entropy" };
	[18545] = { 18, "Leggings of Arcane Supremacy" };
	[18547] = { 18, "Unmelting Ice Girdle" };
	[18422] = { 0, "Head of Onyxia" };
	[18813] = { 18, "Ring of Binding" };
	[20599] = { 126, "Polished Ironwood Crossbow" };
	[18704] = { 0, "Mature Blue Dragon Sinew" };
	[18202] = { 90, "Eskhandar's Left Claw" };
	[18204] = { 54, "Eskhandar's Pelt" };
	[20619] = { 18, "Acid Inscribed Greaves" };
	[18208] = { 54, "Drape of Benediction" };
	[17067] = { 54, "Ancient Cornerstone Grimoire" };
	[20625] = { 18, "Belt of the Dark Bog" };
	[20627] = { 225, "Dark Heart Pants" };
	[20629] = { 54, "Malignant Footguards" };
	[17075] = { 108, "Vis'kag the Bloodletter" };
	[20633] = { 18, "Unnatural Leather Spaulders" };
	[20635] = { 162, "Jade Inlaid Vestments" };
	[20637] = { 18, "Acid Inscribed Pauldrons" };
	[20639] = { 54, "Strangely Glyphed Legplates" };
	[20634] = { 108, "Boots of Fright" };
	[20631] = { 180, "Mendicant's Slippers" };
	[20626] = { 90, "Black Bark Wristbands" };
	[20624] = { 108, "Ring of the Unliving" };
	[20623] = { 144, "Circlet of Restless Dreams" };
	[19131] = { 252, "Snowblind Shoes" };
	[19133] = { 243, "Fel Infused Leggings" };
	[19135] = { 54, "Blacklight Bracer" };
	[20621] = { 108, "Boots of the Endless Moor" };
	[20618] = { 180, "Gloves of Delusional Power" };
	[20617] = { 126, "Ancient Corroded Leggings" };
	[17111] = { 72, "Blazefury Medallion" };
	[17113] = { 108, "Amberseal Keeper" };
	[20615] = { 72, "Dragonspur Wraps" };
	[20582] = { 90, "Trance Stone" };
	[20581] = { 180, "Staff of Rampant Growth" };
	[20579] = { 18, "Green Dragonskin Cloak" };
	[20578] = { 162, "Emerald Dragonfang" };
	[20577] = { 162, "Nightmare Blade" };

	--------------------------------
	-------- Blackwing Lair --------
	--------------------------------
	[19376] = { 60, "Archimtiros' Ring of Reckoning" };
	[19380] = { 0, "Therazane's Link", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19384] = { 0, "Master Dragonslayer's Ring", ["class"] = { "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19388] = { 48, "Angelista's Grasp" };
	[19392] = { 0, "Girdle of the Fallen Crusader" };
	[19396] = { 108, "Taut Dragonhide Belt" };
	[19400] = { 216, "Firemaw's Clutch" };
	[19432] = { 148, "Circle of Applied Force", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19436] = { 120, "Cloak of Draconic Might", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[16898] = { 150, "Stormrage Boots" };
	[16902] = { 100, "Stormrage Pauldrons" };
	[16906] = { 100, "Bloodfang Boots" };
	[16910] = { 150, "Bloodfang Belt" };
	[16914] = { 100, "Netherwind Crown" };
	[16918] = { 100, "Netherwind Bindings" };
	[16922] = { 150, "Leggings of Transcendence" };
	[16926] = { 150, "Bindings of Transcendence" };
	[16930] = { 150, "Nemesis Leggings" };
	[16934] = { 100, "Nemesis Bracers" };
	[16938] = { 150, "Dragonstalker's Legguards" };
	[16942] = { 150, "Dragonstalker's Breastplate" };
	[16946] = { 96, "Legplates of Ten Storms" };
	[16950] = { 144, "Breastplate of Ten Storms" };
	[16958] = { 100, "Judgement Breastplate", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16962] = { 150, "Legplates of Wrath" };
	[16966] = { 150, "Breastplate of Wrath" };
	[19337] = { 0, "The Black Book" };
	[19341] = { 160, "Lifegiving Gem" };
	[19345] = { 0, "Aegis of Preservation" };
	[19349] = { 170, "Elementium Reinforced Bulwark" };
	[19353] = { 48, "Drake Talon Cleaver" };
	[19357] = { 48, "Herald of Woe" };
	[19361] = { 296, "Ashjre'thul, Crossbow of Smiting" };
	[19365] = { 120, "Claw of the Black Drake" };
	[19369] = { 0, "Gloves of Rapid Evolution" };
	[19373] = { 0, "Black Brood Pauldrons" };
	[19377] = { 248, "Prestor's Talisman of Connivery" };
	[19381] = { 156, "Boots of the Shadow Flame" };
	[19385] = { 300, "Empowered Leggings", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19389] = { 132, "Taut Dragonhide Shoulderpads" };
	[19390] = { 132, "Taut Dragonhide Gloves", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19393] = { 0, "Primalist's Linked Waistguard" };
	[19397] = { 96, "Ring of Blackrock" };
	[19401] = { 0, "Primalist's Linked Legguards" };
	[19405] = { 180, "Malfurion's Blessed Bulwark" };
	[19433] = { 0, "Emberweave Leggings" };
	[19437] = { 196, "Boots of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[16899] = { 150, "Stormrage Handguards" };
	[16903] = { 100, "Stormrage Belt" };
	[16907] = { 100, "Bloodfang Gloves" };
	[16911] = { 150, "Bloodfang Bracers" };
	[16915] = { 150, "Netherwind Pants" };
	[16919] = { 100, "Boots of Transcendence" };
	[16923] = { 150, "Robes of Transcendence" };
	[16927] = { 100, "Nemesis Boots" };
	[16931] = { 150, "Nemesis Robes" };
	[16935] = { 150, "Dragonstalker's Bracers" };
	[16939] = { 150, "Dragonstalker's Helm" };
	[16943] = { 84, "Bracers of Ten Storms" };
	[16947] = { 120, "Helmet of Ten Storms" };
	[16951] = { 100, "Judgement Bindings", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16959] = { 150, "Bracelets of Wrath" };
	[16963] = { 100, "Helm of Wrath" };
	[19334] = { 220, "The Untamed Blade", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19342] = { 0, "Venomous Totem" };
	[19346] = { 144, "Dragonfang Blade" };
	[19350] = { 60, "Heartstriker" };
	[19354] = { 48, "Draconic Avenger" };
	[19358] = { 96, "Draconic Maul" };
	[19362] = { 120, "Doom's Edge" };
	[19366] = { 0, "Master Dragonslayer's Orb" };
	[19370] = { 252, "Mantle of the Blackwing Cabal" };
	[19374] = { 280, "Bracers of Arcane Accuracy" };
	[19378] = { 84, "Cloak of the Brood Lord" };
	[16832] = { 100, "Bloodfang Spaulders" };
	[19386] = { 96, "Elementium Threaded Cloak" };
	[19390] = { 48, "Taut Dragonhide Gloves" };
	[19394] = { 216, "Drake Talon Pauldrons", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 3 };
	[19398] = { 136, "Cloak of Firemaw" };
	[19402] = { 226, "Legguards of the Fallen Crusader", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 3 };
	[19406] = { 348, "Drake Fang Talisman" };
	[19430] = { 96, "Shroud of Pure Thought", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19434] = { 148, "Band of Dark Dominion" };
	[19438] = { 124, "Ringo's Blizzard Boots" };
	[16900] = { 100, "Stormrage Cover" };
	[16904] = { 150, "Stormrage Bracers" };
	[16908] = { 150, "Bloodfang Hood" };
	[16912] = { 100, "Netherwind Boots" };
	[16916] = { 100, "Netherwind Robes" };
	[16920] = { 150, "Handguards of Transcendence" };
	[16924] = { 150, "Pauldrons of Transcendence" };
	[16928] = { 100, "Nemesis Gloves" };
	[16932] = { 100, "Nemesis Spaulders" };
	[16936] = { 150, "Dragonstalker's Belt" };
	[16940] = { 150, "Dragonstalker's Gauntlets" };
	[16944] = { 96, "Belt of Ten Storms" };
	[16948] = { 96, "Gauntlets of Ten Storms" };
	[16952] = { 100, "Judgement Belt", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16956] = { 100, "Judgement Gauntlets", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16960] = { 100, "Waistband of Wrath" };
	[16964] = { 150, "Gauntlets of Wrath" };
	[19335] = { 96, "Spineshatter" };
	[19339] = { 240, "Mind Quickening Gem" };
	[19343] = { 0, "Scrolls of Blinding Light" };
	[19347] = { 240, "Claw of Chromaggus" };
	[19351] = { 228, "Maladath, Runed Blade of the Black Flight" };
	[19355] = { 106, "Shadow Wing Focus Staff" };
	[19363] = { 216, "Crul'shorukh, Edge of Chaos" };
	[19367] = { 48, "Dragon's Touch" };
	[19371] = { 0, "Pendant of the Fallen Dragon" };
	[19375] = { 325, "Mish'undare, Circlet of the Mind Flayer", ["class"] = { "Paladin", "Shaman", "Druid", "Priest", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19379] = { 482, "Neltharion's Tear" };
	[19383] = { 0, "Master Dragonslayer's Medallion" };
	[19387] = { 252, "Chromatic Boots", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Tank", "Melee" }, ["phase"] = 3 };
	[19391] = { 0, "Shimmering Geta" };
	[19395] = { 425, "Rejuvenating Gem", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19399] = { 0, "Black Ash Robe" };
	[19403] = { 226, "Band of Forced Concentration" };
	[19407] = { 192, "Ebony Flame Gloves" };
	[19431] = { 192, "Styleen's Impeding Scarab" };
	[19435] = { 24, "Essence Gatherer" };
	[19439] = { 0, "Interlaced Shadow Jerkin" };
	[16897] = { 100, "Stormrage Chestguard" };
	[16901] = { 100, "Stormrage Legguards" };
	[16905] = { 150, "Bloodfang Chestpiece" };
	[16909] = { 150, "Bloodfang Pants" };
	[16913] = { 150, "Netherwind Gloves" };
	[16917] = { 100, "Netherwind Mantle" };
	[16921] = { 150, "Halo of Transcendence" };
	[16925] = { 150, "Belt of Transcendence" };
	[16929] = { 100, "Nemesis Skullcap" };
	[16933] = { 150, "Nemesis Belt" };
	[16937] = { 150, "Dragonstalker's Spaulders" };
	[16941] = { 150, "Dragonstalker's Greaves" };
	[16945] = { 120, "Epaulets of Ten Storms" };
	[16949] = { 96, "Greaves of Ten Storms" };
	[16953] = { 100, "Judgement Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16957] = { 100, "Judgement Sabatons", ["class"] = { "Paladin" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[16961] = { 100, "Pauldrons of Wrath" };
	[16965] = { 150, "Sabatons of Wrath" };
	[20383] = { 0, "Head of the Broodlord Lashlayer" };
	[19382] = { 324, "Pure Elementium Band", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 3 };
	[19003] = { 156, "Head of Nefarian" };
	[19368] = { 96, "Dragonbreath Hand Cannon" };
	[19336] = { 0, "Arcane Infused Gem" };
	[19340] = { 0, "Rune of Metamorphosis" };
	[19344] = { 0, "Natural Alignment Crystal" };
	[19348] = { 160, "Red Dragonscale Protector", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer", "Melee" }, ["phase"] = 3 };
	[19352] = { 288, "Chromatically Tempered Sword" };
	[19356] = { 372, "Staff of the Shadow Flame" };
	[19360] = { 296, "Lok'amir il Romathis", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 3 };
	[19364] = { 192, "Ashkandi, Greatsword of the Brotherhood" };
	[16818] = { 100, "Netherwind Belt" };
	[19372] = { 156, "Helm of Endless Rage" };
	[19002] = { 0, "Head of Nefarian" };

	----------------------
	-------- AQ40 --------
	----------------------
	[21671] = { 0, "Robes of the Battleguard" };
	[21675] = { 0, "Thick Qirajihide Belt" };
	[21679] = { 0, "Kalimdor's Revenge" };
	[21683] = { 0, "Mantle of the Desert Crusade" };
	[21687] = { 0, "Ukko's Ring of Darkness" };
	[20926] = { 0, "Vek'nilash's Circlet" };
	[20930] = { 0, "Vek'lor's Diadem" };
	[21699] = { 0, "Barrage Shoulders" };
	[21703] = { 0, "Hammer of Ji'zhi" };
	[21707] = { 0, "Ring of Swarming Thought" };
	[22731] = { 0, "Cloak of the Devoured" };
	[21221] = { 0, "Eye of C'Thun" };
	[21237] = { 0, "Imperial Qiraji Regalia" };
	[21269] = { 0, "Blessed Qiraji Bulwark" };
	[21273] = { 0, "Blessed Qiraji Acolyte Staff" };
	[21329] = { 0, "Conqueror's Crown" };
	[21333] = { 0, "Conqueror's Greaves" };
	[21337] = { 0, "Doomcaller's Circlet" };
	[21596] = { 0, "Ring of the Godslayer" };
	[21345] = { 0, "Enigma Shoulderpads" };
	[21349] = { 0, "Footwraps of the Oracle" };
	[21353] = { 0, "Genesis Helm" };
	[21357] = { 0, "Genesis Vest" };
	[21361] = { 0, "Deathdealer's Spaulders" };
	[21365] = { 0, "Striker's Footguards" };
	[21624] = { 0, "Gauntlets of Kalimdor" };
	[21373] = { 0, "Stormcaller's Footguards" };
	[21126] = { 0, "Death's Sting" };
	[21134] = { 0, "Dark Edge of Insanity", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21648] = { 0, "Recomposed Boots" };
	[21652] = { 0, "Silithid Carapace Chestguard" };
	[21664] = { 0, "Barbed Choker" };
	[21668] = { 0, "Scaled Leggings of Qiraji Fury" };
	[21672] = { 0, "Gloves of Enforcement" };
	[21676] = { 0, "Leggings of the Festering Swarm" };
	[21680] = { 0, "Vest of Swift Execution" };
	[21684] = { 0, "Mantle of the Desert's Fury" };
	[21688] = { 0, "Boots of the Fallen Hero" };
	[20927] = { 0, "Ouro's Intact Hide" };
	[20931] = { 0, "Skin of the Great Sandworm" };
	[21700] = { 0, "Pendant of the Qiraji Guardian" };
	[21704] = { 0, "Boots of the Redeemed Prophecy" };
	[21708] = { 0, "Beetle Scaled Wristguards" };
	[21712] = { 0, "Amulet of the Fallen God" };
	[21242] = { 0, "Blessed Qiraji War Axe" };
	[23557] = { 0, "Larvae of the Great Worm" };
	[21581] = { 0, "Gauntlets of Annihilation" };
	[21330] = { 0, "Conqueror's Spaulders" };
	[21334] = { 0, "Doomcaller's Robes" };
	[21338] = { 0, "Doomcaller's Footwraps" };
	[21597] = { 0, "Royal Scepter of Vek'lor" };
	[21346] = { 0, "Enigma Leggings" };
	[21350] = { 0, "Mantle of the Oracle" };
	[21354] = { 0, "Genesis Shoulderpads" };
	[21362] = { 0, "Deathdealer's Leggings" };
	[21366] = { 0, "Striker's Diadem" };
	[21370] = { 0, "Striker's Hauberk" };
	[21374] = { 0, "Stormcaller's Hauberk" };
	[21888] = { 0, "Gloves of the Immortal" };
	[22402] = { 0, "Libram of Grace", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21390] = { 0, "Avenger's Legguards", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21665] = { 0, "Mantle of Wicked Revenge" };
	[21669] = { 0, "Creeping Vine Helm" };
	[21673] = { 0, "Silithid Claw" };
	[21677] = { 0, "Ring of the Qiraji Fury" };
	[21681] = { 0, "Ring of the Devoured" };
	[21685] = { 0, "Petrified Scarab" };
	[21689] = { 0, "Gloves of Ebru" };
	[20928] = { 0, "Qiraji Bindings of Command" };
	[20932] = { 0, "Qiraji Bindings of Dominance" };
	[21701] = { 0, "Cloak of Concentrated Hatred", ["class"] = { "Warrior", "Paladin", "Rogue", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21705] = { 0, "Boots of the Fallen Prophet" };
	[21709] = { 0, "Ring of the Fallen God" };
	[23558] = { 0, "The Burrower's Shell" };
	[23570] = { 0, "Jom Gabbar" };
	[22732] = { 0, "Mark of C'Thun" };
	[21275] = { 0, "Blessed Qiraji Augur Staff" };
	[22730] = { 0, "Eyestalk Waist Cord" };
	[22399] = { 0, "Idol of Health" };
	[22396] = { 0, "Totem of Life" };
	[21891] = { 0, "Shard of the Fallen Star" };
	[21695] = { 0, "Angelista's Touch" };
	[21856] = { 0, "Neretzek, The Blood Drinker" };
	[21839] = { 0, "Scepter of the False Prophet", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21838] = { 0, "Garb of Royal Ascension" };
	[21837] = { 0, "Anubisath Warhammer" };
	[21836] = { 0, "Ritssyn's Ring of Chaos" };
	[21609] = { 0, "Regenerating Belt of Vek'nilash" };
	[21693] = { 0, "Guise of the Devourer" };
	[21582] = { 0, "Grasp of the Old God", ["class"] = { "Paladin", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21331] = { 0, "Conqueror's Breastplate" };
	[21335] = { 0, "Doomcaller's Mantle" };
	[21694] = { 0, "Ternary Mantle" };
	[21343] = { 0, "Enigma Robes" };
	[21347] = { 0, "Enigma Circlet" };
	[21351] = { 0, "Vestments of the Oracle" };
	[21355] = { 0, "Genesis Boots" };
	[21359] = { 0, "Deathdealer's Boots" };
	[21618] = { 0, "Hive Defiler Wristguards", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21367] = { 0, "Striker's Pauldrons" };
	[21626] = { 0, "Slime-coated Leggings" };
	[21375] = { 0, "Stormcaller's Leggings" };
	[21889] = { 0, "Gloves of the Redeemed Prophecy" };
	[21128] = { 0, "Staff of the Qiraji Prophets" };
	[21387] = { 0, "Avenger's Crown", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21391] = { 0, "Avenger's Pauldrons", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21650] = { 0, "Ancient Qiraji Ripper" };
	[21698] = { 0, "Leggings of Immersion" };
	[21697] = { 0, "Cape of the Trinity" };
	[21696] = { 0, "Robes of the Triumvirate" };
	[21666] = { 0, "Sartura's Might", ["class"] = { "Paladin", "Shaman", "Druid" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21670] = { 0, "Badge of the Swarmguard" };
	[21674] = { 0, "Gauntlets of Steadfast Determination" };
	[21678] = { 0, "Necklace of Purity" };
	[21682] = { 0, "Bile-Covered Gauntlets" };
	[21686] = { 0, "Mantle of Phrenic Power" };
	[21690] = { 0, "Angelista's Charm" };
	[20929] = { 0, "Carapace of the Old God" };
	[20933] = { 0, "Husk of the Old God" };
	[21702] = { 0, "Amulet of Foul Warding" };
	[21706] = { 0, "Boots of the Unwavering Will" };
	[21710] = { 0, "Cloak of the Fallen God" };
	[21692] = { 0, "Triad Girdle" };
	[21691] = { 0, "Ooze-ridden Gauntlets" };
	[21586] = { 0, "Belt of Never-ending Agony" };
	[21389] = { 0, "Avenger's Breastplate", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21600] = { 0, "Boots of Epiphany" };
	[21601] = { 0, "Ring of Emperor Vek'lor" };
	[21645] = { 0, "Hive Tunneler's Boots" };
	[21232] = { 0, "Imperial Qiraji Armaments" };
	[21602] = { 0, "Qiraji Execution Bracers" };
	[21603] = { 0, "Wand of Qiraji Nobility" };
	[21244] = { 0, "Blessed Qiraji Pugio" };
	[21627] = { 0, "Cloak of Untold Secrets" };
	[21625] = { 0, "Scarab Brooch" };
	[21623] = { 0, "Gauntlets of the Righteous Champion", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21622] = { 0, "Sharpened Silithid Femur" };
	[21621] = { 0, "Cloak of the Golden Hive" };
	[21268] = { 0, "Blessed Qiraji War Hammer" };
	[21272] = { 0, "Blessed Qiraji Musket" };
	[21620] = { 0, "Ring of the Martyr", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21619] = { 0, "Gloves of the Messiah" };
	[21617] = { 0, "Wasphide Gauntlets" };
	[21616] = { 0, "Huhuran's Stinger" };
	[21615] = { 0, "Don Rigoberto's Lost Hat" };
	[21611] = { 0, "Burrower Bracers" };
	[21610] = { 0, "Wormscale Blocker" };
	[21814] = { 0, "Breastplate of Annihilation" };
	[21608] = { 0, "Amulet of Vek'nilash" };
	[21607] = { 0, "Grasp of the Fallen Emperor" };
	[21606] = { 0, "Belt of the Fallen Emperor" };
	[21605] = { 0, "Gloves of the Hidden Temple" };
	[21579] = { 0, "Vanquished Tentacle of C'Thun" };
	[21583] = { 0, "Cloak of Clarity", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21332] = { 0, "Conqueror's Legguards" };
	[21336] = { 0, "Doomcaller's Trousers" };
	[21604] = { 0, "Bracelets of Royal Redemption", ["class"] = { "Paladin", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21344] = { 0, "Enigma Boots" };
	[21348] = { 0, "Tiara of the Oracle" };
	[21352] = { 0, "Trousers of the Oracle" };
	[21356] = { 0, "Genesis Trousers" };
	[21360] = { 0, "Deathdealer's Helm" };
	[21364] = { 0, "Deathdealer's Vest" };
	[21368] = { 0, "Striker's Leggings" };
	[21372] = { 0, "Stormcaller's Diadem" };
	[21376] = { 0, "Stormcaller's Pauldrons" };
	[21635] = { 0, "Barb of the Sand Reaver" };
	[21639] = { 0, "Pauldrons of the Unrelenting" };
	[21388] = { 0, "Avenger's Greaves", ["class"] = { "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 5 };
	[21647] = { 0, "Fetish of the Sand Reaver" };
	[21651] = { 0, "Scaled Sand Reaver Leggings" };
	[21599] = { 0, "Vek'lor's Gloves of Devastation" };
	[21598] = { 0, "Royal Qiraji Belt" };
	[21663] = { 0, "Robes of the Guardian Saint", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21667] = { 0, "Legplates of Blazing Light", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 5 };
	[21585] = { 0, "Dark Storm Gauntlets" };

	---------------------------
	-------- Naxxramas --------
	---------------------------
	[22436] = { 0, "Cryptstalker Tunic" };
	[22440] = { 0, "Cryptstalker Boots" };
	[22954] = { 0, "Kiss of the Spider" };
	[23221] = { 0, "Misplaced Servo Arm" };
	[22464] = { 0, "Earthshatter Tunic" };
	[22468] = { 0, "Earthshatter Boots" };
	[23237] = { 0, "Ring of the Eternal Flame" };
	[22476] = { 0, "Bonescythe Breastplate" };
	[22480] = { 0, "Bonescythe Sabatons" };
	[22994] = { 0, "Digested Hand of Power" };
	[22488] = { 0, "Dreamwalker Tunic" };
	[22492] = { 0, "Dreamwalker Boots" };
	[22496] = { 0, "Frostfire Robe" };
	[22500] = { 0, "Frostfire Sandals" };
	[22504] = { 0, "Plagueheart Robe" };
	[22508] = { 0, "Plagueheart Sandals" };
	[22512] = { 0, "Robe of Faith" };
	[22516] = { 0, "Sandals of Faith" };
	[22520] = { 0, "The Phylactery of Kel'Thuzad" };
	[23038] = { 0, "Band of Unnatural Forces", ["class"] = { "Warrior", "Paladin", "Rogue" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[23042] = { 0, "Loatheb's Reflection" };
	[23046] = { 0, "The Restrained Essence of Sapphiron" };
	[23050] = { 0, "Cloak of the Necropolis", ["class"] = { "Paladin", "Warlock", "Mage" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 6 };
	[22799] = { 0, "Soulseeker" };
	[22803] = { 0, "Midnight Haze" };
	[22807] = { 0, "Wraith Blade" };
	[22811] = { 0, "Soulstring" };
	[22815] = { 0, "Severance" };
	[22819] = { 0, "Shield of Condemnation" };
	[22349] = { 0, "Desecrated Breastplate" };
	[22353] = { 0, "Desecrated Helmet" };
	[22357] = { 0, "Desecrated Gauntlets" };
	[22361] = { 0, "Desecrated Spaulders" };
	[22365] = { 0, "Desecrated Boots" };
	[22369] = { 0, "Desecrated Bindings" };
	[23664] = { 0, "Pauldrons of Elemental Fury" };
	[23668] = { 0, "Leggings of the Grand Crusader" };
	[22417] = { 0, "Dreadnaught Legplates" };
	[22421] = { 0, "Dreadnaught Gauntlets" };
	[22425] = { 0, "Redemption Tunic", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22429] = { 0, "Redemption Spaulders", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22943] = { 0, "Malice Stone Pendant" };
	[22437] = { 0, "Cryptstalker Legguards" };
	[22441] = { 0, "Cryptstalker Handguards" };
	[22967] = { 0, "Icy Scale Spaulders" };
	[23226] = { 0, "Ghoul Skin Tunic" };
	[22465] = { 0, "Earthshatter Legguards" };
	[22469] = { 0, "Earthshatter Handguards" };
	[22983] = { 0, "Rime Covered Mantle" };
	[22477] = { 0, "Bonescythe Legplates" };
	[22481] = { 0, "Bonescythe Gauntlets" };
	[22489] = { 0, "Dreamwalker Legguards" };
	[22493] = { 0, "Dreamwalker Handguards" };
	[22497] = { 0, "Frostfire Leggings" };
	[22501] = { 0, "Frostfire Gloves" };
	[22505] = { 0, "Plagueheart Leggings" };
	[22509] = { 0, "Plagueheart Gloves" };
	[22513] = { 0, "Leggings of Faith" };
	[22517] = { 0, "Gloves of Faith" };
	[23031] = { 0, "Band of the Inevitable" };
	[23035] = { 0, "Preceptor's Hat" };
	[23039] = { 0, "The Eye of Nerub" };
	[23043] = { 0, "The Face of Death" };
	[23047] = { 0, "Eye of the Dead", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22800] = { 0, "Brimstone Staff" };
	[22804] = { 0, "Maexxna's Fang" };
	[22808] = { 0, "The Castigator" };
	[22812] = { 0, "Nerubian Slavemaker" };
	[22816] = { 0, "Hatchet of Sundered Bone" };
	[22820] = { 0, "Wand of Fates" };
	[22350] = { 0, "Desecrated Tunic" };
	[22354] = { 0, "Desecrated Pauldrons" };
	[22358] = { 0, "Desecrated Sabatons" };
	[22362] = { 0, "Desecrated Wristguards" };
	[22366] = { 0, "Desecrated Leggings" };
	[22370] = { 0, "Desecrated Belt" };
	[23665] = { 0, "Leggings of Elemental Fury" };
	[22940] = { 0, "Icebane Pauldrons" };
	[23061] = { 0, "Ring of Faith" };
	[22941] = { 0, "Polar Shoulder Pads" };
	[22418] = { 0, "Dreadnaught Helmet" };
	[22422] = { 0, "Dreadnaught Waistguard" };
	[22426] = { 0, "Redemption Handguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22430] = { 0, "Redemption Boots", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23577] = { 0, "The Hungering Cold" };
	[22438] = { 0, "Cryptstalker Headpiece" };
	[22442] = { 0, "Cryptstalker Girdle" };
	[23549] = { 0, "Fortitude of the Scourge" };
	[22960] = { 0, "Cloak of Suturing" };
	[23219] = { 0, "Girdle of the Mentor", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[22968] = { 0, "Glacial Mantle" };
	[23548] = { 0, "Might of the Scourge" };
	[22466] = { 0, "Earthshatter Headpiece" };
	[22470] = { 0, "Earthshatter Girdle" };
	[23547] = { 0, "Resilience of the Scourge" };
	[22478] = { 0, "Bonescythe Helmet" };
	[22482] = { 0, "Bonescythe Waistguard" };
	[23545] = { 0, "Power of the Scourge" };
	[22490] = { 0, "Dreamwalker Headpiece" };
	[22494] = { 0, "Dreamwalker Girdle" };
	[22498] = { 0, "Frostfire Circlet" };
	[22502] = { 0, "Frostfire Belt" };
	[22506] = { 0, "Plagueheart Circlet" };
	[22510] = { 0, "Plagueheart Belt" };
	[22514] = { 0, "Circlet of Faith" };
	[22518] = { 0, "Belt of Faith" };
	[23032] = { 0, "Glacial Headdress" };
	[23036] = { 0, "Necklace of Necropsy" };
	[23040] = { 0, "Glyph of Deflection" };
	[23044] = { 0, "Harbinger of Doom" };
	[23048] = { 0, "Sapphiron's Right Eye" };
	[23242] = { 0, "Claw of the Frost Wyrm" };
	[22801] = { 0, "Spire of Twilight" };
	[23060] = { 0, "Bonescythe Ring" };
	[22809] = { 0, "Maul of the Redeemed Crusader" };
	[22813] = { 0, "Claymore of Unholy Might" };
	[23238] = { 0, "Stygian Buckler" };
	[22821] = { 0, "Doomfinger" };
	[23025] = { 0, "Seal of the Damned" };
	[23075] = { 0, "Death's Bargain", ["class"] = { "Paladin", "Shaman" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23073] = { 0, "Boots of Displacement" };
	[23071] = { 0, "Leggings of Apocalypse" };
	[23070] = { 0, "Leggings of Polarity" };
	[23019] = { 0, "Icebane Helmet" };
	[23068] = { 0, "Legplates of Carnage" };
	[23067] = { 0, "Ring of the Cryptstalker" };
	[23066] = { 0, "Ring of Redemption", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22351] = { 0, "Desecrated Robe" };
	[22355] = { 0, "Desecrated Bracers" };
	[22359] = { 0, "Desecrated Legguards" };
	[22363] = { 0, "Desecrated Girdle" };
	[22367] = { 0, "Desecrated Circlet" };
	[22371] = { 0, "Desecrated Gloves" };
	[23065] = { 0, "Ring of the Earthshatterer" };
	[23064] = { 0, "Ring of the Dreamwalker" };
	[23063] = { 0, "Plagueheart Ring" };
	[23062] = { 0, "Frostfire Ring" };
	[23666] = { 0, "Belt of the Grand Crusader" };
	[23059] = { 0, "Ring of the Dreadnaught" };
	[23057] = { 0, "Gem of Trapped Innocents", ["class"] = { "Paladin", "Mage", "Warlock" }, ["role"] = { "Healer", "Caster" }, ["phase"] = 6 };
	[23056] = { 0, "Hammer of the Twisting Nether", ["class"] = { "Paladin", "Shaman", "Druid", "Priest" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23054] = { 0, "Gressil, Dawn of Ruin" };
	[23053] = { 0, "Stormrage's Talisman of Seething" };
	[23020] = { 0, "Polar Helmet" };
	[22419] = { 0, "Dreadnaught Pauldrons" };
	[22423] = { 0, "Dreadnaught Bracers" };
	[22427] = { 0, "Redemption Legguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22431] = { 0, "Redemption Girdle", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23021] = { 0, "The Soul Harvester's Bindings" };
	[22439] = { 0, "Cryptstalker Spaulders" };
	[22443] = { 0, "Cryptstalker Wristguards" };
	[23023] = { 0, "Sadist's Collar" };
	[22961] = { 0, "Band of Reanimation" };
	[23220] = { 0, "Crystal Webbed Robe" };
	[23027] = { 0, "Warmth of Forgiveness" };
	[23030] = { 0, "Cloak of the Scourge" };
	[22467] = { 0, "Earthshatter Spaulders" };
	[22471] = { 0, "Earthshatter Wristguards" };
	[23029] = { 0, "Noth's Frigid Heart" };
	[22479] = { 0, "Bonescythe Pauldrons" };
	[22483] = { 0, "Bonescythe Bracers" };
	[23028] = { 0, "Hailstone Band" };
	[22491] = { 0, "Dreamwalker Spaulders" };
	[22495] = { 0, "Dreamwalker Wristguards" };
	[22499] = { 0, "Frostfire Shoulderpads" };
	[22503] = { 0, "Frostfire Bindings" };
	[22507] = { 0, "Plagueheart Shoulderpads" };
	[22511] = { 0, "Plagueheart Bindings" };
	[22515] = { 0, "Shoulderpads of Faith" };
	[22519] = { 0, "Bindings of Faith" };
	[23033] = { 0, "Icy Scale Coif" };
	[23037] = { 0, "Ring of Spiritual Fervor" };
	[23041] = { 0, "Slayer's Crest" };
	[23045] = { 0, "Shroud of Dominion", ["class"] = { "Warrior", "Paladin", "Hunter", "Druid" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[23049] = { 0, "Sapphiron's Left Eye" };
	[22798] = { 0, "Might of Menethil" };
	[22802] = { 0, "Kingsfall" };
	[22806] = { 0, "Widow's Remorse" };
	[22810] = { 0, "Toxin Injector" };
	[23069] = { 0, "Necro-Knight's Garb" };
	[22818] = { 0, "The Plague Bearer" };
	[23018] = { 0, "Signet of the Fallen Defender" };
	[23017] = { 0, "Veil of Eclipse" };
	[23014] = { 0, "Iblis, Blade of the Fallen Seraph" };
	[23009] = { 0, "Wand of the Whispering Dead" };
	[23006] = { 0, "Libram of Light", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[23005] = { 0, "Totem of Flowing Water" };
	[23004] = { 0, "Idol of Longevity" };
	[23001] = { 0, "Eye of Diminution" };
	[23000] = { 0, "Plated Abomination Ribcage" };
	[22988] = { 0, "The End of Dreams" };
	[22352] = { 0, "Desecrated Legplates" };
	[22356] = { 0, "Desecrated Waistguard" };
	[22360] = { 0, "Desecrated Headpiece" };
	[22364] = { 0, "Desecrated Handguards" };
	[22368] = { 0, "Desecrated Shoulderpads" };
	[22372] = { 0, "Desecrated Sandals" };
	[22981] = { 0, "Gluth's Missing Collar" };
	[22947] = { 0, "Pendant of Forgotten Names" };
	[22733] = { 0, "Staff Head of Atiesh" };
	[23663] = { 0, "Girdle of Elemental Fury" };
	[23667] = { 0, "Spaulders of the Grand Crusader" };
	[22939] = { 0, "Band of Unanswered Prayers" };
	[22938] = { 0, "Cryptfiend Silk Cloak" };
	[22937] = { 0, "Gem of Nerubis" };
	[22936] = { 0, "Wristguards of Vengeance", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
	[22935] = { 0, "Touch of Frost" };
	[22416] = { 0, "Dreadnaught Breastplate" };
	[22420] = { 0, "Dreadnaught Sabatons" };
	[22424] = { 0, "Redemption Wristguards", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22428] = { 0, "Redemption Headpiece", ["class"] = { "Paladin" }, ["role"] = { "Healer" }, ["phase"] = 6 };
	[22942] = { 0, "The Widow's Embrace" };
	[22691] = { 0, "Corrupted Ashbringer", ["class"] = { "Warrior", "Paladin" }, ["role"] = { "Melee" }, ["phase"] = 6 };
}
GoodEPGP.prices = prices

-- Class List
local classList = {"All Classes", "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid", "Priest", "Warlock", "Mage"}

-- Role List
local roleList = {"All Roles", "Tank", "Healer", "Caster", "Melee"}

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

		GoodEPGP:LoadAllPrices()
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
        GoodEPGP.pricesFrame.classSelectDropdown:SetLabel("Class")
        GoodEPGP.pricesFrame.classSelectDropdown:SetText("All Classes")
        GoodEPGP.pricesFrame.classSelectDropdown:SetList(classList)
        GoodEPGP.pricesFrame.classSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedClass = classList[widget:GetValue()];
            GoodEPGP:PricesFilter("class", selectedClass)
        end)
        GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.classSelectDropdown)

		-- Add role filter dropdown
        GoodEPGP.pricesFrame.roleSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.pricesFrame.roleSelectDropdown:SetLabel("Role")
        GoodEPGP.pricesFrame.roleSelectDropdown:SetText("All Roles")
        GoodEPGP.pricesFrame.roleSelectDropdown:SetList(roleList)
        GoodEPGP.pricesFrame.roleSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedRole = roleList[widget:GetValue()];
            GoodEPGP:PricesFilter("role", selectedRole)
        end)
        GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.roleSelectDropdown)

		-- Add a blank spacer to force a new line
		GoodEPGP.pricesFrame.blankSpacer = AceGUI:Create("Label")
		GoodEPGP.pricesFrame.blankSpacer:SetFullWidth(true)
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.blankSpacer)

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
function GoodEPGP:LoadAllPrices()

	-- Clear all filters
	GoodEPGP.pricesFrame.roleSelectDropdown:SetValue()
	GoodEPGP.pricesFrame.roleSelectDropdown:SetText("All Roles")
	GoodEPGP.pricesFrame.classSelectDropdown:SetValue()
	GoodEPGP.pricesFrame.classSelectDropdown:SetText("All Classes")

	-- Go through our standings and display them
	for key, item in pairs(GoodEPGPCachedPrices) do
	  GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, key)
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
    if (selectedClass ~= nil) then
        GoodEPGP:PricesFilter("class", selectedClass)
	elseif (selectedRole ~= nil) then
        GoodEPGP:PricesFilter("role", selectedRole)
	else
		GoodEPGP:LoadAllPrices()
	end
end

-- Filter the EPGP price list
function GoodEPGP:PricesFilter(type, filterValue)
	local selectedClass = classList[GoodEPGP.pricesFrame.classSelectDropdown:GetValue()]
	local selectedRole = roleList[GoodEPGP.pricesFrame.roleSelectDropdown:GetValue()]

	-- Wipe the standingsLinesFrames and release all widgets (prevents memory bloat)
	GoodEPGP.pricesScrollFrame:ReleaseChildren()
	GoodEPGP.pricesLinesFrames = {}

	-- If filters aren't set then load all prices
	if ((selectedRole == nil or selectedRole == "All Roles") and (selectedClass == nil or selectedClass == "All Classes")) then
		GoodEPGP:LoadAllPrices()
	else

		-- Go through our standings and display lines by role
		if (type == "role") then
			local counter = 1
			local roleCombos = validRoleCombos[filterValue]
			for key, item in pairs(GoodEPGPCachedPrices) do
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

		-- Go through our standings and display filers by class
		if (type == "class") then
			local counter = 1
			local classCombos = validClassCombos[filterValue]
			for key, item in pairs(GoodEPGPCachedPrices) do
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

		-- Add prices scroll frame to scroll container
		GoodEPGP.pricesScrollContainer:AddChild(GoodEPGP.pricesScrollFrame)
	end
end
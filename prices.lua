-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

-- Date format
local dateFormat = "%m/%d/%y @ %I:%M:%S %p"

local prices = {
  ----------------------
  --- Tier 1         ---
  ----------------------
  [16665] = {65, "Arcanist Regalia"};
  [16796] = {65, "Arcanist Regalia"};
  [16797] = {65, "Arcanist Regalia"};
  [16798] = {86, "Arcanist Regalia"};
  [16799] = {43, "Arcanist Regalia"};
  [16800] = {65, "Arcanist Regalia"};
  [16801] = {65, "Arcanist Regalia"};
  [16802] = {43, "Arcanist Regalia"};
  [16803] = {65, "Felheart Raiment"};
  [16804] = {43, "Felheart Raiment"};
  [16805] = {65, "Felheart Raiment"};
  [16806] = {43, "Felheart Raiment"};
  [16807] = {65, "Felheart Raiment"};
  [16808] = {65, "Felheart Raiment"};
  [16809] = {86, "Felheart Raiment"};
  [16810] = {65, "Felheart Raiment"};
  [16811] = {65, "Vestments of Prophecy"};
  [16812] = {65, "Vestments of Prophecy"};
  [16813] = {65, "Vestments of Prophecy"};
  [16814] = {65, "Vestments of Prophecy"};
  [16815] = {86, "Vestments of Prophecy"};
  [16816] = {65, "Vestments of Prophecy"};
  [16817] = {43, "Vestments of Prophecy"};
  [16819] = {43, "Vestments of Prophecy"};
  [16820] = {86, "Nightslayer Armor"};
  [16821] = {65, "Nightslayer Armor"};
  [16822] = {65, "Nightslayer Armor"};
  [16823] = {65, "Nightslayer Armor"};
  [16824] = {65, "Nightslayer Armor"};
  [16825] = {43, "Nightslayer Armor"};
  [16826] = {65, "Nightslayer Armor"};
  [16827] = {43, "Nightslayer Armor"};
  [16828] = {43, "Cenarion Raiment"};
  [16829] = {65, "Cenarion Raiment"};
  [16830] = {43, "Cenarion Raiment"};
  [16831] = {65, "Cenarion Raiment"};
  [16833] = {86, "Cenarion Raiment"};
  [16834] = {65, "Cenarion Raiment"};
  [16835] = {65, "Cenarion Raiment"};
  [16836] = {65, "Cenarion Raiment"};
  [16837] = {65, "The Earthfury"};
  [16838] = {43, "The Earthfury"};
  [16839] = {65, "The Earthfury"};
  [16840] = {43, "The Earthfury"};
  [16841] = {86, "The Earthfury"};
  [16842] = {65, "The Earthfury"};
  [16843] = {65, "The Earthfury"};
  [16844] = {65, "The Earthfury"};
  [16845] = {86, "Giantstalker Armor"};
  [16846] = {65, "Giantstalker Armor"};
  [16847] = {65, "Giantstalker Armor"};
  [16848] = {65, "Giantstalker Armor"};
  [16849] = {65, "Giantstalker Armor"};
  [16850] = {43, "Giantstalker Armor"};
  [16851] = {43, "Giantstalker Armor"};
  [16852] = {65, "Giantstalker Armor"};
  [16853] = {86, "Lawbringer Armor"};
  [16854] = {65, "Lawbringer Armor"};
  [16855] = {65, "Lawbringer Armor"};
  [16856] = {65, "Lawbringer Armor"};
  [16857] = {43, "Lawbringer Armor"};
  [16858] = {43, "Lawbringer Armor"};
  [16859] = {65, "Lawbringer Armor"};
  [16860] = {65, "Lawbringer Armor"};
  [16861] = {43, "Battlegear of Might"};
  [16862] = {65, "Battlegear of Might"};
  [16863] = {65, "Battlegear of Might"};
  [16864] = {43, "Battlegear of Might"};
  [16865] = {86, "Battlegear of Might"};
  [16866] = {65, "Battlegear of Might"};
  [16867] = {65, "Battlegear of Might"};
  [16868] = {65, "Battlegear of Might"};
  [17063] = {346, "Band of Accuria"};
  [17065] = {194, "Medallion of Steadfast Might"};
  [17066] = {130, "Drillborer Disk"};
  [17069] = {288, "Striker's Mark"};
  [17071] = {0, "Gutgore Ripper"};
  [17072] = {119, "Blastershot Launcher"};
  [17073] = {65, "Earthshaker"};
  [17074] = {0, "Shadowstrike"};
  [17076] = {158, "Bonereaver's Edge"};
  [17077] = {0, "Crimson Shocker"};
  [17082] = {0, "Shard of the Flame"};
  [17102] = {108, "Cloak of the Shrouded Mists"};
  [17103] = {202, "Azuresong Mageblade"};
  [17104] = {108, "Spinal Reaper"};
  [17105] = {119, "Aurastone Hammer"};
  [17106] = {0, "Malistar's Defender"};
  [17107] = {86, "Dragon's Blood Cape"};
  [17109] = {43, "Choker of Enlightenment"};
  [17110] = {43, "Seal of the Archmagus"};
  [17204] = {0, "Eye of Sulfuras"};
  [18203] = {86, "Eskhandar's Right Claw"};
  [18563] = {250, "Bindings of the Windseeker"};
  [18564] = {250, "Bindings of the Windseeker"};
  [18646] = {0, "The Eye of Divinity"};
  [18703] = {0, "Ancient Petrified Leaf"};
  [18803] = {65, "Finkle's Lava Dredger"};
  [18805] = {230, "Core Hound Tooth"};
  [18806] = {22, "Core Forged Greaves"};
  [18808] = {0, "Gloves of the Hypnotic Flame"};
  [18809] = {86, "Sash of Whispered Secrets"};
  [18810] = {259, "Wild Growth Spaulders"};
  [18811] = {0, "Fireproof Cloak"};
  [18812] = {151, "Wristguards of True Flight"};
  [18814] = {302, "Choker of the Firelord"};
  [18815] = {0, "Essence of the Pure Flame"};
  [18816] = {288, "Perdition's Blade"};
  [18817] = {216, "Crown of Destruction"};
  [18820] = {259, "Talisman of Ephemeral Power"};
  [18821] = {259, "Quick Strike Ring"};
  [18822] = {65, "Obsidian Edged Blade"};
  [18823] = {86, "Aged Core Leather Gloves"};
  [18824] = {43, "Magma Tempered Boots"};
  [18829] = {108, "Deep Earth Spaulders"};
  [18832] = {173, "Brutality Blade"};
  [18842] = {130, "Staff of Dominance"};
  [18861] = {0, "Flamewalker Legplates"};
  [18870] = {43, "Helm of the Lifegiver"};
  [18872] = {0, "Manastorm Leggings"};
  [18875] = {227, "Salamander Scale Pants"};
  [18878] = {86, "Sorcerous Dagger"};
  [18879] = {162, "Heavy Dark Iron Ring"};
  [19136] = {202, "Mana Igniting Cord"};
  [19137] = {346, "Onslaught Girdle"};
  [19138] = {0, "Band of Sulfuras"};
  [19139] = {0, "Fireguard Shoulders"};
  [19140] = {202, "Cauterizing Band"};
  [19142] = {65, "Fire Runed Grimoire"};
  [19143] = {101, "Flameguard Gauntlets"};
  [19144] = {65, "Sabatons of the Flamewalker"};
  [19145] = {302, "Robe of Volatile Power"};
  [19146] = {58, "Wristguards of Stability"};
  [19147] = {202, "Ring of Spell Power"};

  ----------------------
  --- T1.5 Loot      ---
  ----------------------
  [17064] = {234, "Shard of the Scale"};
  [17067] = {54, "Ancient Cornerstone Grimoire"};
  [17068] = {144, "Deathbringer"};
  [17070] = {162, "Fang of the Mystics"};
  [17075] = {108, "Vis'kag the Bloodletter"};
  [17078] = {90, "Sapphiron Drape"};
  [17111] = {72, "Blazefury Medallion"};
  [17112] = {90, "Empyrean Demolisher"};
  [17113] = {108, "Amberseal Keeper"};
  [18202] = {90, "Eskhandar's Left Claw"};
  [18204] = {54, "Eskhandar's Pelt"};
  [18205] = {72, "Eskhandar's Collar"};
  [18208] = {54, "Drape of Benediction"};
  [18403] = {216, "Head of Onyxia"};
  [18404] = {216, "Head of Onyxia"};
  [18406] = {216, "Head of Onyxia"};
  [18423] = {216, "Head of Onyxia"};
  [18541] = {234, "Puissant Cape"};
  [18542] = {54, "Typhoon"};
  [18543] = {54, "Ring of Entropy"};
  [18544] = {90, "Doomhide Gauntlets"};
  [18545] = {18, "Leggings of Arcane Supremacy"};
  [18546] = {108, "Infernal Headcage"};
  [18547] = {18, "Unmelting Ice Girdle"};
  [18665] = {0, "The Eye of Shadow "};
  [18704] = {0, "Mature Blue Dragon Sinew"};
  [18705] = {0, "Mature Black Dragon Sinew"};
  [18813] = {18, "Ring of Binding"};
  [19130] = {207, "Cold Snap"};
  [19131] = {252, "Snowblind Shoes"};
  [19132] = {270, "Crystal Adorned Crown"};
  [19133] = {243, "Fel Infused Leggings"};
  [19134] = {72, "Flayed Doomguard Belt"};
  [19135] = {54, "Blacklight Bracer"};
  [20577] = {162, "Nightmare Blade"};
  [20578] = {162, "Emerald Dragonfang"};
  [20579] = {18, "Green Dragonskin Cloak"};
  [20580] = {144, "Hammer of Bestial Fury"};
  [20581] = {180, "Staff of Rampant Growth"};
  [20582] = {90, "Trance Stone"};
  [20599] = {126, "Polished Ironwood Crossbow"};
  [20600] = {18, "Nightmare Engulfed Object"};
  [20615] = {72, "Dragonspur Wraps"};
  [20616] = {72, "Dragonbone Wristguards"};
  [20617] = {126, "Ancient Corroded Leggings"};
  [20618] = {180, "Gloves of Delusional Power"};
  [20619] = {18, "Acid Inscribed Greaves"};
  [20621] = {108, "Boots of the Endless Moor"};
  [20622] = {90, "Dragonheart Necklace"};
  [20623] = {144, "Circlet of Restless Dreams"};
  [20624] = {108, "Ring of the Unliving"};
  [20625] = {18, "Belt of the Dark Bog"};
  [20626] = {90, "Black Bark Wristbands"};
  [20627] = {225, "Dark Heart Pants"};
  [20628] = {243, "Deviate Growth Cap"};
  [20629] = {54, "Malignant Footguards"};
  [20630] = {45, "Gauntlets of the Shining Light"};
  [20631] = {180, "Mendicant's Slippers"};
  [20632] = {90, "Mindtear Band"};
  [20633] = {18, "Unnatural Leather Spaulders"};
  [20634] = {108, "Boots of Fright"};
  [20635] = {162, "Jade Inlaid Vestments"};
  [20636] = {234, "Hibernating Crystal"};
  [20637] = {18, "Acid Inscribed Pauldrons"};
  [20638] = {144, "Leggings of the Demented Mind"};
  [20639] = {54, "Strangely Glyphed Legplates"};
  [20644] = {18, "Nightmare Engulfed Object"};


  ----------------------
  --- Blackwing Lair ---
  ----------------------

  [16897] = {100, "Stormrage Chestguard"};
  [16898] = {150, "Stormrage Boots"};
  [16899] = {150, "Stormrage Handguards"};
  [16900] = {100, "Stormrage Cover"};
  [16901] = {100, "Stormrage Legguards"};
  [16902] = {100, "Stormrage Pauldrons"};
  [16903] = {100, "Stormrage Belt"};
  [16904] = {150, "Stormrage Bracers"};
  [16832] = {100, "Bloodfang Spaulders"};
  [16905] = {150, "Bloodfang Chestpiece"};
  [16906] = {100, "Bloodfang Boots"};
  [16907] = {100, "Bloodfang Gloves"};
  [16908] = {150, "Bloodfang Hood"};
  [16909] = {150, "Bloodfang Pants"};
  [16910] = {150, "Bloodfang Belt"};
  [16911] = {150, "Bloodfang Bracers"};
  [16818] = {100, "Netherwind Belt"};
  [16912] = {100, "Netherwind Boots"};
  [16913] = {150, "Netherwind Gloves"};
  [16914] = {100, "Netherwind Crown"};
  [16915] = {150, "Netherwind Pants"};
  [16916] = {100, "Netherwind Robes"};
  [16917] = {100, "Netherwind Bindings"};
  [16918] = {100, "Netherwind Regalia"};
  [16919] = {100, "Boots of Transcendence"};
  [16920] = {150, "Handguards of Transcendence"};
  [16921] = {150, "Halo of Transcendence"};
  [16922] = {150, "Leggings of Transcendence"};
  [16923] = {150, "Robes of Transendence"};
  [16924] = {150, "Spauldrons of Transcendence"};
  [16925] = {150, "Belt of Transcendence"};
  [16926] = {150, "Bindings of Transcendence"};
  [16927] = {100, "Nemesis Boots"};
  [16928] = {100, "Nemesis Gloves"};
  [16929] = {100, "Nemesis Skullcap"};
  [16930] = {150, "Nemesis Leggings"};
  [16931] = {150, "Nemesis Robes"};
  [16932] = {100, "Nemesis Spaulders"};
  [16933] = {150, "Nemesis Belt"};
  [16934] = {100, "Nemesis Bracers"};
  [16935] = {150, "Dragonstalker Bracers"};
  [16936] = {150, "Dragonstalker Belt"};
  [16937] = {150, "Dragonstalker Spaulders"};
  [16938] = {150, "Dragonstalker Legguards"};
  [16939] = {150, "Dragonstalker Helm"};
  [16940] = {150, "Dragonstalker Guantlets"};
  [16941] = {150, "Dragonstalker Greaves"};
  [16942] = {150, "Dragonstalker Breastplate"};
  [16943] = {84, "Bracers of Ten Storms"};
  [16944] = {96, "Belt of Ten Storms"};
  [16945] = {120, "Epualets of Ten Storms"};
  [16946] = {96, "Legplates of Ten Storms"};
  [16947] = {120, "Helmet of Ten Storms"};
  [16948] = {96, "Guantlets of Ten Storms"};
  [16949] = {96, "Greaves of Ten Storms"};
  [16950] = {144, "Breastplate of Ten Storms"};
  [16951] = {100, "Judgement Bindings"};
  [16952] = {100, "Judgement Belt"};
  [16953] = {100, "Judgement Spaulders"};
  [16954] = {100, "Judgement Legplates"};
  [16955] = {100, "Judgement Crown"};
  [16956] = {100, "Judgement Guantlets"};
  [16957] = {100, "Judgement Sabatons"};
  [16958] = {100, "Judgement Breastplate"};
  [16959] = {150, "Bracers of Wrath"};
  [16960] = {100, "Waistband of Wrath"};
  [16961] = {100, "Spauldrons of Wrath"};
  [16962] = {150, "Legplates of Wrath"};
  [16963] = {100, "Helm of Wrath"};
  [16964] = {150, "Gauntlets of Wrath"};
  [16965] = {150, "Sabatons of Wrath"};
  [16966] = {150, "Breastplate of Wrath  "};
  [19003] = {156, "Head of Nefarian"};
  [19334] = {220, "The Untamed Blade"};
  [19335] = {96, "Spineshatter"};
  [19336] = {0, "Arcane Infused Gem"};
  [19337] = {0, "The Black Book"};
  [19339] = {240, "Mind Quickening Gem"};
  [19340] = {0, "Rune of Metamorphosis"};
  [19341] = {160, "Lifegiving Gem"};
  [19342] = {0, "Venomous Totem"};
  [19344] = {0, "Natural Alignment Crystal"};
  [19345] = {0, "Aegis of Preservation"};
  [19346] = {144, "Dragonfang Blade"};
  [19347] = {240, "Claw of Chromaggus"};
  [19348] = {160, "Red Dragonscale Protector"};
  [19349] = {170, "Elementium Reinforced Bulwark"};
  [19350] = {60, "Heartstriker"};
  [19351] = {228, "Maladath"};
  [19352] = {288, "Chromatically Tempered Sword"};
  [19353] = {48, "Drake Talon Cleaver"};
  [19354] = {48, "Draconic Avenger"};
  [19355] = {106, "Shadow Wing Focus Staff"};
  [19356] = {372, "Staff of the Shadow Flame"};
  [19357] = {48, "Herald of Woe"};
  [19358] = {96, "Draconic Maul"};
  [19360] = {296, "Lok'amir il Romathis"};
  [19361] = {296, "Ashjre'thul"};
  [19362] = {120, "Doom's Edge"};
  [19363] = {216, "Crul'shoruk"};
  [19364] = {192, "Ashkandi"};
  [19365] = {120, "Claw of the Black Drake"};
  [19367] = {48, "Dragon's Touch"};
  [19368] = {96, "Dragonbreath Hand Cannon"};
  [19369] = {0, "Gloves of Rapid Evolution"};
  [19370] = {252, "Mantle of the Blackwing Cabal"};
  [19371] = {0, "Pendant of the Fallen Dragon"};
  [19372] = {156, "Helm of Endless Rage"};
  [19373] = {0, "Black Brood Pauldrons"};
  [19374] = {280, "Bracers of Arcane Accuracy"};
  [19375] = {325, "Mish'undare"};
  [19376] = {60, "Archimtiros' Ring of Reckoning"};
  [19377] = {248, "Prestor's Talisman of Connivery"};
  [19378] = {84, "Cloak of the Brood Lord"};
  [19379] = {482, "Neltharion's Tear"};
  [19380] = {0, "Therazane's Link"};
  [19381] = {156, "Boots of the Shadow Flame"};
  [19382] = {324, "Pure Elementium Band"};
  [19385] = {300, "Empowered Leggings"};
  [19386] = {96, "Elementium Threaded Cloak"};
  [19387] = {252, "Chromatic Boots"};
  [19388] = {48, "Angelista's Grasp"};
  [19389] = {132, "Taut Dragonhide Shoulderpads"};
  [19390] = {48, "Taut Dragonhide Gloves"};
  [19391] = {0, "Shimmering Geta"};
  [19392] = {0, "Girdle of the Fallen Crusader"};
  [19394] = {216, "Drake Talon Pauldrons"};
  [19395] = {425, "Rejuvenating Gem"};
  [19396] = {108, "Taut Dragonhide Belt"};
  [19397] = {96, "Ring of Blackrock"};
  [19398] = {136, "Cloak of Firemaw"};
  [19399] = {0, "Black Ash Robe"};
  [19400] = {216, "Firemaw's Clutch"};
  [19402] = {226, "Legguards of the Fallen Crusader"};
  [19403] = {226, "Band of Forced Concentration"};
  [19405] = {180, "Malfurion's Blessed Bulwark"};
  [19406] = {348, "Drake Fang Talisman"};
  [19407] = {192, "Ebony Flame Gloves"};
  [19430] = {96, "Shroud of Pure Thought"};
  [19431] = {192, "Styleen's Impeding Scarab"};
  [19432] = {148, "Circle of Applied Force"};
  [19433] = {0, "Emberweave Leggings"};
  [19434] = {148, "Band of Dark Dominion"};
  [19435] = {24, "Essence Gatherer"};
  [19436] = {120, "Cloak of Draconic Might"};
  [19437] = {196, "Boots of Pure Thought"};
  [19438] = {124, "Ringo's Blizzard Boots"};
  [19439] = {0, "Interlaced Shadow Jerkin"};
  [20383] = {0, "Head of Broodlord Lashlayer"};
}
GoodEPGP.prices = prices

-- Toggle the display of our prices window
function GoodEPGP:TogglePrices()
    if (GoodEPGP.pricesFrame:IsVisible()) then
        GoodEPGP.pricesFrame:Hide()
    else
		if (GoodEPGP.menuFrame:IsVisible()) then
			GoodEPGP.menuFrame:Hide()
			GoodEPGP:ShowPrices()
			GoodEPGP.pricesFrame:Show()
		end
		if (GoodEPGP.standingsFrame:IsVisible()) then
			GoodEPGP:ToggleStandings()
			GoodEPGP:ShowPrices()
			GoodEPGP.pricesFrame:Show()
		end
        GoodEPGP:ShowPrices()
        GoodEPGP.pricesFrame:Show()
    end
end

-- Query server for data missing from the local client ItemCache then build cached price list
function GoodEPGP:BuildPrices()
	for itemID, itemPrice in pairs(GoodEPGP.prices) do

		-- Checks local cache for item and askes server for data if it doesn't exsist
		if (GetItemInfo(itemID) == nil) then
			local item = Item:CreateFromItemID(itemID)
			item:ContinueOnItemLoad(function()
				local itemName = select(1, GetItemInfo(itemID))
				local itemLink = select(2, GetItemInfo(itemID))
				local itemType = select(6, GetItemInfo(itemID))
				local itemSubType = select(7, GetItemInfo(itemID))
				local itemEquipLoc = select(9, GetItemInfo(itemID))
				local itemIcon = select(10, GetItemInfo(itemID))
				local itemSetID = select(16, GetItemInfo(itemID))
				local price = itemPrice[1]
				local osprice = tonumber(price) / 4
				local priceInfo = {
					["itemName"] = itemName,
					["itemLink"] = itemLink,
					["itemType"] = itemType,
					["itemSubType"] = itemSubType,
					["itemEquipLoc"] = itemEquipLoc,
					["itemIcon"] = itemIcon,
					["itemSetID"] = itemSetID,
					["ms"] = price,
					["os"] = osprice,
				};
				table.insert(GoodEPGPCachedPrices, priceInfo)
			end)
		else
			-- Item exsists in local cache and data will be pulled from there
			local itemName = select(1, GetItemInfo(itemID))
			local itemLink = select(2, GetItemInfo(itemID))
			local itemType = select(6, GetItemInfo(itemID))
			local itemSubType = select(7, GetItemInfo(itemID))
			local itemEquipLoc = select(9, GetItemInfo(itemID))
			local itemIcon = select(10, GetItemInfo(itemID))
			local itemSetID = select(16, GetItemInfo(itemID))
			local price = itemPrice[1]
			local osprice = tonumber(price) / 4
			local priceInfo = {
				["itemName"] = itemName,
				["itemLink"] = itemLink,
				["itemType"] = itemType,
				["itemSubType"] = itemSubType,
				["itemEquipLoc"] = itemEquipLoc,
				["itemIcon"] = itemIcon,
				["itemSetID"] = itemSetID,
				["ms"] = price,
				["os"] = osprice,
			};
			table.insert(GoodEPGPCachedPrices, priceInfo)
		end
	end
	GoodEPGP:ShowPrices()
end

-- Show Price standings
function GoodEPGP:ShowPrices()

	-- Create the pricesFrame if it doesn't exist.
	if (GoodEPGP.pricesFrame == nil) then

		-- Create the overall frame
		GoodEPGP.pricesFrame = AceGUI:Create("Frame")
		GoodEPGP.pricesFrame:SetTitle("GoodEPGP - Price List")
		GoodEPGP.pricesFrame:SetStatusText("Last Updated: " .. date(dateFormat))
		GoodEPGP.pricesFrame:SetLayout("Flow")
		GoodEPGP.pricesFrame:EnableResize(false)

		-- 4px padding (hacks!)
		GoodEPGP.pricesFrame.padding = AceGUI:Create("Label")
		GoodEPGP.pricesFrame.padding:SetWidth(4)
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesFrame.padding)

		-- Generate labels for each of our headers
		local headers = {
		  {["label"] = "Item", ["width"] = 300, ["sortColumn"] = "name"},
		  {["label"] = "MS", ["width"] = 100, ["sortColumn"] = "ms"},
		  {["label"] = "OS", ["width"] = 100, ["sortColumn"] = "os"},
		}

		-- Add our header line, and specify the sorting function to us
		GoodEPGP:AddHeaderLine(headers, GoodEPGP.pricesFrame, "PricesSort")

		-- Create a container for the scrolling content
		GoodEPGP.pricesScrollContainer = AceGUI:Create("SimpleGroup")
		GoodEPGP.pricesScrollContainer:SetFullWidth(true)
		GoodEPGP.pricesScrollContainer:SetFullHeight(true)
		GoodEPGP.pricesScrollContainer:SetLayout("Fill")

		-- Add scrolling container to parent
		GoodEPGP.pricesFrame:AddChild(GoodEPGP.pricesScrollContainer)

		-- Add the actual frame for the scrolling prices to go to
		GoodEPGP.pricesScrollFrame = AceGUI:Create("ScrollFrame")
		GoodEPGP.pricesScrollFrame:SetLayout("Flow")
		GoodEPGP.pricesScrollContainer:AddChild(GoodEPGP.pricesScrollFrame)

		GoodEPGP.pricesScrollFrame:ClearAllPoints()
		GoodEPGP.pricesScrollFrame:SetPoint("TOP", GoodEPGP.pricesScrollContainer.frame, "TOP", 0, -4)
		GoodEPGP.pricesScrollFrame:SetPoint("BOTTOM", 0, 4)
		GoodEPGP.pricesScrollFrame.frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
        GoodEPGP.pricesScrollFrame.frame:SetBackdropColor(0, 0, 0, 1)

		-- Hide our prices frame
		GoodEPGP.pricesFrame:Hide()

		-- Allows closing hitting ESC
		_G["GoodEPGP_Prices"] = GoodEPGP.pricesFrame
		table.insert(UISpecialFrames, "GoodEPGP_Prices")
	end

	-- Go through our prices and display them
	for key, item in pairs(GoodEPGPCachedPrices) do
	  GoodEPGP:AddPriceLine(item, GoodEPGP.pricesScrollFrame, key)
	end
end

-- Display a single line of prices
function GoodEPGP:AddPriceLine(item, frame, index)

	-- Set up a table of pricesFrame lines
	if (GoodEPGP.pricesFrame == nil) then
		GoodEPGP.pricesFrame = {}
	end

	-- Our list of fields and related widths
	local fields = {
		{["field"] = "itemLink", ["width"] = 300},
		{["field"] = "ms", ["width"] = 100},
		{["field"] = "os", ["width"] = 100},
	}

	-- If the key for this index exists, modify it with possible changes to prices and add alternating backgrounds for readability
	if (GoodEPGP.pricesFrame[index]) then
		local pricesLine = GoodEPGP.pricesFrame[index]

		-- Loop through each of the fields in our line and update the text of the frame, build the tooltips, and icons... if applicable
		for key, field in pairs(fields) do
			local pricesLabel = pricesLine[field.field]

			-- Add tooltips to prices list
			if (field.field == "itemLink") then
				pricesLabel:SetCallback("OnClick", function()
					ItemRefTooltip:SetOwner(GoodEPGP.pricesFrame.frame, "ANCHOR_LEFT", 0, -400)
					ItemRefTooltip:SetHyperlink(item[field.field])
					ItemRefTooltip:Show()
				end)

				-- Add icons to prices list
				local itemIcon = tonumber(item.itemIcon)
				pricesLabel:SetImage(itemIcon)
			end

			pricesLabel:SetText(item[field.field])
		end

		-- Add contrasting background to ever other line
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

		-- Add 4px padding to label group (hacks!)
		pricesPadding = AceGUI:Create("Label")
		pricesPadding:SetWidth(4)
		labelGroup:AddChild(pricesPadding)

		-- Create label
		for key, field in pairs(fields) do
			if (field.field == "itemLink") then
				label = AceGUI:Create("InteractiveLabel")
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
		GoodEPGP.pricesFrame[index] = pricesLine
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
    if (sortColumn == 'ms' or sortColumn == 'os') then
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

    GoodEPGP:ShowPrices()
end

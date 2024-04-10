loadout_list =
{
	--[[{
		name = "5 in one",
		folder = "summoner",
		-- folder = "slime",
		-- folder = "thunder",
		-- folder = "eldritch",
		-- folder = "butcher",
		-- NOTE: Usually the game uses ARGB format for colours, but the cape colour uses ABGR here instead
		cape_color = 0xff60a1a2,
		cape_color_edge = 0xff3c696a,
		items = 
		{
			"mods/keopmod/files/summoner/wands/wand_1.xml",
			"mods/keopmod/files/summoner/wands/wand_2.xml",
			"data/entities/items/pickup/potion_water.xml",
			{ 
			options = { "data/entities/items/pickup/egg_fire.xml", "data/entities/items/pickup/egg_red.xml", "data/entities/items/pickup/egg_monster.xml", "data/entities/items/pickup/egg_slime.xml" },
			amount = 3,
			},
		},
		perks =
		{
			"BLEED_OIL",
			"BLEED_SLIME",
			"ELECTRICITY",
			"GLOBAL_GORE",
			"HOMUNCULUS",
			"PLAGUE_RATS",
			"PROJECTILE_REPULSION",
			"REVENGE_TENTACLE",
			"STRONG_KICK",
		},
	},]]
--[[
	{
		name = "a Element TYPE",
		folder = "element",
		-- NOTE: Usually the game uses ARGB format for colours, but the cape colour uses ABGR here instead
		cape_color = 0xff9d7b4d,
		cape_color_edge = 0xff846235,
		items =
		{
			"mods/keopmod/files/element/wands/wand_2.xml",
			"mods/keopmod/files/element/wands/wand_1.xml",
			"data/entities/items/pickup/potion_water.xml",
		},
		perks =
		{
            "SAVING_GRACE",
            "NO_PLAYER_KNOCKBACK",
            "NO_MORE_SHUFFLE",
            "DESTRUCTIVE_SPELLS",
            "IRON_STOMACH",
            "EXTRA_MONEY",
            "EXTRA_MONEY_TRICK_KILL",
            "HOVER_BOOST",
            "EXPLODING_CORPSES",
            "REVERSE_SLOWDOWN",
            "DISSOLVE_POWDERS",
            "DESTRUCTION_ENHANCEMENT",
            "NO_MORE_KNOCKBACK",
            "KNOCKBACK_CONTROL",
            "MYSTERY_EGG",
            "MANA_DISCOUNT",
            "PERSONAL_RAINCLOUD",
            "ADVENTURER",
            "ATTRACT_ITEMS",
            "BREATH_UNDERWATER",
            "EDIT_WANDS_EVERYWHERE",
            "EXPLODING_GOLD",
            "EXTRA_PERK",
            "FAST_PROJECTILES",
            "FASTER_LEVITATION",
            "FASTER_SWIMMING",
            "GLOBAL_GORE",
            "GOLD_IS_FOREVER",
            "LIQUID_MOVEMENT",
            "LOW_RECOIL",
            "MAP",
            "MELT",
            "MOON_RADAR",
            "MOVEMENT_FASTER",
            "ORBIT",
            "PROJECTILE_DUPLICATE",
            "PROJECTILE_EATER_SECTOR",
            -- "PROJECTILE_HOMING",
            "PROJECTILE_REPULSION",
            "PROJECTILE_REPULSION_SECTOR",
            "PROJECTILE_SLOW_FIELD",
            "PROTECTION_ELECTRICITY",
            "PROTECTION_EXPLOSION",
            "PROTECTION_FIRE",
            "PROTECTION_FREEZE",
            "PROTECTION_MELEE",
            "PROTECTION_RADIOACTIVITY",
            "REMOVE_FOG_OF_WAR",
            "SHIELD",
            "STRONG_KICK",
            "TELEKINESIS",
            "TELEPORTITIS_DODGE",
            "UNLIMITED_SPELLS",
            "VAMPIRISM",

            -- not working
            "PERMANENT_FLYING",
            "HELPER_ORB",

            -- ?
            "EXTRA_SLOTS",
            "EXTRA_WAND_SLOT",
            "REVEAL_SECRETS",
            "VISION",

            -- foo
            "HEARTS_MORE_EXTRA_HP",
            -- "ALWAYS_CAST",
            -- "ANGRY_GHOST",
            -- "FUNGAL_DISEASE",
            -- "GAS_FIRE",
            -- "GOLDEN_I",
            -- "HOMUNCULUS",
            -- "HUNGRY_GHOST",
            -- "RADAR_ENEMY",
            -- "RADAR_ITEM",
            -- "RADAR_MOON",
            -- "RADAR_WAND",
            -- "HEARTS_MORE_EXTRA_HP",
            -- "HEARTS_MORE_EXTRA_HP",
            -- "HEARTS_MORE_EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			"EXTRA_HP",
			-- "EXTRA_HP",
			-- "EXTRA_HP",
			-- "EXTRA_HP",
			-- "EXTRA_HP",
			-- "EXTRA_HP",
			-- "EXTRA_HP",

			"NO_DAMAGE_FLASH",
			"MYSTERY_EGGPLANT",
			"MYSTERY_EGG",
		},
	},
]]
	{
		name = "a Element TYPE",
		folder = "element",
		cape_color = 0xff9d7b4d,
		cape_color_edge = 0xff846235,
		items =
		{
			"mods/keopmod/files/element/wands/wand_0.xml",
			"mods/keopmod/files/element/wands/wand_1.xml",
			"mods/keopmod/files/element/wands/wand_2.xml",
			"mods/keopmod/files/element/wands/wand_3.xml",
			{ "data/entities/items/pickup/potion_water.xml", amount = 4 }
		},
		perks =
		{
            "HOVER_BOOST",
			"HEARTS_MORE_EXTRA_HP",
			{ "EXTRA_HP", 99 },
            "DISSOLVE_POWDERS",
			"EXTRA_MONEY",
			"EXTRA_MONEY_TRICK_KILL",
            "FASTER_LEVITATION",
            "MOVEMENT_FASTER",
			"LASER_AIM",
            -- "LOW_RECOIL",
            "LIQUID_MOVEMENT",
            "PROJECTILE_EATER_SECTOR",
            -- "PROJECTILE_HOMING",
            "PROJECTILE_REPULSION",
            "PROJECTILE_REPULSION_SECTOR",
            "PROJECTILE_SLOW_FIELD",
            "PROTECTION_ELECTRICITY",
            "PROTECTION_EXPLOSION",
            "PROTECTION_FIRE",
            "PROTECTION_MELEE",
            "PROTECTION_RADIOACTIVITY",
            "REMOVE_FOG_OF_WAR",
            "REPELLING_CAPE",
            "SHIELD",
            "STRONG_KICK",
            -- "TELEKINESIS",
            -- "TELEPORTITIS_DODGE",
            "UNLIMITED_SPELLS",
            "VAMPIRISM",
            "SAVING_GRACE",
			"NO_MORE_SHUFFLE",
			"IRON_STOMACH",
			"ATTRACT_ITEMS",
			"BREATH_UNDERWATER",
			"EDIT_WANDS_EVERYWHERE",
			-- "EXPLODING_GOLD",
			-- "GLOBAL_GORE",
			"GOLD_IS_FOREVER",

            -- no perk with such id exits
            -- "GAS_FIRE",									-- perk id not exits
			-- { "EXTRA_WAND_SLOT", 4 },					-- perk id not exits
			-- { "EXTRA_POTION_SLOT", 4 },					-- perk id not exits
			-- { "EXTRA_ACTION_STORAGE", 10 },				-- perk id not exits
            -- "FASTER_SWIMMING",							-- perk id not exits
            -- "PERMANENT_FLYING",							-- perk id not exits
            -- "PROJECTILE_DUPLICATE",						-- perk id not exits
            -- "PROTECTION_FREEZE",							-- perk id not exits
            -- "TOUCH_GOLD",								-- perk id not exits
            -- "RADAR_WAND",								-- perk id not exits
			-- "NO_PLAYER_KNOCKBACK",						-- perk id not exits
		},
	},
}
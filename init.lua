dofile( "mods/mymod/files/loadouts.lua" )
dofile( "data/scripts/perks/perk.lua" )

function OnPlayerSpawned( player_entity ) -- this runs when player entity has been created
	local init_check_flag = "start_loadouts_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	-- ---
	local x,y = EntityGetTransform( player_entity )
	SetRandomSeed( x + 344, y - 523 )
	
	local loadout_rnd = Random( 1, #loadout_list )
	-- loadout_rnd = 5
	local loadout_choice = loadout_list[loadout_rnd]
	
	local loadout_name = loadout_choice.name
	
	-- Add a random spellcaster type to the loadout name
	local spellcaster_types = { "wizard", "warlock", "witch", "mage", "druid", "magician" }
	local spellcaster_types_rnd = Random( 1, #spellcaster_types )
	loadout_name = string.gsub( loadout_name, "TYPE", spellcaster_types[spellcaster_types_rnd] )
	
	local inventory = nil
	local cape = nil
	local player_arm = nil
	
	local loadout_cape_color = loadout_choice.cape_color
	local loadout_cape_color_edge = loadout_choice.cape_color_edge

	-- find the quick inventory, player cape and arm
	local player_child_entities = EntityGetAllChildren( player_entity )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )
			
			if ( child_entity_name == "inventory_quick" ) then
				inventory = child_entity
			end
			
			if ( child_entity_name == "cape" ) then
				cape = child_entity
			end
			
			if ( child_entity_name == "arm_r" ) then
				player_arm = child_entity
			end
		end
	end
	
	-- set player sprite (since we change only one value, ComponentSetValue is fine)
	local player_sprite_component = EntityGetFirstComponent( player_entity, "SpriteComponent" )
	local player_sprite_file = "mods/mymod/files/" .. loadout_choice.folder .. "/player.xml"
	ComponentSetValue( player_sprite_component, "image_file", player_sprite_file )
	
	-- set player arm sprite
	local player_arm_sprite_component = EntityGetFirstComponent( player_arm, "SpriteComponent" )
	local player_arm_sprite_file = "mods/mymod/files/" .. loadout_choice.folder .. "/player_arm.xml"
	ComponentSetValue( player_arm_sprite_component, "image_file", player_arm_sprite_file )
	
	-- set player cape colour (since we're changing multiple variables, we'll use the edit_component() utility)
	edit_component( cape, "VerletPhysicsComponent", function(comp,vars) 
		vars.cloth_color = loadout_cape_color
		vars.cloth_color_edge = loadout_cape_color_edge
	end)
	
	-- set player ragdoll
	local player_ragdoll_component = EntityGetFirstComponent( player_entity, "DamageModelComponent" )
	local player_ragdoll_file = "mods/mymod/files/" .. loadout_choice.folder .. "/ragdoll/filenames.txt"
	ComponentSetValue( player_ragdoll_component, "ragdoll_filenames_file", player_ragdoll_file )

	-- set inventory contents
	if ( inventory ~= nil ) then
		local inventory_items = EntityGetAllChildren( inventory )
		
		-- remove default items
		if inventory_items ~= nil then
			for i,item_entity in ipairs( inventory_items ) do
				GameKillInventoryItem( player_entity, item_entity )
			end
		end

		-- add loadout items
		local loadout_items = loadout_choice.items
		for item_id,loadout_item in ipairs( loadout_items ) do
			if ( tostring( type( loadout_item ) ) ~= "table" ) then
				local item_entity = EntityLoad( loadout_item )
				EntityAddChild( inventory, item_entity )
			else
				local amount = loadout_item.amount or 1
				
				for i=1,amount do
					local item_option = ""
					
					if ( loadout_item.options ~= nil ) then
						local item_options = loadout_item.options
						local item_options_rnd = Random( 1, #item_options )
						
						item_option = item_options[item_options_rnd]
					else
						item_option = loadout_item[1]
					end
					
					local item_entity = EntityLoad( item_option )
					if item_entity then
						EntityAddChild( inventory, item_entity )
					end
				end
			end
		end
	end
	
	-- spawn two perks
	if ( loadout_choice.perks ~= nil ) then
		for i,perk_name in ipairs( loadout_choice.perks ) do
			local perk_entity = perk_spawn( x, y, perk_name )
			if ( perk_entity ~= nil ) then
				perk_pickup( perk_entity, player_entity, EntityGetName( perk_entity ), false, false )
			end
		end	
	end
	
	-- perk_pickup( perk_entity, player_entity, EntityGetName( perk_entity ), false, false )
	perk_pickup( "GLOBAL_GORE", player_entity, EntityGetName("GLOBAL_GORE"), false, false )
	perk_pickup( "VAMPIRISM", player_entity, EntityGetName("VAMPIRISM"), false, false )
	perk_pickup( "CHAINSAW", player_entity, EntityGetName("CHAINSAW"), false, false )
	perk_pickup( "ATTACK_FOOT", player_entity, EntityGetName("ATTACK_FOOT"), false, false )
	perk_pickup( "REPELLING_CAPE", player_entity, EntityGetName("REPELLING_CAPE"), false, false )
	perk_pickup( "STAINLESS_ARMOUR", player_entity, EntityGetName("STAINLESS_ARMOUR"), false, false )
	perk_pickup( "FREEZE_FIELD", player_entity, EntityGetName("FREEZE_FIELD"), false, false )
	perk_pickup( "WAND_EXPERIMENTER", player_entity, EntityGetName("WAND_EXPERIMENTER"), false, false )
	perk_pickup( "GLASS_CANNON", player_entity, EntityGetName("GLASS_CANNON"), false, false )
	perk_pickup( "INVISIBILITY", player_entity, EntityGetName("INVISIBILITY"), false, false )
	perk_pickup( "ELECTRICITY", player_entity, EntityGetName("ELECTRICITY"), false, false )
	perk_pickup( "BREATH_UNDERWATER", player_entity, EntityGetName("BREATH_UNDERWATER"), false, false )
	perk_pickup( "UNLIMITED_SPELLS", player_entity, EntityGetName("UNLIMITED_SPELLS"), false, false )
	perk_pickup( "SEA_WATER", player_entity, EntityGetName("SEA_WATER"), false, false )
	perk_pickup( "SPEED_DIVER", player_entity, EntityGetName("SPEED_DIVER"), false, false )
	perk_pickup( "WORM_ATTRACTOR", player_entity, EntityGetName("WORM_ATTRACTOR"), false, false )
	perk_pickup( "PROTECTION_MELEE", player_entity, EntityGetName("PROTECTION_MELEE"), false, false )
	perk_pickup( "LEVITATION_TRAIL", player_entity, EntityGetName("LEVITATION_TRAIL"), false, false )
	perk_pickup( "PROJECTILE_HOMING", player_entity, EntityGetName("PROJECTILE_HOMING"), false, false )
	perk_pickup( "NO_WAND_EDITING", player_entity, EntityGetName("NO_WAND_EDITING"), false, false )
	perk_pickup( "MOVEMENT_FASTER", player_entity, EntityGetName("MOVEMENT_FASTER"), false, false )
	perk_pickup( "LOW_HP_DAMAGE_BOOST", player_entity, EntityGetName("LOW_HP_DAMAGE_BOOST"), false, false )
	perk_pickup( "BLEED_OIL", player_entity, EntityGetName("BLEED_OIL"), false, false )
	perk_pickup( "TRICK_BLOOD_MONEY", player_entity, EntityGetName("TRICK_BLOOD_MONEY"), false, false )
	perk_pickup( "EXTRA_MONEY_TRICK_KILL", player_entity, EntityGetName("EXTRA_MONEY_TRICK_KILL"), false, false )
	perk_pickup( "EXTRA_MONEY", player_entity, EntityGetName("EXTRA_MONEY"), false, false )
	perk_pickup( "STRONG_KICK", player_entity, EntityGetName("STRONG_KICK"), false, false )
	perk_pickup( "PROTECTION_FIRE", player_entity, EntityGetName("PROTECTION_FIRE"), false, false )
	perk_pickup( "PROTECTION_EXPLOSION", player_entity, EntityGetName("PROTECTION_EXPLOSION"), false, false )
	perk_pickup( "NUKE", player_entity, EntityGetName("NUKE"), false, false )
	perk_pickup( "DISC_BULLET", player_entity, EntityGetName("DISC_BULLET"), false, false )
	perk_pickup( "DISC_BULLET_BIG", player_entity, EntityGetName("DISC_BULLET_BIG"), false, false )


	GamePrintImportant( "You're " .. loadout_name .. "!", "" )
end

-- Stainable sprites should have a corresponding SPRITE_NAME_uv_src.png next to the sprite file, and the folder containing the sprite should be passed to ModDevGenerateSpriteUVsForDirectory().
-- For example for 'player.png' the corresponding UV source file is called 'player_uv_src.png'
-- ModDevGenerateSpriteUVsForDirectory() must be called in init.lua file scope. It doesn't do anything outside noita_dev.exe.
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/fire" )
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/slime" )
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/summoner" )
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/thunder" )
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/eldritch" )
ModDevGenerateSpriteUVsForDirectory( "mods/mymod/files/butcher" )
dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

function get_random_from( target )
	local rnd = Random(1, #target)
	
	return tostring(target[rnd])
end

function get_random_between_range( target )
	local minval = target[1]
	local maxval = target[2]
	
	return Random(minval, maxval)
end

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )

local ability_comp = EntityGetFirstComponent( entity_id, "AbilityComponent" )

local wand = { }
wand.name = {"eldritch_wand"}
wand.deck_capacity = {2,3}
wand.actions_per_round = 1
wand.reload_time = {30,40}
wand.shuffle_deck_when_empty = 1
wand.fire_rate_wait = {20,30}
wand.spread_degrees = {3,8}
wand.speed_multiplier = 0.75
wand.mana_charge_speed = {10,30}
wand.mana_max = {100,120}

local mana_max = get_random_between_range( wand.mana_max )
local deck_capacity = get_random_between_range( wand.deck_capacity )

ComponentSetValue( ability_comp, "ui_name", get_random_from( wand.name ) )

ComponentObjectSetValue( ability_comp, "gun_config", "reload_time", get_random_between_range( wand.reload_time ) )
ComponentObjectSetValue( ability_comp, "gunaction_config", "fire_rate_wait", get_random_between_range( wand.fire_rate_wait ) )
ComponentSetValue( ability_comp, "mana_charge_speed", get_random_between_range( wand.mana_charge_speed ) )

ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", wand.actions_per_round )
ComponentObjectSetValue( ability_comp, "gun_config", "deck_capacity", deck_capacity )
ComponentObjectSetValue( ability_comp, "gun_config", "shuffle_deck_when_empty", wand.shuffle_deck_when_empty )
ComponentObjectSetValue( ability_comp, "gunaction_config", "spread_degrees", get_random_between_range( wand.spread_degrees ) )
ComponentObjectSetValue( ability_comp, "gunaction_config", "speed_multiplier", wand.speed_multiplier )

ComponentSetValue( ability_comp, "mana_max", mana_max )
ComponentSetValue( ability_comp, "mana", mana_max )

if ( Random(1,20) == 1 ) then
	wand.actions_per_round = 2
	
	ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", wand.actions_per_round )
end

local action_count = Random(1,2)

for i=1,action_count do
	if ( Random(1,6) == 1 ) then
		AddGunAction( entity_id, "TENTACLE_TIMER" )
	else
		AddGunAction( entity_id, "TENTACLE" )
	end
end

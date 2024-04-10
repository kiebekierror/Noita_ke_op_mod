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
wand.name = {"summoner_wand"}
wand.deck_capacity = {30,30}
wand.actions_per_round = 30
wand.reload_time = {1,1}
wand.shuffle_deck_when_empty = 1
wand.fire_rate_wait = {1,1}
wand.spread_degrees = 0
wand.speed_multiplier = 1
wand.mana_charge_speed = {999999,999999}
wand.mana_max = {99999,99999}
wand.actions = { "PEBBLE" }

local mana_max = get_random_between_range( wand.mana_max )
local deck_capacity = get_random_between_range( wand.deck_capacity )

ComponentSetValue( ability_comp, "ui_name", get_random_from( wand.name ) )

ComponentObjectSetValue( ability_comp, "gun_config", "reload_time", get_random_between_range( wand.reload_time ) )
ComponentObjectSetValue( ability_comp, "gunaction_config", "fire_rate_wait", get_random_between_range( wand.fire_rate_wait ) )
ComponentSetValue( ability_comp, "mana_charge_speed", get_random_between_range( wand.mana_charge_speed ) )

ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", wand.actions_per_round )
ComponentObjectSetValue( ability_comp, "gun_config", "deck_capacity", deck_capacity )
ComponentObjectSetValue( ability_comp, "gun_config", "shuffle_deck_when_empty", wand.shuffle_deck_when_empty )
ComponentObjectSetValue( ability_comp, "gunaction_config", "spread_degrees", wand.spread_degrees )
ComponentObjectSetValue( ability_comp, "gunaction_config", "speed_multiplier", wand.speed_multiplier )

ComponentSetValue( ability_comp, "mana_max", mana_max )
ComponentSetValue( ability_comp, "mana", mana_max )


--AddGunActionPermanent( entity_id, wand_action )

AddGunActionPermanent( entity_id, "SPREAD_REDUCE" )
AddGunActionPermanent( entity_id, "SPEED" )
AddGunActionPermanent( entity_id, "RECHARGE" )

AddGunAction( entity_id, "TORCH_ELECTRIC" )
AddGunAction( entity_id, "HOMING_SHORT" )
AddGunAction( entity_id, "NOLLA" )
AddGunAction( entity_id, "LONG_DISTANCE_CAST" )
AddGunAction( entity_id, "LONG_DISTANCE_CAST" )
AddGunAction( entity_id, "CRUMBLING_EARTH_PROJECTILE" )
AddGunAction( entity_id, "FLOATING_ARC" )
AddGunAction( entity_id, "CLIPPING_SHOT" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "ALCOHOL_BLAST" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "HITFX_EXPLOSION_SLIME_GIGA" )
AddGunAction( entity_id, "HITFX_EXPLOSION_ALCOHOL_GIGA" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "THUNDER_BLAST" )
AddGunAction( entity_id, "EXPLOSION" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "DEATH_CROSS_BIG" )
AddGunAction( entity_id, "LASER" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "CHAIN_BOLT" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "LIGHT_BULLET" )
AddGunAction( entity_id, "LIGHT_BULLET_TRIGGER_2" )
AddGunAction( entity_id, "LANCE" )
AddGunAction( entity_id, "LANCE_HOLY" )
AddGunAction( entity_id, "HOLYLANCE" )
AddGunAction( entity_id, "LANCEHOLY" )
-- AddGunAction( entity_id, "LASER_EMITTER" )
-- AddGunAction( entity_id, "LASER_EMITTER_CUTTER" )
-- AddGunAction( entity_id, "LASER_EMITTER_FOUR" )
-- AddGunAction( entity_id, "LASER_EMITTER_RAY" )
-- AddGunAction( entity_id, "LASER_EMITTER_WIDER" )

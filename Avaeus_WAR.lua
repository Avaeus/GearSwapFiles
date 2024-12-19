--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "8"
MacroBook = "4"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- This determines if a WS set is augmented with a sash
Elemental_WS = S{'Aeolian Edge', 'Seraph Blade', 'Shining Blade','Red Lotus Blade', 'Burning Blade', 'Sanguine Blade', 'Energy Drain','Energy Steal','Cyclone','Gust Slash'}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','PDL','ACC','DT','PDT','MEVA','CRIT')

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

--Weapons options
state.WeaponMode:options('Chango','Shining One','Savage Blade','Decimation', 'Aeolian Edge', 'Ukonvasara','Unlocked')
state.WeaponMode:set('Chango')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Chango'] = {}
	sets.Weapons['Shining One'] = {}
	sets.Weapons['Savage Blade'] = {}
	sets.Weapons['Decimation'] = {}
	sets.Weapons['Aeolian Edge'] = {}
	sets.Weapons['Ukonvasara'] = {}
	-- This stops GS from chaning weapons (Abyssea Proc etc)
	sets.Weapons['Unlocked'] ={}
	-- This is used when you do not have dual wield and is not a two handed weapon
	sets.Weapons.Shield = {}

	-- Base set for when the player is not engaged or casting.  Other sets build off this set
	sets.Idle = {
        head="Walahra Turban",
        body="Haubergeon",
        hands="Iron Mittens",
        legs="Dst. Breeches",
        feet="Beak Ledelsens",
        neck="Focus Collar",
        waist="Marid Belt",
        left_ear="Fang Earring",
    }

	sets.Idle.DT = {}
	sets.Idle.PDT = {}
	sets.Idle.MEVA = set_combine(sets.Idle,{})

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {}

	--WAR Double attack
	--28% Job Trait
	--5% Merits

	-- Sets the base equipset for OffenseMode
	sets.OffenseMode = {
        head="Walahra Turban",
        body="Haubergeon",
        hands="Iron Mittens",
        legs="Dst. Breeches",
        feet="Beak Ledelsens",
        neck="Focus Collar",
        waist="Marid Belt",
        left_ear="Fang Earring",
		back="Smilodon Mantle",
    }

	sets.OffenseMode.TP = set_combine( sets.OffenseMode, {
        head="Walahra Turban",
        body="Haubergeon",
        hands="Iron Mittens",
        legs="Dst. Breeches",
        feet="Beak Ledelsens",
        neck="Focus Collar",
        waist="Marid Belt",
        left_ear="Fang Earring",
		back="Smilodon Mantle",
    })

	sets.OffenseMode.DT = set_combine( sets.OffenseMode, {})

	sets.OffenseMode.PDL = set_combine( sets.OffenseMode, {})

	--This set is used when OffenseMode is ACC and Enaged
	sets.OffenseMode.ACC = {}

	--This set is used when OffenseMode is CRIT and Engaged
	sets.OffenseMode.CRIT = {}

	sets.OffenseMode.MEVA = {}

	--These base set are used when an aftermath is active and player is enaged and correct weapon type set (Augments the current OffenseMode)
	--If you don't specify a weapon mode it will use it regardless of Mythic,Empy,Relic,Aeonic

	sets.OffenseMode.AM = {}  -- This is for Relic AM only
	sets.OffenseMode.AM1 = {} -- All AM1 Types
	sets.OffenseMode.AM2 = {} -- All AM2 Types
	sets.OffenseMode.AM3 = {} -- All AM3 Types

	-- This is how you specify a Weapon Mode AM set by Weapon Mode (examples)
	sets.OffenseMode.AM['Bravura'] = {}
	sets.OffenseMode.AM1['Ukonvasara'] = {}
	sets.OffenseMode.AM2['Ukonvasara'] = {}
	sets.OffenseMode.AM3['Ukonvasara'] = {}
	sets.OffenseMode.AM3['Farsha'] = {}
	sets.OffenseMode.AM1['Conqueror'] = {}
	sets.OffenseMode.AM2['Laphria'] = {}

	sets.DualWield = {}

	sets.Precast = set_combine(sets.Idle, {})

	-- For Cure Cast Time reduction
	sets.Precast.Cure = {}

	-- For Enhancing Cast Time reduction
	sets.Precast.Enhancing = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {} --44%

	-- For instant casts (Like Raises/Reraise)
	sets.Precast.QuickMagic = {}

	sets.Precast.Enmity = {} --91

	sets.Precast['Utsusemi: Ichi'] = {}
	sets.Precast['Utsusemi: Ni'] = {}

	-- Ranged Attack
	sets.Precast.RA = {}
    sets.Precast.RA.ACC = {}
	sets.Precast.RA.Flurry = {}
	sets.Precast.RA.Flurry_II = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Enhancing
	sets.Midcast.Enhancing = {}
	sets.Midcast.Enhancing.Others = {}
	
	-- Enfeebling
	sets.Midcast.Enfeebling = {}
	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = {}
	-- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = {}
	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = {}

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {}
    sets.Midcast.RA.ACC = {}
    sets.Midcast.RA.PDL = {}
	sets.Midcast.RA.CRIT = {}
	sets.Midcast.RA.AM3 = {}

	-- Healing
	sets.Midcast.Cure = {}
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.Regen = {}

	-- Dancer JA
	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, {})
	sets.Step = set_combine(sets.OffenseMode.DT, {})
	sets.Waltz = set_combine(sets.OffenseMode.DT, {})

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {}
	sets.Midcast['Utsusemi: Ichi'] = {}
	sets.Midcast['Utsusemi: Ni'] = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Mighty Strikes"] = {}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Tomahawk"] = {} -- Need to add feet
	sets.JA["Retaliation"] = {}
	sets.JA["Restraint"] = {}
	sets.JA["Blood Rage"] = {}
	sets.JA["Brazen Rush"] = {}

	--Default WS set base
	sets.WS = {
		head="Celata",
		body="Haubergeon",
		hands="Iron Mittens",
		legs="Dst. Breeches",
		feet="Beak Ledelsens",
		neck="Armiger's Lace",
		waist="Swordbelt",
		left_ear="Fang Earring",
		left_ring="Empress Band",
		right_ring="Echad Ring",
		back="Smilodon Mantle",
	}
	sets.WS.RA = {}

	sets.WS.WSD = {}
	sets.WS.WSD.RA = {}

	-- Modes
	sets.WS.CRIT = {}
	sets.WS.CRIT.RA = {}

	sets.WS.ACC = {}
	sets.WS.ACC.RA = {}

	sets.WS.SB = {}
	sets.WS.SB.RA = {}

	sets.WS.PDL = {}
	sets.WS.PDL.RA = {}

	--These set are used when a weaponskill is used with that level of aftermath with the correct weapon
	--They Augment any built weaponskill set - Same formatting as the OffenseModes
	sets.WS.AM = {}
	sets.WS.AM1 = {}
	sets.WS.AM2 = {}
	sets.WS.AM3 = {}
	sets.WS.AM1['Ukonvasara'] = {}
	sets.WS.AM2['Ukonvasara'] = {}
	sets.WS.AM3['Ukonvasara'] = {}

	sets.WS.AM.RA = {}
	sets.WS.AM1.RA = {}
	sets.WS.AM2.RA = {}
	sets.WS.AM3.RA = {}
	sets.WS.AM1.RA['Ukonvasara'] = {}
	sets.WS.AM2.RA['Ukonvasara'] = {}
	sets.WS.AM3.RA['Ukonvasara'] = {}

	--Axe WS
	sets.WS["Ragin Axe"] = {}
	sets.WS["Smash Axe"] = {}
	sets.WS["Gale Axe"] = {}
	sets.WS["Avalanche Axe"] = {}
	sets.WS["Spinning Axe"] = {}
	sets.WS["Rampage"] = {}
	sets.WS["Calamity"] = {}
	sets.WS["Mistral Axe"] = {}
	sets.WS["Decimation"] = sets.WS.CRIT
	sets.WS["Bora Axe"] = {}
	sets.WS["Cloudsplitter"] = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Polearm
	sets.WS["Impulse Drive"] = sets.WS.CRIT
	sets.WS["Leg Sweep"] = {}

	sets.TreasureHunter = {}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end

function user_file_unload()
	
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if not buffactive['Berserk'] and ja_recasts[1] == 0 then
		buff = "Berserk"
	elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
		buff = "Aggressor"
	elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
		buff = "Warcry"
	end
	if player.sub_job == 'SAM' then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		end
	end
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function pet_change_custom(pet,gain)
	equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end
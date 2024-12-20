

--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
MacroBook = "3"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for TP
state.WeaponMode:options('Seraph Blade', 'Sanguine Blade', 'Chant du Cygne','Savage Blade', 'Eviceration', 'Aeolian Edge', 'Black Halo', 'Ullr', 'Unlocked')
state.WeaponMode:set('Sanguine Blade')

-- Goal 2100 hp and 1300 MP
function get_sets()

	-- ===================================================================================================================
	--		sets.Weapons
	-- ===================================================================================================================

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Seraph Blade'] ={}

	sets.Weapons['Sanguine Blade'] ={}

	sets.Weapons['Chant du Cygne'] ={}

	sets.Weapons['Savage Blade'] ={}

	sets.Weapons['Eviceration'] ={}

	sets.Weapons['Aeolian Edge'] ={}

	sets.Weapons['Black Halo'] ={}

	sets.Weapons['Ullr'] = {}

	sets.Weapons['Unlocked'] ={}

	--Shield used when melee and not dual wield.
	sets.Weapons.Shield = {}

	sets.Weapons.Sleep = {}

	--Default arrow to use
	Ammo.RA = "Beryllium Arrow"
	Ammo.ACC = "Beryllium Arrow"

	-- ===================================================================================================================
	--		sets.Idle
	-- ===================================================================================================================

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		head="Weath. Corona +1",
		body="Weather. Robe +1",
		hands="Weath. Cuffs +1",
		legs="Weath. Pants +1",
		feet="Weath. Souliers +1",
		neck="Jeweled Collar",
		waist="Marid Belt",
		left_ear="Phantom Earring",
		right_ear="Platinum Earring",
		left_ring="Empress Band",
		right_ring="Echad Ring",
		back="Smilodon Mantle",
	}
	-- Gear to swap out for Movement
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {}

	-- ===================================================================================================================
	--		sets.OffenseMode
	-- ===================================================================================================================

	sets.OffenseMode = {}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
		head="Walahra Turban",
		body="Warlock's Tabard",
		hands="Warlock's Gloves",
		legs="Warlock's Tights",
		feet="Warlock's Boots",
		neck="Wivre Gorget",
		waist="Marid Belt",
		left_ear="Phantom Earring",
		right_ear="Platinum Earring",
		left_ring="Crimson Ring",
		right_ring="Echad Ring",
		back="Smilodon Mantle",
	})
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {})

	sets.DualWield = {}

	-- ===================================================================================================================
	--		sets.Precast
	-- ===================================================================================================================

	-- Used for Magic Spells
	sets.Precast = {head="Warlock's Chapeau"}

	-- 50% Fast Cast is needed on RDM (Fast Cast V - 30%)
	sets.Precast.FastCast = {head="Warlock's Chapeau", legs="Orvail Pants +1",} -- 66% total Fast Cast (Lowered with Quick Magic)

	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {})

	sets.Precast.RA = set_combine(sets.Precast, {})	

	-- Only the bullet needs to be set for ACC sets (so that it will match the sets.Midcast.RA.ACC)
    sets.Precast.RA.ACC = set_combine(sets.Precast.RA, {})

	-- Flurry - 55 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {}) 

	-- Flurry II - 40 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { })

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {waist="Tarutaru Sash",
	back="Peace Cape",})

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {})

	-- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {})

	-- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {})

	-- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
		head="Weath. Corona +1",
		body="Weather. Robe +1",
		hands="Weath. Cuffs +1",
		legs="Weath. Pants +1",
		feet="Weath. Souliers +1",
		neck="Mohbwa Scarf",
		waist="Tarutaru Sash",
		left_ear="Phantom Earring",
		left_ring="Empress Band",
		right_ring="Echad Ring",
		back="Peace Cape",
	} -- 50% Cure I, 16% Cure II

	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})

	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {legs="Warlock's Tights"} -- 150% Duration

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {legs="Warlock's Tights"})

	-- Regen
	sets.Midcast.Regen = {}

	-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {})

	-- used to boost Gain Spells
	sets.Midcast.Enhancing.Gain = set_combine(sets.Midcast.Enhancing, {})

	-- Enfeebling
	sets.Midcast.Enfeebling = {body="Warlock's Tabard",}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})

	 -- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {})

	sets.Enspell = {}

	sets.Saboteur = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {})

	-- Spells that require SKILL - RDM only needs +500 skill except Temper II
	sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {}) -- Max Enhancing 672

	sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)
	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {body="Orvail Robe +1"})

	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})

	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Nuke = {
		head="Warlock's Chapeau",
		body="Warlock's Tabard",
		hands="Warlock's Gloves",
		legs="Warlock's Tights",
		feet="Warlock's Boots",
		neck="Jeweled Collar",
		waist="Tarutaru Sash",
		left_ear="Phantom Earring",
		back="Fed. Army Mantle",
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {})

	-- ===================================================================================================================
	--		sets.JA
	-- ===================================================================================================================

	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {}
	sets.JA["Saboteur"] = {}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}

	-- Dancer JA Section

	-------------------------------------------------------------------------------
	-- Flourishes provide buffs to the Dancer and debuffs to the target monster. --
	-------------------------------------------------------------------------------
	sets.Flourish = set_combine(sets.Idle.DT, {})

	-- Flourishes I : Monster Control																	
	sets.Flourish["Animated Flourish"] = set_combine(sets.Flourish, { }) 								-- Volatile Enmity spike like Provoke
	sets.Flourish["Desperate Flourish"] = set_combine(sets.Flourish, { })								-- Gravity effect 
	sets.Flourish["Violent Flourish"] = set_combine(sets.Flourish, { }) 								-- Stun effect 

	-- Flourishes II : Skillchain Enhancers																			
	sets.Flourish["Reverse Flourish"] = set_combine(sets.Flourish, { }) 								-- Returns TP in exchange for Finishing Moves
	sets.Flourish["Building Flourish"] = set_combine(sets.Flourish, { })								-- Increases the strength of the next Weapon Skill

	-------------------------------------------------------------------------------
	----------- Jigs duration can be increased using various equipment. ----------- 
	-------------------------------------------------------------------------------
	sets.Jig = set_combine(sets.Idle.DT, { })

	sets.Jig["Spectral Jig"] = sets.Jig
	sets.Jig["Chocobo Jig"] = sets.Jig

	-------------------------------------------------------------------------------
	----- Step Accuracy depends on your melee hit rate (including your normal -----
	---- Accuracy equipment). All Steps tested have shown an innate 10 Accuracy --- 
	-- bonus, which can be further enhanced through various pieces of equipment, -- 
	----------------------------- merits, and Presto. -----------------------------
	-------------------------------------------------------------------------------

	sets.Step = set_combine(sets.OffenseMode.DT, {})
	
	sets.JA["Quickstep"] = sets.Step
	sets.JA["Box Step"] = sets.Step
	sets.JA["Stutter Step"] = sets.Step

	sets.Samba = set_combine(sets.Idle.DT, {})

	sets.Samba["Haste Samba"] = {}
    sets.Samba["Drain Samba"] = {}
    sets.Samba["Drain Samba II"] = {}
	sets.Samba["Aspir Samba"] = {}

	-------------------------------------------------------------------------------
	-- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
	-------------------------------------------------------------------------------
	sets.Waltz = set_combine(sets.OffenseMode.DT, {}) -- 10% Potency

	sets.Waltz["Curing Waltz"] = sets.Waltz
	sets.Waltz["Curing Waltz II"] = sets.Waltz
	sets.Waltz["Curing Waltz III"] = sets.Waltz
	sets.Waltz["Divine Waltz"] = sets.Waltz
	sets.Waltz["Healing Waltz"] = sets.Waltz

	-- ===================================================================================================================
	--		sets.WS
	-- ===================================================================================================================

	sets.WS = {}

	sets.WS.ACC = {}

	sets.WS.PDL = set_combine(sets.WS, 
	{})

	sets.WS.WSD = set_combine(sets.WS, 
	{})

	sets.WS.MAB = set_combine(sets.WS, 
	{})

	sets.WS.CRIT = set_combine(sets.WS,{})

	sets.WS.RA = set_combine(sets.WS,{})

	sets.WS["Seraph Blade"] =  set_combine(sets.WS.MAB, {})

	sets.WS["Sanguine Blade"] = set_combine(sets.WS.MAB, {})

	sets.WS["Red Lotus Blade"] = sets.WS.MAB

	sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {})

	sets.WS["Chant du Cygne"] = sets.WS.CRIT

	sets.WS["Savage Blade"] = sets.WS.WSD

	sets.WS["Black Halo"] = sets.WS.WSD

	sets.TreasureHunter = {}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

Enspell_Buff = false

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
	if buffactive['Saboteur'] and spell.skill == 'Enfeebling Magic' then
		equipSet = sets.Saboteur
	end
	return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if not buffactive['Composure'] and spell.name ~=  "Composure" then
		--add_to_chat(8,'Composure is down')
	end
	coroutine.schedule(Enspell_Check,1) -- windower is not firing buff_change correctly with Enspells and has a delay

	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	Enspell_Check()
	return equipSet
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end

-- This function is called when the job file is unloaded
function user_file_unload()

end

function Enspell_Check()
	-- Tier I
	if buffactive["Enfire"] or buffactive["Enwater"] or buffactive["Enthunder"] or buffactive["Enstone"] or buffactive["Enblizzard"] or buffactive["Enaero"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	-- Tier II
	elseif buffactive["Enfire II"] or buffactive["Enwater II"] or buffactive["Enthunder II"] or buffactive["Enstone II"] or buffactive["Enblizzard II"] or buffactive["Enaero II"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	else
		Enspell_Buff = false
	end
end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'

	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'

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

local templates = WeaponFalloffTemplate.setup_weapon_falloff_templates()

local function PeaceTo57(PS)
  local FiveSeven = table.deep_map_copy(PS)

  FiveSeven.weapon_hold = "packrat"

  return FiveSeven
end

local origInit = WeaponTweakData.init
function WeaponTweakData:init(data)
  origInit(self, data)

  table.insert(self.peacemaker.categories, "snp")
  self.peacemaker.can_shoot_through_enemy = true
  self.peacemaker.can_shoot_through_shield = true
  self.peacemaker.can_shoot_through_wall = true
  self.peacemaker.damage_falloff = templates.SNIPER_FALL_HIGH
  -- self.peacemaker.NR_CLIPS_MAX = 2
  -- self.peacemaker.AMMO_MAX = self.peacemaker.CLIP_AMMO_MAX * self.peacemaker.NR_CLIPS_MAX
  self.peacemaker.stats.damage = 120
  self.peacemaker.stats_modifiers =
  {
    damage = 3
  }
  self.peacemaker.armor_piercing_chance = 1

  -- self.lemming = PeaceTo57(self.peacemaker)
end
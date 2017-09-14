require("/scripts/vec2.lua")

function init()
  -- self.baseMaxHealth = status.stat("maxHealth")
  -- self.baseMaxEnergy = status.stat("maxEnergy")
  --
  -- effect.addStatModifierGroup({
  --   -- base Attributes
  --   {stat = "isOmnivore", amount = 1},
  --   {stat = "maxHealth", amount = self.baseMaxHealth * config.getParameter("healthBonus")},
  --   {stat = "maxEnergy", amount = self.baseMaxEnergy * config.getParameter("energyBonus")},
  --   --{stat = "powerMultiplier", baseMultiplier = config.getParameter("attackBonus")},
  --   {stat = "protection", baseMultiplier = config.getParameter("defenseBonus")},
  --   -- resistances
  --   {stat = "physicalResistance", amount = config.getParameter("physicalResistance",0)},
  --   {stat = "electricResistance", amount = config.getParameter("electricResistance",0)},
  --   {stat = "fireResistance", amount = config.getParameter("fireResistance",0)},
  --   {stat = "iceResistance", amount = config.getParameter("iceResistance",0)},
  --   {stat = "poisonResistance", amount = config.getParameter("poisonResistance",0)},
  --   {stat = "shadowResistance", amount = config.getParameter("shadowResistance",0)},
  --   {stat = "cosmicResistance", amount = config.getParameter("cosmicResistance",0)},
  --   {stat = "radioactiveResistance", amount = config.getParameter("radioactiveResistance",0)},
  --   --other
  --   {stat = "foodDelta", baseMultiplier = 0.8}
  -- })
  --
  -- if not status.resource("energy") then -- make sure NPCs arent breaking this
  --   self.energyValue = 1
  -- end
  --
  -- local bounds = mcontroller.boundBox()
	-- if (world.type() == "scorchedcity") or (world.type() == "toxic") or (world.type() == "irradiated") then
	-- 	    status.setPersistentEffects("epicRoaches", {
	-- 	      {stat = "maxHealth", baseMultiplier = 1.25}
	-- 	    })
	-- end

  script.setUpdateDelta(5)
end

function update(dt)
	-- if (world.type() == "scorchedcity") or (world.type() == "toxic") or (world.type() == "irradiated") then
	-- 	mcontroller.controlModifiers({
	-- 			speedModifier = config.getParameter("speedBonus")
	-- 		})
	-- end
  status.removeEphemeralEffect("raceblattra")
end

function uninit()
  status.clearPersistentEffects("epicRoaches")
end

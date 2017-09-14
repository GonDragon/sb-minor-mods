require "/scripts/vec2.lua"

function init()
  self.maxSpeed = config.getParameter("maxSpeed")
  self.stopMult = config.getParameter("stopMult")
  self.aceleration = config.getParameter("aceleration")
  self.energyPerSecond = config.getParameter("energyPerSecond")

  idle()
end

function uninit()
  idle()
end

function update(args)
  
  if not canManeuver() then
    idle()
	return
  end

  local direction = checkDirection(args)
  
  if args.moves["jump"] then
	slowdown(args.dt)
  elseif self.state == "moving" then
    boost(direction, args.dt)
  end

end

function enoughEnergy(dt)
  return status.overConsumeResource("energy", self.energyPerSecond * dt)
end

function checkDirection(args)
  local direction = {0, 0}
  if args.moves["right"] then direction[1] = direction[1] + 1 end
  if args.moves["left"] then direction[1] = direction[1] - 1 end
  if args.moves["up"] then direction[2] = direction[2] + 1 end
  if args.moves["down"] then direction[2] = direction[2] - 1 end
  
  if vec2.eq(direction, {0, 0}) then
    idle()
  else
    self.state = "moving"
	direction = vec2.norm(direction)
  end
  
  return direction

end

function canManeuver()
  return mcontroller.zeroG()
end

function slowdown(dt)
  if not enoughEnergy(dt) then 
    idle()
    return
  end

  local vel = mcontroller.velocity()
  local acel = vec2.mul(vec2.norm(vel), -1 * self.stopMult * math.sqrt(vec2.mag(vel)))
  local newVel = vec2.add(vel, vec2.mul(acel, dt))
  mcontroller.setVelocity(newVel)
  
  animator.setParticleEmitterActive("mmuParticles", true)
  
end

function boost(direction, dt)
  if not enoughEnergy(dt) then 
    idle()
    return
  end

  local vel = mcontroller.velocity()
  local addedVel = vec2.mul(direction, self.aceleration * dt)
  local newVel = vec2.add(vel, addedVel)
  
  if vec2.mag(newVel) > self.maxSpeed then
    newVel = vec2.mul(vec2.norm(newVel), self.maxSpeed)
  end
  
  mcontroller.setVelocity(newVel)
  
  if self.sound == "none" then
    self.sound = "move"
	animator.playSound("move",-1)
  end
  
  animator.setParticleEmitterActive("mmuParticles", true)
  
end

function idle()
  self.state = "idle"
  self.sound = "none"
  animator.stopAllSounds("move")
  animator.setParticleEmitterActive("mmuParticles", false)
end
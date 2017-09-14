function init()

end

function update(dt)
  if world.entitySpecies(entity.id()) == "blattra" then
		status.removeEphemeralEffect("raceblattra")
	end
end

local Potato = {
	type="Rooster",
	size=1, 
	image = nil
}

function Potato:new( ... )
	local newSpud = ... or {}
	setmetatable(newSpud, self)
	self.__index = self


	--newSpud.image = self:loadImages{}

	return newSpud
end --function Potato:new

function Potato:setSize(amount)
	self.size = amount
	return
end

function Potato:getPosition()
	return self.size
end

function Potato:setX(amount)
	if (self.image) then
		self.image.x = amount
	end
	return
end

function Potato:setY(amount)
	if (self.image) then 
		self.image.y = amount
	end

	return
end

function Potato:getImage()
	return self.image
end

function Potato:loadImages()

	--Here is where I can't get it to load the image
	self.image = display.newImageRect("Assets/potato.png", 60, 80 )
	self.image.x = 500
	self.image.y = 500
	return self.image
end

function Potato:destroy()
	self.alive = false
	display.remove(self.image)
	self = nil
end

return Potato
return classes['Object']:extend('Spring', {
	type2 = "Spring",
	width = 32,
	height = 16,
	init = function(self,x,y)
		self.super.init(self,x,y)
		self.power = 16
		self.animation = animations.init("assets/animations/spring/", "idle", 15, self)
	end,
	collision = function(self, obj, type)
		if not obj then return end
		if obj.type == 1 then return end
		
		obj.y = self.y-obj.height
		obj.momy = -self.power
		obj.flags.grounded = false
	end,
	draw = function(self)
		local img = self.animation.frames[self.animation.curAnim][self.animation.frame].image
		local width = img:getWidth()/2
		local height = img:getHeight()
		self.animation:draw(self.x, self.y, 0, 1,1,width,height)
		self.super.draw(self)
	end
})
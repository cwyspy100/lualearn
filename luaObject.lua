--下面是通过学习lua，从对象到类到继承的代码
--目录
--1.对象
--2.对象解读
--3.从对象到类
--4:继承的实现


--1.对象
--change object value
player = {health = 300}
function takeDamage(self,amount)
	self.health = self.health - amount
end
takeDamage(player,20)
print(player.health)

--add object value
player.name="zhangsan"

print(player.name)


--2.对象解读
--和上面的相同
player = {
	health = 300,

	takeDamage = function(self,amount)
		self.health = self.health - amount
	end
}

player.takeDamage(player,20)
print(player.health)


--3.从对象到类
Player = {}
function Player:Create(o)
	-- body
	o = o or {health=300}
	setmetatable(o,self)
	self.__index = self
	return o
end


function Player:takeDamage(amount)
	self.health = self.health - amount
end

playerA = Player:Create()
playerB = Player:Create()

--getmetatable(playerA).__index.takeDamage(playerA, 20)
playerA:takeDamage(20)
playerB:takeDamage(40)

print("playerA health:"..playerA.health)
print("playerB health:"..playerB.health)



--4:继承的实现
RMBPlayer = Player:Create()
function RMBPlayer:broadcast(message)
	-- body
	print(message)
end

function RMBPlayer:takeDamage(amount)
	-- body
	self.health = self.health - amount / (self.money /100)
end


vip = RMBPlayer:Create({money = 200})
vip:takeDamage(20)
vip:broadcast("vip:"..(vip.health))








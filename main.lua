local tapCount = 0
local fundo = display.newImageRect('fundo.jpg', 768/2.4, 1280/2.4)
local coruja = display.newImageRect('coruja.png', 40, 70)
local chao_nuvem = display.newImageRect('nuvem.png', 768/2.4, 240/2.4)
local barra = display.newRect(display.contentCenterX, 450, 220, 10)
local taptext = display.newText(tapCount, display.contentCenterX, 20, native.systemFont, 40)
local desempenho = display.newText('EXCELENT', display.contentCenterX, 50, native.systemFont, 20)

desempenho:setFillColor(255,255,255,0)
barra:setFillColor(255,255,255, 0)
fundo.x = display.contentCenterX
fundo.y = display.contentCenterY 

coruja.x = display.contentCenterX
coruja.y = 10

chao_nuvem.x = display.contentCenterX
chao_nuvem.y = display.contentCenterY+ 220

local fisica = require('physics')
fisica.start()

fisica.addBody(coruja, 'dynamic', {density=40, friction=1, bounce=0.5})
fisica.addBody(barra, "static", {friction=10})

local function empurrarCoruja()
	coruja:applyLinearImpulse(0, -400, coruja.x, coruja.y)
	tapCount = tapCount + 1
	taptext.text = tapCount
	if (tapCount % 2) == 0 then
		desempenho:setFillColor(255,255,255,1)
	else
		desempenho:setFillColor(255,255,255,0)
	end
end

coruja:addEventListener("tap", empurrarCoruja)
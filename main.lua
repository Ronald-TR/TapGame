--importando dependencias
local utils = require("bibliotecaUtilitaria")
local fisica = require('physics')
--end--
--declarando variaveis sensiveis ao escopo main
	--imagens
local fundo = display.newImageRect('fundo.jpg', 768/2.4, 1280/2.4)
local ponte = display.newImageRect('ponte.png', 120, 90)
local coruja = display.newImageRect('coruja.png', 40, 70)
local ponte_nuvem = display.newImageRect('nuvem2.png', 180, 120)
local chao_nuvem = display.newImageRect('nuvem.png', 768/2.4, 240/2.4)
	--end--
	--blocos de colisão
local chao_nuvem_soul = display.newRect(display.contentCenterX, 450, display.contentWidth, 10)
local ponte_soul = display.newRect(display.contentCenterX-50, 200, 40, 10)
local paredeEsquerda = display.newRect( 0, 0 , 10 ,display.contentHeight*2.1)
local paredeDireita = display.newRect(display.contentWidth, 0, 10, display.contentHeight*2.1)
	--end--
	--textos da tela com seus iteradores proprios--
taptext = display.newText(0, display.contentCenterX, 20, native.systemFont, 40)
desempenho = display.newText('', display.contentCenterX, 50, native.systemFont, 20)
	--end--
--end--

--cores
chao_nuvem_soul:setFillColor(255,255,255, 0)
paredeEsquerda:setFillColor(255,255,255, 0)
paredeDireita:setFillColor(255,255,255, 0)
ponte_soul:setFillColor(255,255,255,0)
ponte.alpha = 0.9
--end--

--coordenadas
fundo.x = display.contentCenterX
fundo.y = display.contentCenterY 
coruja.x = display.contentCenterX
coruja.y = 10
chao_nuvem.x = display.contentCenterX
chao_nuvem.y = display.contentCenterY+ 220
ponte_nuvem.x = display.contentCenterX-57
ponte_nuvem.y = 200
ponte.x = display.contentCenterX-59
ponte.y = 155
--end--

--fisica dos objetos
fisica.start()
fisica.addBody(coruja, 'dynamic', {density=40, friction=1, bounce=0.5})
fisica.addBody(chao_nuvem_soul, "static", {friction=10})
fisica.addBody(paredeEsquerda, "static", {friction=10})
fisica.addBody(paredeDireita, "static", {friction=10})
fisica.addBody(ponte_soul, "static", {friction=10})
--end--

--metodos
coruja.tap = utils.empurrar

--end--

--eventos
coruja:addEventListener("tap", coruja)
--end--
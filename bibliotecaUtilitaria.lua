--[[
para poder receber atributos do objeto dentro das funções do meu modulo externo
devo assignar no main (por exemplo) usando a notação de ponto e sem parenteses, exemplo:

objeto.funcao = MeuModulo.funcao

e ao chamar eu uso a notação dois pontos como deve ser usada corretamente

objeto:funcao()

desta forma, o parametro self se torna utilizavel dentro da funcao receptora
declarada como function objeto:funcao() end
]]--

--MODULO UTILS

local M = {}

function M:opaca( self )
	self.alpha = 0.5
	print('mudando alpha')
end

local function atualizaDica( indice )
	local frase = ''
	if (indice >= '10') and (indice <= '11') then
		frase = 'Vamos, entre...'
	end
	if (indice >= 40) and (indice <= 41) then
		frase = 'Não demore!'
	end
	if not (frase == '') then
		desempenho.alpha = 0
		transition.fadeIn( desempenho , { time=2000 } )
		desempenho.text = frase
		transition.fadeOut( desempenho , { time=2000, delay=5000 } )
	end
end

function M.empurrar( self, event )
	local x = 0
	local y = -800
	taptext.text = taptext.text + event.numTaps --atualiza o placar de toques na coruja
	atualizaDica(taptext.text)
	--aplica o impulso do x relativo apenas se for na parte superior do boneco
	if (event.y < self.y) then
		if (event.x > self.x) then
			x = -500 - (event.x - self.x)
		else
			x = 500 + (-event.x + self.x)
		end
	end
	self:applyLinearImpulse( x, y, self.x, self.y )
end

M.print = function()
	print("testando module")
end
return M
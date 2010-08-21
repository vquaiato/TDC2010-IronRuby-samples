require 'Calculos'
require 'Models'

include Calculos
include Models

class CalculadorDescontosRuby < CalculadorDeDescontos
	def CalcularDescontoPara(pedido)
		return 200
	end
end
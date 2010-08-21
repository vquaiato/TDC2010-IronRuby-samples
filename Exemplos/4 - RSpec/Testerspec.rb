require "rubygems"
require "spec"

require "Teste"

describe Teste::UmaClasse, "uma classe para testes" do
	it "deve retornar 2 para soma de 1 e 1" do
		resultado = Teste::UmaClasse.new.Soma 1,1
		resultado.should == 2
	end
	
	it "deve retornar 21 para soma 15 e 6" do
		resultado = Teste::UmaClasse.new.Soma 15,6
		resultado.should == 21
	end
	
	it "deve retornar 'TDC' para palavra 'tdc'" do
		resultado = Teste::UmaClasse.new.CaixaAlta 'tdc'
		resultado.should == 'TDC'
	end
end
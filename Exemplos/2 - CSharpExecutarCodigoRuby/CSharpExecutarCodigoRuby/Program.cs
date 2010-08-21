using System;
using System.Globalization;
using System.Text;
using Calculos;
using Models;

namespace CSharpExecutarCodigoRuby
{
    class Program
    {
        static void Main(string[] args)
        {
            var pedido = new Pedido();

            pedido.Add(new ItemPedido { Produto = "notebook", Quantidade = 1, ValorUnitario = 1500m });
            pedido.Add(new ItemPedido { Produto = "teclado", Quantidade = 5, ValorUnitario = 75.5m });
            pedido.Add(new ItemPedido { Produto = "monitor lcd", Quantidade = 20, ValorUnitario = 545m });

            Console.WriteLine("Total do Pedido: {0}", pedido.TotalDoPedido().ToString("C"));
            
            var desconto = RubyEngineCreator
                .GetRubyObject("calculador_descontos", "CalculadorDescontosRuby")
                .CalcularDescontoPara(pedido);
            
            Console.WriteLine("Total Desconto: {0}", desconto.ToString("C"));


            Console.ReadKey();
        }
    }
}
